package com.yang.serviceImpl;

import com.yang.dao.UserMapper;
import com.yang.model.User;
import com.yang.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class UserServiceImpl implements UserService {

    @Resource
    UserMapper userMapper;

    @Override
    public int deleteByPrimaryKey(Integer uid) {
        return 0;
    }

    @Override
    public int insert(User record) {
        try{
            int flag = userMapper.insert(record);
            if(flag==1){
                return 1;
            }else {
                return 0;
            }
        }catch (Exception e){
            return -1;
        }
    }

    @Override
    public int insertSelective(User record) {
        return 0;
    }

    @Override
    public User selectByPrimaryKey(Integer uid) {

        return userMapper.selectByPrimaryKey(uid);
    }

    @Override
    public int updateByPrimaryKeySelective(User record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(User record) {
        try{
            int flag = userMapper.updateByPrimaryKey(record);
            if(flag==1){
                return 1;
            }else {
                return 0;
            }
        }catch (Exception e){

            return -1;
        }
    }

    @Override
    public int loginVerify(User record) {
        try{
            int flag = userMapper.loginVerify(record);
            if(flag==1){
                return 1;
            }else {
                return 0;
            }
        }catch (Exception e){
            System.out.println(e.getMessage());
            return -1;
        }
    }

    @Override
    public User selectByLogin(User recode) {
        try{
            User user = userMapper.selectByLogin(recode);
            return user;
        }catch(Exception e){
            return null;
        }
    }

    @Override
    public int updatePassword(User record) {
        try{
            int flag = userMapper.updatePassword(record);
            if(flag==1){
                return 1;
            }else {
                return 0;
            }
        }catch (Exception e){
            return -1;
        }
    }


}
