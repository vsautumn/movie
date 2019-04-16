package com.shiliu.movie.bussiness.mapper.user;

import com.shiliu.movie.bussiness.mapper.base.TKMapper;
import com.shiliu.movie.bussiness.model.user.UserToken;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserTokenMapper extends TKMapper<UserToken> {
}
