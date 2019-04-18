package com.shiliu.movie.common.component.sms;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.shiliu.movie.common.component.redis.CaptchaRedisUtils;
import com.shiliu.movie.common.component.redis.RedisUtils;
import com.shiliu.movie.common.constants.Constant;
import com.shiliu.movie.common.constants.RedisKeyConstants;
import com.shiliu.movie.common.constants.SmsConstants;
import com.shiliu.movie.common.exception.BusinessException;
import com.shiliu.movie.common.exception.ErrorCode;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Slf4j
@Service
public class SMSService {

    //@Value("${smsplat.url}")
    private String url;
    //@Value("${smsplat.accesskey}")
    private String accesskey;
    //@Value("${smsplat.secret}")
    private String secret;
    //@Value("${smsplat.templateId}")
    private String templateId;

    @Autowired
    CaptchaRedisUtils captchaRedisUtils;

    @Autowired
    private RedisUtils redisUtils;

    /**
     * 发送短信验证码
     *
     * @param mobile [参数]
     * @Time 2019/04/17
     */
    public void sendValidCode(String mobile) {
        // 1, 60秒内只能发送一次验证码校验及缓存处理
        String sixtyValueStr = captchaRedisUtils.getSixtySendMsgTimesValue(mobile);
        log.info("sixtyValueStr:{}", sixtyValueStr);
        // 判断是否已经存在该key
        if (captchaRedisUtils.isValidSmsCodeExist(mobile)) {
            throw new BusinessException(ErrorCode.SEND_VALID_CODE_FREQUENT);
        }

        // 2, 查询-当天发送短信的次数
        String todayCountStr = captchaRedisUtils.getTodaySendMsgTimesValue(mobile);
        Integer todayCount = StringUtils.isEmpty(todayCountStr) ? 0 : Integer.valueOf(todayCountStr);
        //超过5次提示操作频繁且不允许发送短信
        if (todayCount > Constant.SEND_VALIDCODE_THRESHOLD_DAY) {
            throw new BusinessException(ErrorCode.OPERATION_FREQUENCY);
        }
        // 3,发送验证码
        String newValidCode = createRandomCode();
        sendSMSSubmit(mobile, newValidCode);
        //3.发送成功后-验证码保存至redis 15分钟过期
        captchaRedisUtils.setSmsValidCodeValue(mobile, newValidCode, 900);
        log.info("newValidCode is {}.", newValidCode);

        // 设置每小时验证码发送记录
        Long time = System.currentTimeMillis();
        captchaRedisUtils.setSixtySendMsgTimesValue(mobile, time.toString(), 60);//设置60秒的key

        //设置当天的计数+1
        captchaRedisUtils.incrTodaySendMsgTimesValueAndExpire(mobile, 86400);
    }

    /**
     * 校验手机验证码
     *
     * @param mobile
     * @param smsCode
     */
    public boolean validSmsCode(String mobile, String smsCode) {
        // 从redis中获取验证码
        String trueValidCode = captchaRedisUtils.getSmsValidCodeValue(mobile);
        //1.判断验证码是否正确
        if (!smsCode.equals(trueValidCode)) {
            return false;
        }
        return true;
    }

    /**
     * 生成验证码
     *
     * @return 验证码:String
     */
    private String createRandomCode() {
        StringBuilder smsCode = new StringBuilder(6);
        for (int i = 0; i < 6; i++) {
            smsCode.append((int) (Math.random() * 9));
        }
        return smsCode.toString();
    }

    /**
     * 验证类通知类短信接口
     */
    public Map<String, Object> sendSMSSubmit(String mobile, String verifyCode) {

        String result = null;
        Map<String, Object> rem = null;
        try {
            Map<String, Object> mapJson = new HashMap<String, Object>();
            log.info("SMSService.sendSMSSubmit:  phone is {}, verifyCode is {}", mobile, verifyCode);
            mapJson.put("accesskey", accesskey);
            mapJson.put("secret", secret);
            mapJson.put("templateId", templateId);
            mapJson.put("sign", SmsConstants.CONTENT_SIGN);
            mapJson.put("mobile", mobile);
            mapJson.put("content", verifyCode);
            String jsons = JSON.toJSONString(mapJson);
            result = SendSMS.sendPost2(url, jsons);
            log.info("SMSService.sendSMSSubmit: phone is {}, verifyCode is {}, result is {}", mobile, verifyCode, result);

            rem = (Map<String, Object>) JSONObject.parse(result);
        } catch (Exception e) {
            log.error("发送短信失败，访问地址：" + url, e);
            rem = new HashMap<String, Object>();
            rem.put("retCode", "9999");
            rem.put("retMessage", e.getMessage());
        }
        return rem;
    }
}
