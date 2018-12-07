package com.yang.serviceImpl;

import com.yang.dao.AdminMapper;
import com.yang.model.Admin;
import com.yang.service.AdminService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class AdminServiceImpl implements AdminService {

    @Resource
    AdminMapper adminMapper;

    @Override
    public int deleteByPrimaryKey(Integer uid) {
        return 0;
    }

    @Override
    public int insert(Admin record) {
        try{
            int flag = adminMapper.insert(record);
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
    public int insertSelective(Admin record) {
        return 0;
    }

    @Override
    public Admin selectByPrimaryKey(Integer uid) {

        return adminMapper.selectByPrimaryKey(uid);
    }

    @Override
    public int updateByPrimaryKeySelective(Admin record) {
        return 0;
    }


    @Override
    public int loginVerify(Admin record) {
        try{
            int flag = adminMapper.loginVerify(record);
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
    public Admin selectByLogin(Admin recode) {
        try{
            Admin admin = adminMapper.selectByLogin(recode);
            return admin;
        }catch(Exception e){
            return null;
        }
    }

    @Override
    public int updatePassword(Admin record) {
        try{
            int flag = adminMapper.updatePassword(record);
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
