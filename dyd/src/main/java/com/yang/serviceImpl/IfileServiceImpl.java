package com.yang.serviceImpl;

import com.yang.dao.IfileMapper;
import com.yang.model.Ifile;
import com.yang.service.IfileService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.List;

@Service
public class IfileServiceImpl implements IfileService {

    @Resource
    IfileMapper ifileMapper;

    @Override
    public int deleteByPrimaryKey(Integer fid) {
        return 0;
    }

    @Override
    public int insert(Ifile record) {
        return ifileMapper.insert(record);
    }

    @Override
    public int insertSelective(Ifile record) {
        return 0;
    }

    @Override
    public Ifile selectByPrimaryKey(Integer fid) {
        return ifileMapper.selectByPrimaryKey(fid);
    }

    @Override
    public List<Ifile> selectByUid(Ifile record) {
        return ifileMapper.selectByUid(record);
    }

    @Override
    public int updateByPrimaryKeySelective(Ifile record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKeyWithBLOBs(Ifile record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Ifile record) {
        return ifileMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<Ifile> selectFile(Timestamp ftime) {
        return ifileMapper.selectFile(ftime);
    }

    @Override
    public int deleteByList(List list) {
        return ifileMapper.deleteByList(list);
    }

}
