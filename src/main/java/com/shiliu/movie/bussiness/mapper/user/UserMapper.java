package com.shiliu.movie.bussiness.mapper.user;

import com.shiliu.movie.bussiness.mapper.base.TKMapper;
import com.shiliu.movie.bussiness.model.user.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper extends TKMapper<User> {
//    @SelectProvider(type = UserProvider.class, method = "selectCustom")
//    List<User> selectCustom(User user);
}
