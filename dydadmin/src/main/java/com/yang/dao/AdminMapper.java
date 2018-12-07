package com.yang.dao;

import com.yang.model.Admin;

public interface AdminMapper {
    int deleteByPrimaryKey(Integer aid);

    int insert(Admin record);

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(Integer aid);

    int updateByPrimaryKeySelective(Admin record);

    int loginVerify(Admin record);

    Admin selectByLogin(Admin record);

    int updatePassword(Admin record);

}