package com.shiliu.movie.common.component.token;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.shiliu.movie.bussiness.mapper.user.UserTokenMapper;
import com.shiliu.movie.bussiness.model.user.UserToken;
import com.shiliu.movie.bussiness.service.user.UserService;
import com.shiliu.movie.common.component.redis.RedisUtils;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.impl.Base64Codec;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.weekend.WeekendSqls;

import java.sql.Timestamp;
import java.util.concurrent.atomic.AtomicLong;

@Slf4j
@Service
public class UserTokenService {
    private static final AtomicLong LAST_TIME_MS = new AtomicLong();

    final ObjectMapper mapper = new ObjectMapper();

    @Autowired
    UserTokenMapper userTokenMapper;

    @Autowired
    UserTokenConfig userTokenConfig;

    @Autowired
    UserService userService;

    @Autowired
    RedisUtils redisUtils;

    public UserToken validToken(String token) {
        try {
            UserToken parseToken = parseJwtToken(token);
            String encodeToken = getDbToken(token);
            // 从redis中获取token
            if ("".equals(redisUtils.get(encodeToken))) {
                return parseToken;
            } else {
                // 不存在，判断数据库中的是否已经超时
                if (isValidTokenInDB(encodeToken)) {
                    // 未超时，重新设置redis中的ttl
                    refreshToken(encodeToken);
                    return parseToken;
                } else {
                    invalidToken(encodeToken);
                    // 数据库中的也超时了，返回null
                    return null;
                }
            }
        } catch (Exception e) {
            log.error("parse jwt token error: ", e.getMessage());
        }
        return null;
    }

    private String createJwtToken(UserToken userToken) {
        String token = Jwts.builder()
                .claim("user_id", userToken.getUser_id())
                .claim("user_name", userToken.getUser_name())
                .claim("user_mobile", userToken.getUser_mobile())
                .claim("user_ip", userToken.getUser_ip())
                .claim("role_id", userToken.getRole_id())
                .claim("timeStamp", uniqueCurrentTimeMS())
                .signWith(SignatureAlgorithm.HS512, Base64Codec.BASE64.decodeToString(userTokenConfig.getTokenValidateKey()))
                .compact();
        token = JwtUtils.getTokenHeader(token);
        log.info("Generate new jwt token \n {}", token);
        return token;
    }

    public UserToken parseJwtToken(String token) {
        token = JwtUtils.getRawToken(token);
        Claims claims = Jwts.parser()
                .setSigningKey(Base64Codec.BASE64.decodeToString(userTokenConfig.getTokenValidateKey()))
                .parseClaimsJws(token)
                .getBody();

        final UserToken userToken = mapper.convertValue(claims, UserToken.class);
        return userToken;
    }

    public static long uniqueCurrentTimeMS() {
        long now = System.currentTimeMillis();
        while (true) {
            long lastTime = LAST_TIME_MS.get();
            if (lastTime >= now) {
                now = lastTime + 1;
            }
            if (LAST_TIME_MS.compareAndSet(lastTime, now)) {
                return now;
            }
        }
    }

    private String getDbToken(String token) {
        return DigestUtils.md5Hex(userTokenConfig.getMd5Pass() + token);
    }

    private boolean isValidTokenInDB(String encodeToken) {
        Example example = new Example.Builder(UserToken.class)
                .where(WeekendSqls.<UserToken>custom()
                        .andEqualTo(UserToken::getToken, encodeToken)
                        .andGreaterThanOrEqualTo(UserToken::getExpire_time, new Timestamp(System.currentTimeMillis())))
                .build();
        int count = userTokenMapper.selectCountByExample(example);
        if (count > 0) {
            return true;
        }
        return false;
    }

    public String createUserToken(UserToken userToken) {
        String token = createJwtToken(userToken);
        userToken.setToken(getDbToken(token));
        userTokenMapper.insertSelective(userToken);
        refreshRedisToken(userToken.getToken());
        return token;
    }

    private void refreshToken(String encodeToken) {
        refreshRedisToken(encodeToken);
        refreshDbToken(encodeToken);
    }

    private void refreshRedisToken(String encodeToken) {
        Long ttlTime = (userTokenConfig.getTokenExpireTime() / 2 + 1) * 60 * 1000L;
        redisUtils.set(encodeToken, "1", ttlTime);
    }

    private void invalidToken(String encodeToken) {
        Long ttlTime = (userTokenConfig.getTokenExpireTime() / 2 + 1) * 60 * 1000L;
        redisUtils.expire(encodeToken, ttlTime);
    }

    private void refreshDbToken(String encodeToken) {
        Example example = new Example.Builder(UserToken.class)
                .where(WeekendSqls.<UserToken>custom()
                        .andEqualTo(UserToken::getToken, encodeToken)
                ).build();
        UserToken userToken = new UserToken();
        userToken.setExpire_time(
                new Timestamp(System.currentTimeMillis()
                        + userTokenConfig.getTokenExpireTime() * 60 * 1000));
        userTokenMapper.updateByExampleSelective(userToken, example);
    }
}
