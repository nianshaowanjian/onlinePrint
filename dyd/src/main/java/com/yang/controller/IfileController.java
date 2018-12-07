package com.yang.controller;

import com.yang.model.Ifile;
import com.yang.model.User;
import com.yang.service.IfileService;
import com.yang.unit.RandomString;
import com.yang.unit.RequestAPI;
import com.yang.unit.SystemLog;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

@Controller
public class IfileController {

    @Resource
    IfileService ifileService;

    @SystemLog(operation = "上传文件")
    @RequestMapping(value = "/upload")
    @ResponseBody
    public String uploadFile(@RequestParam("file") CommonsMultipartFile upfile, HttpServletRequest request){
        Ifile ifile;
        try{
            HttpSession session = request.getSession();
            ifile = new Ifile();
            User user = (User)session.getAttribute("user");
            ifile.setUid(user.getUid());
            String path = "C:\\test-upload";
            File f = new File(path);
            if(!f.exists()) f.mkdir();
            String oldName = upfile.getOriginalFilename();
            ifile.setFname(oldName);
            String key = RandomString.createRandomString(16);
            File file = new File(path+"/"+key+oldName.substring(oldName.lastIndexOf(".")));
            InputStream inputStream = upfile.getInputStream();
            FileUtils.copyInputStreamToFile(inputStream, file);
            if(inputStream!=null){
                inputStream.close();
            }
            ifile.setIkey(key);
            int flag = ifileService.insert(ifile);
            if(flag==1){
                return Integer.toString(ifile.getFid());
            }
            return "0";
        } catch (IOException e) {
            return "0";
        }
    }

    @SystemLog(operation = "添加信息")
    @RequestMapping(value = "/fileinfo")
    public String fileInfo(@ModelAttribute("ifile") Ifile ifile, ModelMap modelMap, HttpServletRequest request){
        if(ifile.getFid()==null||(ifile.getFid()).equals("")){
            modelMap.addAttribute("message","请先上传文件！");
            return "shangchuan";
        }
        try{
            int flag = ifileService.updateByPrimaryKey(ifile);
            if(flag==1){
                RequestAPI.get();
                return "redirect:/yishangchuan";
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        modelMap.addAttribute("message","提交失败，请重新上传文件！");
        Ifile ifile1 = ifileService.selectByPrimaryKey(ifile.getFid());
        if(ifile==null){
            return "redirect:/shangchuan";
        }
        String fileName = ifile1.getIkey()+ifile1.getFname().substring(ifile1.getFname().lastIndexOf("."));
        String path = "C:\\test-upload";
        File file = new File(path+"/"+fileName);
        if (file.exists() && file.isFile()) {
            if (file.delete()) {
                return "shangchuan";
            } else {
                return "shangchuan";
            }
        } else {
            return "shangchuan";
        }

    }
}
