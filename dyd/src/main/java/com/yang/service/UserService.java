package com.yang.service;

import com.yang.model.User;

public interface UserService {

    int deleteByPrimaryKey(Integer uid);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer uid);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    int loginVerify(User record);

    User selectByLogin(User record);

    int updatePassword(User record);

}
