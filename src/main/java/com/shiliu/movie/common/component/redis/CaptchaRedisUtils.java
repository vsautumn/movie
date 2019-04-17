package com.shiliu.movie.common.component.redis;

import com.shiliu.movie.common.constants.RedisKeyConstants;
import com.shiliu.movie.common.utils.date.ZonedDateTimeUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 手机验证码缓存
 */
@Component
public class CaptchaRedisUtils {
    private static final Logger LOGGER = LoggerFactory.getLogger(CaptchaRedisUtils.class);

    @Autowired
    RedisUtils redisUtils;


    //【1】获取60s内查询短信发送次数的缓存key
    private String getSixtySendMsgTimesKey(String phone) {
        return RedisKeyConstants.TIMES_OF_SIXTY_SMS_SEND_KEY + phone;
    }

    /**
     * 【3】校验手机验证码是否已经在redis中存在
     */
    public Boolean isValidSmsCodeExist(String mobile) {
        String validCodeKey = getSixtySendMsgTimesKey(mobile);
        if (redisUtils.hasKey(validCodeKey)) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 【1】获取60s内查询短信发送次数的缓存Value
     */
    public String getSixtySendMsgTimesValue(String phone) {
        try {
            return redisUtils.get(getSixtySendMsgTimesKey(phone));
        } catch (Exception e) {
            LOGGER.error("getSixtySendMsgTimesValue-查询redis缓存失败");
            return null;
        }
    }

    /**
     * 【1】设置60s内查询短信发送次数的缓存Value
     */
    public void setSixtySendMsgTimesValue(String phone, String value, Integer seconds) {
        try {
            redisUtils.set(getSixtySendMsgTimesKey(phone), value, seconds);
        } catch (Exception e) {
            LOGGER.error("setSixtySendMsgTimesValue-设置redis缓存失败");
        }
    }

    //【2】获取今天查询短信发送次数的缓存key
    private String getTodaySendMsgTimesKey(String phone) {
        String today = ZonedDateTimeUtils.formatTimeByFormatStr(ZonedDateTimeUtils.getCurrentZonedDateTime()
                , ZonedDateTimeUtils.FORMAT_STR_DATE_SIMPLE);
        StringBuilder sb = new StringBuilder();
        sb.append(RedisKeyConstants.TIMES_OF_TODAT_SMS_SEND_KEY).append(phone).append("_").append(today);
        return sb.toString();
    }

    /**
     * 【2】查询今天短信发送次数的缓存value
     */
    public String getTodaySendMsgTimesValue(String phone) {
        try {
            return redisUtils.get(getTodaySendMsgTimesKey(phone));
        } catch (Exception e) {
            LOGGER.error("getTodaySendMsgTimesValue-查询redis缓存失败");
            return null;
        }
    }

    /**
     * 【2】短信今天发送次数+1 并设置失效时间
     */
    public Long incrTodaySendMsgTimesValueAndExpire(String phone, Integer seconds) {
        try {
            String key = getTodaySendMsgTimesKey(phone);
            Long count = redisUtils.incr(key, 1);
            if (count.equals(1L)) {
                redisUtils.expire(key, seconds);
            }
            return count;
        } catch (Exception e) {
            LOGGER.error("incrTodaySendMsgTimesValueAndExpire-设置redis缓存失败");
            return null;
        }
    }

}
