package com.shiliu.movie.bussiness.model.user;


public enum RoleType {
    normal(1, "普通用户"), admin(0, "管理员");

    private String message;
    private Integer code;

    RoleType(Integer code, String message) {
        this.message = message;
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }
}
