package com.shiliu.movie.bussiness.bean.user;

import lombok.Data;

@Data
public class LoginReq {
    private String mobile;
    private String password;
    private String sms_code;
}
