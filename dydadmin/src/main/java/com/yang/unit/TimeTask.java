package com.yang.unit;

import com.yang.model.Ifile;
import com.yang.service.IfileService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.io.File;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Component
public class TimeTask {

    Logger LOGGER = LoggerFactory.getLogger(Timestamp.class);

    @Resource
    IfileService ifileService;

    @Scheduled(cron = "0 0 2 * * ?")
    public void test(){

        try{
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Calendar c = Calendar.getInstance();
            c.setTime(new Date());
            c.add(Calendar.DATE,-7);
            Date d = c.getTime();
            c.add(Calendar.DATE,-1);
            Date da = c.getTime();
            Timestamp ftime = DateUtil.dateToTime(d);
            Timestamp ftimeago = DateUtil.dateToTime(da);
            List<Ifile> ifiles = ifileService.selectFile(ftime,ftimeago);
            if(ifiles.size()!=0){
                String path = "C:\\test-upload";
                for(Ifile ifile : ifiles){
                    File f = new File(path+"/"+ifile.getIkey()+ifile.getFname().substring(ifile.getFname().lastIndexOf(".")));
                    if(f.exists()){
                        f.delete();
                    }
                }
                ifileService.updateByList(ifiles);
            }
        }catch (Exception e){
            LOGGER.error("文件删除定时器报错。com.yang.unit.TimeTask");
        }
    }

}
