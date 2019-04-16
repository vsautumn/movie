package com.shiliu.movie.common.component.token;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Data
@Component
@ConfigurationProperties(prefix = "userTokenConfig")
public class UserTokenConfig {

    private String tokenValidateKey;

    private Integer tokenExpireTime;

    private String md5Pass;
}
