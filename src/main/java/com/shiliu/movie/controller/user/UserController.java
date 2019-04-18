package com.shiliu.movie.controller.user;

import com.shiliu.movie.bussiness.bean.base.Result;
import com.shiliu.movie.bussiness.bean.user.LoginReq;
import com.shiliu.movie.bussiness.bean.user.RegisterReq;
import com.shiliu.movie.bussiness.bean.user.SendSmsReq;
import com.shiliu.movie.bussiness.bean.user.SmsCodeLoginReq;
import com.shiliu.movie.bussiness.service.user.UserService;
import com.shiliu.movie.bussiness.validator.ValidationResult;
import com.shiliu.movie.bussiness.validator.ValidatorService;
import com.shiliu.movie.common.component.security.AuthService;
import com.shiliu.movie.common.component.sms.SMSService;
import com.shiliu.movie.common.exception.BusinessException;
import com.shiliu.movie.common.exception.ErrorCode;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/api/movie")
public class UserController {
    @Autowired
    UserService userService;

    @Autowired
    SMSService smsService;

    @Autowired
    AuthService authService;

    @Autowired
    ValidatorService validatorService;

    /**
     * 用户注册的方法
     *
     * @param registerReq
     * @return
     */
    @PostMapping(value = "/register")
    public Result register(@RequestBody RegisterReq registerReq) {
        ValidationResult validationResult = validatorService.validate(registerReq);
        if (validationResult.isHasErrors()) {
            throw new BusinessException(ErrorCode.PARAMETER_VALIDATION_ERROR, validationResult.getErrorMsg());
        }
        // 两次密码输入不一致单独验证
        if (!registerReq.getPassword().equals(registerReq.getConfirm_password()))
        {
            throw new BusinessException(ErrorCode.PASSWORD_NOT_SAME, ErrorCode.PASSWORD_NOT_SAME.getMessage());
        }

        return userService.register(registerReq);
    }

    @PostMapping(value = "/login")
    public Result login(@RequestBody LoginReq loginReq) {
        ValidationResult validationResult = validatorService.validate(loginReq);
        if (validationResult.isHasErrors()) {
            throw new BusinessException(ErrorCode.PARAMETER_VALIDATION_ERROR, validationResult.getErrorMsg());
        }
        return null;
        //return userService.login(loginReq);
    }

    @PostMapping(value = "/smsCodeLogin")
    public Result smsCodeLogin(@RequestBody SmsCodeLoginReq smsCodeLoginReq) {
        ValidationResult validationResult = validatorService.validate(smsCodeLoginReq);
        if (validationResult.isHasErrors()) {
            throw new BusinessException(ErrorCode.PARAMETER_VALIDATION_ERROR, validationResult.getErrorMsg());
        }
        //return userService.smsCodeLogin(loginReq);
        return null;
    }

    /**
     * 发送短信验证码
     *
     * @param sendSmsReq [参数]
     * @return Result [用户信息列表信息]
     * @Time 2019/04/17
     */
    @PostMapping(value = "/send")
    public Result sendSMS(@RequestBody SendSmsReq sendSmsReq) {
        ValidationResult validationResult = validatorService.validate(sendSmsReq);
        if (validationResult.isHasErrors()) {
            throw new BusinessException(ErrorCode.PARAMETER_VALIDATION_ERROR, validationResult.getErrorMsg());
        }
        // 发送验证码
        smsService.sendValidCode(sendSmsReq.getMobile());
        return Result.buildSuccess();
    }

}
