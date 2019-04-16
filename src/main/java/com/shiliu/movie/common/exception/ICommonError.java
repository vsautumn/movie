package com.shiliu.movie.common.exception;

public interface ICommonError {
    String getMessage();

    ICommonError setMessage(String message);

    Integer getCode();
}
