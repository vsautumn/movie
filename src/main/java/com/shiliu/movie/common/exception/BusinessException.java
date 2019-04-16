package com.shiliu.movie.common.exception;

/**
 * 包装器业务异常类实现
 */
public class BusinessException extends RuntimeException implements ICommonError {
    private ICommonError iCommonError;

    public BusinessException(ICommonError iCommonError) {
        super();
        this.iCommonError = iCommonError;
    }

    public BusinessException(ICommonError iCommonError, String message) {
        super();
        this.iCommonError = iCommonError;
        this.iCommonError.setMessage(message);
    }

    @Override
    public ICommonError setMessage(String message) {
        this.iCommonError.setMessage(message);
        return this;
    }

    @Override
    public Integer getCode() {
        return this.iCommonError.getCode();
    }

    @Override
    public String getMessage() {
        return this.iCommonError.getMessage();
    }
}
