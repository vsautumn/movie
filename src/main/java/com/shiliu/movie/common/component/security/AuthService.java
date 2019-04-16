package com.shiliu.movie.common.component.security;

import com.shiliu.movie.bussiness.model.user.UserToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import java.util.Objects;

@Component
public class AuthService {
    public UserToken currentAccount() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (Objects.nonNull(authentication) && authentication.getPrincipal() instanceof UserToken) {
            UserToken userToken = (UserToken) SecurityContextHolder.getContext()
                    .getAuthentication().getPrincipal();
            return userToken;
        }
        return null;
    }
}
