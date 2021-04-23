package com.yhsx.mapper;

import com.yhsx.model.User;

public interface UserMapper {
    User queryUserByName(String userName);
}
