package com.shiliu.movie.common.component.redis;

import com.shiliu.movie.common.constants.RedisKeyConstants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 图形验证码缓存 + 手机验证码缓存
 */
@Component
public class CaptchaRedisUtils {
    private static final Logger LOGGER = LoggerFactory.getLogger(CaptchaRedisUtils.class);

    @Autowired
    RedisUtils redisUtils;


    //【3】获取60s内查询短信发送次数的缓存key
    private String getSixtySendMsgTimesKey(String phone) {
        return RedisKeyConstants.TIMES_OF_SIXTY_SMS_SEND_KEY + phone;
    }

    /**
     * 【3】获取60s内查询短信发送次数的缓存Value
     */
    public String getSixtySendMsgTimesValue(String phone) {
        try {
            return redisUtils.get(getSixtySendMsgTimesKey(phone));
        } catch (Exception e) {
            LOGGER.error("getSixtySendMsgTimesValue-查询redis缓存失败");
            return null;
        }
    }

}
