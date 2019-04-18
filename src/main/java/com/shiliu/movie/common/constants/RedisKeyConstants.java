package com.shiliu.movie.common.constants;

/**
 * rediskey相关常量
 */
public class RedisKeyConstants {

    /**
     * 60S内此手机发送短信验证码的次数KEY
     */

    public static final String TIMES_OF_SIXTY_SMS_SEND_KEY = "movie:validCode:minCount:";

    /**
     * 今日此手机发送短信验证码的次数KEY
     */
    public static final String TIMES_OF_TODAT_SMS_SEND_KEY = "movie:validCode:dayCount:";

    /**
     * 今日此手机发送短信验证码的KEY
     */
    public static final String SMS_SEND_KEY = "movie:validCode:";
}
