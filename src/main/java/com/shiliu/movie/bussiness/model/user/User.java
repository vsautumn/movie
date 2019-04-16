package com.shiliu.movie.bussiness.model.user;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import javax.persistence.*;
import java.sql.Timestamp;

@Data
@Table(name = "user")
@JsonIgnoreProperties(ignoreUnknown = true)
@JsonInclude(JsonInclude.Include.NON_NULL)
public class User {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String invitation_code;
    private String mobile;
    private Integer property;
    private Integer continuous_days;
    private Integer last_signin_time;
    private Integer watch_ticket_num;
    private Integer download_num;
    private Integer share_get_ticket_num;
    private Integer watch_movie_time;
    private String avatar_url;
    private Integer is_continuous;
    private Integer is_mobile_network;
    private Integer is_default_resolution;
    private Integer share_num;
    private Integer invitation_num;
    private String password;
    private String origin_password;
    private Timestamp expire;
    private Timestamp time_expire;
    private String sms_code;
    private Integer sex;
    private Integer age;
    private Integer role;
    private Integer is_sign;
    private Integer is_login;
    private Integer member_type;
    private Integer is_invitation;
    private Timestamp created_at;
    private Timestamp updated_at;

    @Transient
    private String token;
}

