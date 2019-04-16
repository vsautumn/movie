package com.shiliu.movie.bussiness.bean.user;

import lombok.Data;

@Data
public class RegisterReq {
    private String mobile;
    private String password;
    private String confirm_password;
    private String sms_code;
    private String invitation_code;
}
