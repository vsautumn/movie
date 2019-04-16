package com.shiliu.movie.controller.user;

import com.shiliu.movie.bussiness.bean.user.LoginReq;
import com.shiliu.movie.bussiness.bean.user.RegisterReq;
import com.shiliu.movie.bussiness.bean.base.Result;
import com.shiliu.movie.bussiness.validate.UserValidate;
import com.shiliu.movie.common.component.security.AuthService;
import com.shiliu.movie.common.component.sms.SMSService;
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
//    @Autowired
//    UserService userService;

    @Autowired
    SMSService smsService;

    @Autowired
    AuthService authService;

    /**
     * 用户注册的方法
     *
     * @param registerReq
     * @return
     */
    @PostMapping(value = "/register")
    public Result register(@RequestBody RegisterReq registerReq) {
        //return userService.register(registerReq);
        return null;
    }

    @PostMapping(value = "/login")
    public Result login(@RequestBody LoginReq loginReq) {
        return null;
        //return userService.login(loginReq);
    }

    @PostMapping(value = "/smsCodeLogin")
    public Result smsCodeLogin(@RequestBody LoginReq loginReq) {
        //return userService.smsCodeLogin(loginReq);
        return null;
    }

    /**
     * 发送短信验证码
     *
     * @param loginReq [参数]
     * @return Result [用户信息列表信息]
     * @author chenwen
     * @Time 2019/04/17
     */
    @PostMapping(value = "/send")
    public Result sendSMS(@RequestBody LoginReq loginReq) {
        // 参数校验
        UserValidate.validateSendValidCodeParam(loginReq);
        // 发送验证码
        smsService.sendValidCode(loginReq.getMobile());
        return Result.buildSuccess();
    }

}
