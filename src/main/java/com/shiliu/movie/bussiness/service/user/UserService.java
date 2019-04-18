package com.shiliu.movie.bussiness.service.user;

import com.shiliu.movie.bussiness.bean.user.LoginReq;
import com.shiliu.movie.bussiness.bean.base.Result;
import com.shiliu.movie.bussiness.bean.user.RegisterReq;
import com.shiliu.movie.common.component.security.AuthService;
import com.shiliu.movie.common.component.sms.SMSService;
import com.shiliu.movie.common.component.token.UserTokenService;
import com.shiliu.movie.bussiness.model.user.UserToken;
import com.shiliu.movie.bussiness.mapper.user.UserMapper;
import com.shiliu.movie.bussiness.model.user.RoleType;
import com.shiliu.movie.bussiness.model.user.User;
import com.shiliu.movie.common.exception.BusinessException;
import com.shiliu.movie.common.exception.ErrorCode;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class UserService {

    @Autowired
    UserMapper userMapper;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    AuthService authService;

    @Autowired
    UserTokenService userTokenService;

    @Autowired
    SMSService smsService;

    /**
     * 用户注册
     * @param registerReq
     * @return
     */
    public Result register(RegisterReq registerReq) {
        if (!smsService.validSmsCode(registerReq.getMobile(), registerReq.getSms_code())) {
            throw new BusinessException(ErrorCode.VALID_CODE_INVALID, ErrorCode.VALID_CODE_INVALID.getMessage());
        }

        User user = new User();
        BeanUtils.copyProperties(registerReq, user);
        if (queryUserCountByMobile(user.getMobile()) > 0) {
            throw new BusinessException(ErrorCode.PHONE_REGISTERED, ErrorCode.PHONE_REGISTERED.getMessage());
        }
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setRole(RoleType.normal.getCode());
        user.setName(registerReq.getMobile());
        int count = userMapper.insertSelective(user);
        if (count == 0) {
            throw new BusinessException(ErrorCode.PHONE_REGISTER_FAILED, ErrorCode.PHONE_REGISTER_FAILED.getMessage());
        }
        UserToken userToken = buildUserToken(user);
        String token = userTokenService.createUserToken(userToken);
        userToken.setToken(token);
        return Result.buildSuccess(userToken);
    }

    public Result login(LoginReq loginReq) {
        User dbUser = queryUserByMobile(loginReq.getMobile());
//        if (Objects.isNull(dbUser)) {
//            return Result.buildFailure("用户不存在");
//        }
//
//        if (passwordEncoder.matches(loginReq.getPassword(), dbUser.getPassword())) {
//            return buildLoginResult(dbUser);
//        } else {
//            return Result.buildFailure("用户名、密码不正确");
//        }
        return null;
    }

    public Result smsCodeLogin(LoginReq loginReq) {
        User dbUser = queryUserByMobile(loginReq.getMobile());
//        if (Objects.isNull(dbUser)) {
//            return Result.buildFailure("用户不存在");
//        }
//
//        if (smsService.validSmsCode(loginReq.getMobile(), loginReq.getSms_code())) {
//            return buildLoginResult(dbUser);
//        } else {
//            return Result.buildFailure("用户名、验证码不正确");
//        }
        return null;
    }

//    private Result buildLoginResult(User dbUser) {
//        UserToken userToken = buildUserToken(dbUser);
//        String token = userTokenService.createUserToken(userToken);
//        dbUser.setToken(token);
//        dbUser.setPassword(null);
//        return Result.build(ErrorCode.success, dbUser);
//    }

    private User queryUserByMobile(String mobile) {
        User queryUser = new User();
        queryUser.setMobile(mobile);
        return userMapper.selectOne(queryUser);
    }

    private int queryUserCountByMobile(String mobile) {
        User queryUser = new User();
        queryUser.setMobile(mobile);
        return userMapper.selectCount(queryUser);
    }

    private UserToken buildUserToken(User dbUser) {
        UserToken userToken = authService.currentAccount();
        userToken.setUser_id(dbUser.getId());
        userToken.setUser_name(dbUser.getName());
        userToken.setRole_id(dbUser.getRole());
        userToken.setUser_mobile(dbUser.getMobile());
        return userToken;
    }
}
