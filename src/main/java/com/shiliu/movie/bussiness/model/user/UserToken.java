package com.shiliu.movie.bussiness.model.user;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import javax.persistence.*;
import java.sql.Timestamp;

@Data
@Table(name = "user_token")
@JsonIgnoreProperties(ignoreUnknown = true)
public class UserToken {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String token;
    private Long user_id;
    private String user_name;
    private Integer user_ip;
    private Timestamp expire_time;
    private Timestamp create_at;
    private Timestamp update_at;

    @Transient
    private Integer role_id;
    @Transient
    private String user_mobile;
}
