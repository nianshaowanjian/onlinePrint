package com.yang.controller;

import com.yang.model.Admin;
import com.yang.model.Ifile;
import com.yang.service.AdminService;
import com.yang.service.IfileService;
import com.yang.unit.DateUtil;
import com.yang.unit.SystemLog;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class AdminController {

    @Resource
    AdminService adminService;

    @Resource
    IfileService ifileService;

    @SystemLog(operation = "登录")
    @RequestMapping( value = "/login",method = RequestMethod.POST)
    public String login(@ModelAttribute("admin") Admin admin, HttpServletRequest request, ModelMap modelMap){
        try{
            int flag = adminService.loginVerify(admin);
            if(flag==1){
                Admin admin1 = adminService.selectByLogin(admin);
                HttpSession session = request.getSession();
                session.setAttribute("admin",admin1);
                ServletContext application = request.getServletContext();
                Map<String,String> map=application.getAttribute("listAdminSession")==null ? new HashMap<String,String>():(Map<String,String>)application.getAttribute("listAdminSession");
                map.put(Integer.toString(admin1.getAid()),session.getId());
                application.setAttribute("listAdminSession",map);
                return "redirect:/index";
            }else {
                modelMap.addAttribute("message","登录失败，请重新登录！");
                return "login";
            }
        }catch (Exception e){
            modelMap.addAttribute("message","登录失败，请重新登录！");
            return "login";
        }
    }

    @RequestMapping(value = {"/login","/"},method = RequestMethod.GET)
    public String login(){
        return "login";
    }

    @SystemLog(operation = "跳转首页")
    @RequestMapping(value = "/index")
    public String index(){
        return "index";
    }

    @RequestMapping(value = "/yidayin")
    public String yidayin(ModelMap modelMap){
        List<Ifile> ifiles =null;
        try{
            ifiles = ifileService.selectByDy("1");

        }catch (Exception e){

        }
        modelMap.addAttribute("list",ifiles);
        return "yidayin";
    }

    @RequestMapping(value = "/weidayin")
    public String weidayin(ModelMap modelMap){
        List<Ifile> ifiles =null;
        try{
            ifiles = ifileService.selectByDy("0");

        }catch (Exception e){

        }
        modelMap.addAttribute("list",ifiles);
        return "weidayin";
    }

    @SystemLog(operation = "打印文件")
    @RequestMapping(value = "dayin")
    @ResponseBody
    public String dayin(String fid,ModelMap modelMap){
        Ifile ifile = new Ifile();
        try{
            ifile.setFid(Integer.parseInt(fid));
            ifile.setZhuangtai("1");
            int flag = ifileService.updateByAdmin(ifile);
            if(flag==1){
               return "1";
            }
        }catch (Exception e){

        }
        return "0";
    }

    @RequestMapping(value = "/mima")
    public String mima(){
        return "mima";
    }

    @SystemLog(operation = "修改密码")
    @RequestMapping(value= "modifypwd")
    public String modifypwd(@RequestParam("apwd") String apwd, ModelMap modelMap,HttpServletRequest request){
        Admin admin = new Admin();
        try{
            admin.setApwd(apwd);
            HttpSession session = request.getSession();
            admin.setAid(((Admin)session.getAttribute("admin")).getAid());
            int flag = adminService.updatePassword(admin);
            if(flag==1){
                session.invalidate();
                return "login";
            }
        }catch (Exception e){

        }
        modelMap.addAttribute("message","更改密码失败");
        return "mima";
    }

    @SystemLog(operation = "注销")
    @RequestMapping(value = "/logout")
    public String logout(HttpServletRequest request){
        HttpSession session = request.getSession();
        Admin admin = (Admin) session.getAttribute("admin");
        ServletContext application = session.getServletContext();
        Map<String,String> map =(Map<String, String>) application.getAttribute("listAdminSession");
        map.remove(Integer.toString(admin.getAid()));
        session.invalidate();
        return "login";
    }

    @SystemLog(operation = "拒绝打印")
    @RequestMapping(value = "/jujue")
    @ResponseBody
    public String jujue(String fid,String jujue,ModelMap modelMap){
        Ifile ifile = new Ifile();
        try{
            ifile.setZhuangtai("-1");
            ifile.setJujue(jujue);
            ifile.setFid(Integer.parseInt(fid));
            int flag = ifileService.updateByAdmin(ifile);
            if(flag==1){
                return "1";
            }
        }catch (Exception e){

        }
        return "0";
    }

    /*查询历史记录*/
    @RequestMapping(value = "/sel")
    public String sel(String ftimeago,String ftime,ModelMap modelMap){
        if(ftimeago==null||ftimeago.equals("")) {
            ftimeago = "1979-01-01";
        }
        if(ftime==null||ftime.equals("")) {
            Date d = new Date();
            ftime = DateUtil.dateToStr(d,"yyyy-MM-dd");
        }
        Timestamp fta = DateUtil.strToSqlDate(ftimeago,"yyyy-MM-dd");
        Timestamp ft = DateUtil.strToSqlDate(ftime,"yyyy-MM-dd");
        List<Ifile> ifiles = null;
        try{
            ifiles = ifileService.selectFileYi(ft,fta);
        }catch (Exception e){

        }
        modelMap.addAttribute("list",ifiles);
        return "yidayin";
    }
}
