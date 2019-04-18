package com.shiliu.movie.common.constants;

public interface ParamsErrMsgConstants {
    String MOBILE_REG = "^(0|86)?(13[0-9]|15[012356789]|17[013678]|18[0-9]|14[57])[0-9]{8}$";
    String PHONE_EMPTY_INPUT = "手机号码不能为空";
    String PHONE_FORMAT_INPUT = "手机号码格式不正确";

    String PASSWORD_NULL = "密码不能为空";
    String PASSWORD_AGAIN_SAME = "两次输入密码不一致";
    String SMS_CODE_NULL = "短信验证码不能为空";
}
