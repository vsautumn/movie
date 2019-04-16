package com.shiliu.movie.bussiness.bean.base;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.shiliu.movie.common.exception.ErrorCode;
import lombok.Data;

@Data
@JsonIgnoreProperties(ignoreUnknown = true)
@JsonInclude(JsonInclude.Include.NON_NULL)
public class Result {
    // 返回错误码
    private Integer status;
    // 返回信息
    private String message;
    // 返回前端需要的json数据
    private Object data;

    public Result() {
    }

    public Result(Integer status) {
        this.status = status;
    }

    public Result(Integer status, String message) {
        this.status = status;
        this.message = message;
    }

    public Result(Integer status, String message, Object data) {
        this.status = status;
        this.message = message;
        this.data = data;
    }

    public static Result buildSuccess(Object data) {
        Result result = buildSuccess();
        result.setData(data);
        return result;
    }

    public static Result buildSuccess() {
        return new Result(ErrorCode.REQUEST_SUCCESS.getCode(),
                ErrorCode.REQUEST_SUCCESS.getMessage());
    }
}
