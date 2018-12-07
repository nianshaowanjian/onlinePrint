package com.yang.dao;

import com.yang.model.Ifile;

import java.sql.Timestamp;
import java.util.List;

public interface IfileMapper {
    int deleteByPrimaryKey(Integer fid);

    int insert(Ifile record);

    int insertSelective(Ifile record);

    Ifile selectByPrimaryKey(Integer fid);

    List<Ifile> selectByUid(Ifile record);

    int updateByPrimaryKeySelective(Ifile record);

    int updateByPrimaryKeyWithBLOBs(Ifile record);

    int updateByPrimaryKey(Ifile record);

    List<Ifile> selectFile(Timestamp ftime);

    int deleteByList(List list);
}