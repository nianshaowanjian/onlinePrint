package com.yang.service;

import com.yang.model.Ifile;

import java.sql.Timestamp;
import java.util.List;

public interface IfileService {

    int deleteByPrimaryKey(Integer fid);

    int insert(Ifile record);

    int insertSelective(Ifile record);

    Ifile selectByPrimaryKey(Integer fid);

    List<Ifile> selectByUid(Ifile record);

    List<Ifile> selectByDy(String str);

    int updateByPrimaryKeySelective(Ifile record);

    int updateByPrimaryKeyWithBLOBs(Ifile record);

    int updateByAdmin(Ifile record);

    int updateByPrimaryKey(Ifile record);

    List<Ifile> selectFile(Timestamp ft,Timestamp fta);

    List<Ifile> selectFileYi(Timestamp ft,Timestamp fta);

    int deleteByList(List list);

    int updateByList(List list);

}
