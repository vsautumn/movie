package com.shiliu.movie.bussiness.bean.user;

import com.shiliu.movie.common.constants.ParamsErrMsgConstants;
import lombok.Data;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.Pattern;

@Data
public class RegisterReq {
    @NotBlank(message = ParamsErrMsgConstants.PHONE_EMPTY_INPUT)
    @Pattern(regexp = ParamsErrMsgConstants.MOBILE_REG, message = ParamsErrMsgConstants.PHONE_FORMAT_INPUT)
    private String mobile;

    @NotBlank(message = ParamsErrMsgConstants.PASSWORD_NULL)
    private String password;

    @NotBlank(message = ParamsErrMsgConstants.PASSWORD_NULL)
    private String confirm_password;

    @NotBlank(message = ParamsErrMsgConstants.SMS_CODE_NULL)
    private String sms_code;
    
    private String invitation_code;
}
