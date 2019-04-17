package com.shiliu.movie.common.utils.date;

import java.time.*;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

/**
 * java8 时间API封装
 */
public class ZonedDateTimeUtils {

    //北京时区
    public static final ZoneId GLOBLE_ZONEID = ZoneId.of("UTC+8");
    public static final String FORMAT_STR_MONTH = "yyyy-MM";
    public static final String FORMAT_STR_DATE = "yyyy-MM-dd";
    public static final String FORMAT_STR_DATE_TIME = "yyyy-MM-dd HH:mm:ss";
    public static final String FORMAT_STR_MONTH_SIMPLE = "yyyyMM";
    public static final String FORMAT_STR_DATE_SIMPLE = "yyyyMMdd";
    public static final String FORMAT_STR_DATE_TIME_SIMPLE = "yyyyMMddHHmmss";
    public static final String FORMAT_STR_YEAR_SIMPLE = "yyyy";

    /**
     * 获取当天0点的时间戳
     */
    public static long getTodayStartTimeStampOfLong() {
        return  ZonedDateTime.now(ZoneId.systemDefault()).withHour(0).withMinute(0).withSecond(0).withNano(0).toInstant().toEpochMilli();
    }

    /**
     * 获取次日0点的时间戳
     */
    public static long getTomorrowStartTimeStampOfLong() {
        return  ZonedDateTime.now(ZoneId.systemDefault()).withHour(0).withMinute(0).withSecond(0).withNano(0).plusDays(1).toInstant().toEpochMilli();
    }

    /**
     * 获取昨日0点的时间戳
     */
    public static long getYesterdayStartTimeStampOfLong() {
        return  ZonedDateTime.now(ZoneId.systemDefault()).withHour(0).withMinute(0).withSecond(0).withNano(0).minusDays(1).toInstant().toEpochMilli();
    }

    /**
     * 获取当前时间时间戳
     */
    public static long getCurrentTimeStampOfLong() {
        return ZonedDateTime.now(ZoneId.systemDefault()).toInstant().toEpochMilli();
    }

    /**
     * 获取当前时间的ZonedDateTime对象
     */
    public static ZonedDateTime getCurrentZonedDateTime() {
        return ZonedDateTime.now(ZoneId.systemDefault());
    }

    /**
     * 格式化时间
     */
    public static String formatTimeByFormatStr(ZonedDateTime input, String formatStr) {
        DateTimeFormatter dtf2 = DateTimeFormatter.ofPattern(formatStr);
        return dtf2.format(input);
    }

    /**
     * 反序列化时间
     */
    public static ZonedDateTime parseTimeByFormatStr(String timeStr, String formatStr) {
        DateTimeFormatter dtf2 = DateTimeFormatter.ofPattern(formatStr);
        LocalDateTime localDateTime = LocalDateTime.parse(timeStr,dtf2);
        localDateTime.atZone(GLOBLE_ZONEID);
        return localDateTime.atZone(GLOBLE_ZONEID);
    }

    /**
     * 毫秒数转ZonedDateTime
     */
    public static ZonedDateTime parseZonedDateTimeOfMillSecond(Long millTimeStamp) {
        Instant instant = Instant.ofEpochMilli(millTimeStamp);
        ZonedDateTime date = ZonedDateTime.ofInstant(instant, ZoneId.systemDefault());
        return date;
    }


    /**
     * 将时间戳转成具体格式的时间(时区为GLOBLE_ZONEID)
     *
     * @param millTimeStamp
     * @param formatStr
     * @return
     */
    public static String parseByMillSecond(Long millTimeStamp, String formatStr) {
        Instant instant = Instant.ofEpochMilli(millTimeStamp);
        ZonedDateTime date = ZonedDateTime.ofInstant(instant, GLOBLE_ZONEID);
        DateTimeFormatter dtf2 = DateTimeFormatter.ofPattern(formatStr);
        return dtf2.format(date);
    }

    /**
     * 计算当前日期与{@code endDate}的间隔天数
     *
     * @param endDate
     * @return 间隔天数
     */
    public static long until(ZonedDateTime endDate){
        return ZonedDateTime.now().until(endDate,ChronoUnit.DAYS);
    }

    /**
     * 计算当前开始日期与结束日期的间隔天数
     *
     * @param stratDate,endDate
     * @return 间隔天数
     */
    public static long until2(ZonedDateTime stratDate,ZonedDateTime endDate){
        return stratDate.until(endDate,ChronoUnit.DAYS);
    }

    /**
     * 获取几天后的日期
     * @param daysToAdd 增加的天数
     * @return
     */
    public static LocalDate getSomeDayAfter(int daysToAdd){
        LocalDate ld = LocalDate.now(GLOBLE_ZONEID);
        LocalDate ld2 = ld.plusDays(daysToAdd);
        return ld2;
    }

    public static String forMatLocalDate(String formatStr,LocalDate ld){
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern(formatStr);
        return ld.format(dtf);
    }
}
