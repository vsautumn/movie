package com.shiliu.movie.common.component.sms;

import com.shiliu.movie.common.component.redis.CaptchaRedisUtils;
import com.shiliu.movie.common.component.redis.RedisUtils;
import com.shiliu.movie.common.constants.RedisKeyConstants;
import com.shiliu.movie.common.exception.BusinessException;
import com.shiliu.movie.common.exception.ErrorCode;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class SMSService {
    @Autowired
    CaptchaRedisUtils captchaRedisUtils;

    @Autowired
    private RedisUtils redisUtils;

    /**
     * 发送短信验证码
     *
     * @param mobile [参数]
     * @author chenwen
     * @Time 2019/04/17
     */
    public void sendValidCode(String mobile) {
        // 60秒内只能发送一次验证码校验及缓存处理
        String sixtyValueStr = captchaRedisUtils.getSixtySendMsgTimesValue(mobile);
        log.info("sixtyValueStr:{}", sixtyValueStr);

        // 判断是否已经存在该key
        String validCodeKey = getValidCodeKey(mobile);
        if (redisUtils.hasKey(validCodeKey)) {
            throw new BusinessException(ErrorCode.SEND_VALID_CODE_FREQUENT);
        }

        String newValidCode = createRandomCode();
        log.info("newValidCode is {}.", newValidCode);
        redisUtils.set(validCodeKey, newValidCode, RedisKeyConstants.SMS_SED_KEY_TTL);
    }

    public Boolean checkValidSmsCode(String mobile, String sms_code) {
        String redisSmsCode = redisUtils.get(getValidCodeKey(mobile));
        if (StringUtils.isNotBlank(redisSmsCode) && redisSmsCode.equals(sms_code)) {
            redisUtils.del(getValidCodeKey(mobile));
            return true;
        } else {
            return false;
        }
    }

    private String getValidCodeKey(String mobile) {
        return RedisKeyConstants.SMS_SEND_KEY + mobile;
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
}
