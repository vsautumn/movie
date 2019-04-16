package com.shiliu.movie.common.exception;

public enum ErrorCode implements ICommonError {
    REQUEST_SUCCESS(1, "操作成功！"),
    REQUEST_FAILED(0, "操作失败！"),
    SYSTEM_ERROR(0, "系统正忙，请稍后重试！"),
    EMPTY_INPUT(0, "入参不能为空"),
    PHONE_EMPTY_INPUT(0, "手机号不能为空"),
    PHONE_LENGTH_INPUT(0, "手机号长度不能超过11位"),
    PHONE_FORMAT_INPUT(0, "手机格式错误"),
    PHONE_REGISTERED(0, "该手机号已注册"),
    PASSWORD_NULL(0, "请设置密码"),
    PASSWORD_NOT_SAME(0, "两次输入的密码不一致"),
    OPERATION_FREQUENCY(0, "频繁操作，请稍后重试"),
    SEND_VALID_CODE_FAILED(0, "验证码发送失败，请您稍后再试"),
    SEND_VALID_CODE_FREQUENT(0, "验证码发送发送频繁，请您稍后再试"),
    VALID_CODE_INVALID(0, "验证码输入错误，请重新输入"),
    ACCOUNT_PASSWORD_ERROR(0, "帐号、密码错误，请重新输入"),
    ACCOUNT_ERROR(0, "帐号错误，请重新输入"),
    DATA_EXIST(0, "数据库中已存在该记录");

    private String message;
    private Integer code;

    ErrorCode(int code, String message) {
        this.message = message;
        this.code = code;
    }


    @Override
    public String getMessage() {
        return this.message;
    }

    @Override
    public ICommonError setMessage(String message) {
        this.message = message;
        return this;
    }

    @Override
    public Integer getCode() {
        return this.code;
    }
}
