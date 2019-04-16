package com.shiliu.movie.common.component.security;

import com.google.common.net.InetAddresses;
import com.shiliu.movie.bussiness.model.user.UserToken;
import com.shiliu.movie.common.component.token.UserTokenService;
import com.shiliu.movie.bussiness.model.user.RoleType;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.InetAddress;
import java.util.*;
import java.util.stream.Collectors;

/**
 * @author heng
 */
@Slf4j
@Component
@Order(1)
public class SecurityFilter implements Filter {
    private static final String AUTHORIZATION = "Authorization";
    private static final Set<String> WHITELIST = new HashSet<String>() {
        {
            add("/api/movie/register");
            add("/api/movie/login");
            add("/api/movie/send");
            add("/api/movie/smsCodeLogin");
        }
    };

    @Autowired
    UserTokenService userTokenService;

    @Override
    public void init(FilterConfig filterConfig) {
    }

    @Override
    public void doFilter(
            ServletRequest request,
            ServletResponse response,
            FilterChain chain) throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        String userTokenJson = req.getHeader(AUTHORIZATION);

        String url = req.getRequestURI();
        if (WHITELIST.contains(url)) {
            String ip = req.getHeader("X-Forwarded-For");
            ip = StringUtils.isNotBlank(ip) ? ip : request.getRemoteAddr();
            UserToken userToken = new UserToken();
            if (StringUtils.isNotBlank(ip)) {
                userToken.setUser_ip(InetAddresses.coerceToInteger(InetAddress.getByName(ip)));
                userToken.setRole_id(RoleType.normal.getCode());
            }
            setAuthentication(userToken);
            chain.doFilter(request, response);
            return;
        } else {
            if (StringUtils.isNotBlank(userTokenJson)) {
                UserToken userToken = userTokenService.validToken(userTokenJson);
                if (Objects.nonNull(userToken)) {
                    setAuthentication(userToken);
                    chain.doFilter(request, response);
                    return;
                }
            }
        }

        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        httpServletResponse.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Authentication Failed: ");
    }

    private void setAuthentication(UserToken userToken) {
        List<SimpleGrantedAuthority> list = new ArrayList<>();
        if (Objects.nonNull(userToken.getRole_id())) {
            list.add(new SimpleGrantedAuthority(userToken.getRole_id().toString()));
        }
        Arrays.asList(userToken.getRole_id()).stream().map(String::valueOf).map(SimpleGrantedAuthority::new).collect(Collectors.toList());
        UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(
                userToken, null, list);
        SecurityContextHolder.getContext().setAuthentication(authenticationToken);
    }

    @Override
    public void destroy() {

    }
}
