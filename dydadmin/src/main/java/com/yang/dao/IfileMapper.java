package com.yang.dao;

import com.yang.model.Ifile;
import org.apache.ibatis.annotations.Param;

import java.sql.Timestamp;
import java.util.List;

public interface IfileMapper {
    int deleteByPrimaryKey(Integer fid);

    int insert(Ifile record);

    int insertSelective(Ifile record);

    Ifile selectByPrimaryKey(Integer fid);

    List<Ifile> selectByUid(Ifile record);

    List<Ifile> selectByDy(String str);

    List<Ifile> selectFileYi(@Param("ftime") Timestamp ft,@Param("ftimeago") Timestamp fta);

    int updateByPrimaryKeySelective(Ifile record);

    int updateByPrimaryKeyWithBLOBs(Ifile record);

    int updateByAdmin(Ifile record);

    int updateByPrimaryKey(Ifile record);

    List<Ifile> selectFile(@Param("ftime") Timestamp ft,@Param("ftimeago") Timestamp fta);


    int deleteByList(List list);

    int updateByList(List list);
}