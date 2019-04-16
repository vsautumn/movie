package com.shiliu.movie.bussiness.validate;

import com.shiliu.movie.bussiness.bean.user.LoginReq;
import com.shiliu.movie.common.exception.ErrorCode;
import com.shiliu.movie.common.constants.Constant;
import com.shiliu.movie.common.exception.BusinessException;
import org.springframework.util.StringUtils;

import java.util.regex.Pattern;

/**
 * 用户相关入参验证及相关业务验证
 * Created by chenwen on 2019/4/9.
 */

public class UserValidate {

    /**
     * 发送验证码参数验证
     *
     * @param loginReq
     */
    public static void validateSendValidCodeParam(LoginReq loginReq) {
        //入参校验
        if (null == loginReq) {
            throw new BusinessException(ErrorCode.EMPTY_INPUT);
        }

        /**
         * 手机号不能为空
         */
        if (StringUtils.isEmpty(loginReq.getMobile())) {
            throw new BusinessException(ErrorCode.PHONE_EMPTY_INPUT);
        }

        /**
         * 手机号长度校验
         */
        if (loginReq.getMobile().length() > 11) {
            throw new BusinessException(ErrorCode.PHONE_LENGTH_INPUT);
        }

        /**
         * 手机号格式校验
         */
        if (!Pattern.matches(Constant.TEL_REGEX, loginReq.getMobile())) {
            throw new BusinessException(ErrorCode.PHONE_FORMAT_INPUT);
        }
    }

//    /**
//     * 用户注册参数验证
//     *
//     * @param user
//     */
//    public static void validateRegisterParam(User user) {
//        //入参校验
//        if (null == user) {
//            throw new FilmException(ErrorCode.EMPTY_INPUT);
//        }
//
//        /**
//         * 手机号不能为空
//         */
//        if (StringUtils.isEmpty(user.getMobile())) {
//            throw new FilmException(ErrorCode.PHONE_EMPTY_INPUT);
//        }
//
//        /**
//         * 手机号长度校验
//         */
//        if (user.getMobile().length() > 11) {
//            throw new FilmException(ErrorCode.PHONE_LENGH_INPUT);
//        }
//
//        /**
//         * 手机号格式校验
//         */
//        if (!Pattern.matches(Constant.TEL_REGEX, user.getMobile())) {
//            throw new FilmException(ErrorCode.PHONE_FORMAT_INPUT);
//        }
//
//        /**
//         * 密码空校验
//         */
//        if (StringUtils.isEmpty(user.getPassword())) {
//            throw new FilmException(ErrorCode.PASSWORD_NULL);
//        }
//
//        /**
//         * 两次输入密码不一致
//         */
//        if (!user.getPassword().equals(user.getConfirm_password())) {
//            throw new FilmException(ErrorCode.PASSWORD_NOT_SAME);
//        }
//    }
}
