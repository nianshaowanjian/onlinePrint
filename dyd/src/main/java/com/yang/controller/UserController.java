package com.yang.controller;

import com.yang.model.Ifile;
import com.yang.service.IfileService;
import com.yang.service.UserService;
import com.yang.unit.SystemLog;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.yang.model.User;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class UserController {

    @Resource
    UserService userService;

    @Resource
    IfileService ifileService;

    @SystemLog(operation = "跳转首页")
    @RequestMapping(value = {"/","/index"})
    public String index(){ return "index"; }

    @RequestMapping(value = "loginjsp")
    public String loginjsp(){
        return "login";
    }

    @SystemLog(operation = "注册")
    @RequestMapping("/register")
    @ResponseBody
    public String register(@ModelAttribute("user") User user ){
        User user1 = userService.selectByLogin(user);
        if(user1!=null){
            return "2";
        }
        int flag = userService.insert(user);
        if(flag==1){
            return "1";
        }

        return "0";

    }

    @SystemLog(operation = "修改界面")
    @RequestMapping(value = "/xiugai")
    public String xiugai(@ModelAttribute("user") User user,HttpServletRequest request,ModelMap modelMap){
        HttpSession session = request.getSession();
        if(user.getUphone()==null) {
            user = (User) session.getAttribute("user");
        }else {
            int userId = ((User)session.getAttribute("user")).getUid();
            user.setUid(userId);
            int flag = userService.updateByPrimaryKey(user);
            if(flag!=1){
                modelMap.addAttribute("message","更改失败！");
                return "xiugai";
            }
        }
        modelMap.addAttribute("user",user);
        return "xiugai";
    }

    @SystemLog(operation = "修改密码")
    @RequestMapping(value = "/mima")
    public String mima(String password,String newPassword,HttpServletRequest request,ModelMap modelMap){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        user.setUpwd(password);
        int flag = userService.loginVerify(user);
        if(flag==1){
            user.setUpwd(newPassword);
            int flagp = userService.updatePassword(user);
            if(flagp==1){
                return "redirect:/logout";
            }
        }
        modelMap.addAttribute("message","更改失败！");
        return "xiugai";
    }

    @SystemLog(operation = "已上传")
    @RequestMapping(value = "/yishangchuan")
    public String yishangchuan(ModelMap modelMap,HttpServletRequest request){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Ifile ifile1 = new Ifile();
        ifile1.setUid(user.getUid());
        ifile1.setZhuangtai("0");
        Ifile ifile2 = new Ifile();
        ifile2.setUid(user.getUid());
        ifile2.setZhuangtai("1");
        try{
            List<Ifile> list1 = ifileService.selectByUid(ifile1);
            modelMap.addAttribute("list1",list1);
            List<Ifile> list2 = ifileService.selectByUid(ifile2);
            modelMap.addAttribute("list2",list2);
            return "yishangchuan";
        }catch (Exception e){
            return "yishangchuan";
        }
    }

    @SystemLog(operation = "上传界面")
    @RequestMapping(value = "/shangchuan")
    public String shangchuan(){
        return "shangchuan";
    }

    @SystemLog(operation = "登录")
    @RequestMapping(value = "/login")
    @ResponseBody
    public String login(String uphoned,String upwdd,HttpServletRequest request){
        User user = new User();
        user.setUphone(uphoned);
        user.setUpwd(upwdd);
        String flag = Integer.toString(userService.loginVerify(user));
        if(flag.equals("1")){
            user = userService.selectByLogin(user);
            if(user!=null){
                HttpSession session = request.getSession();
                session.setAttribute("user",user);

                ServletContext application = request.getServletContext();

                Map<String,String> map=application.getAttribute("listUserSession")==null ? new HashMap<String,String>():(Map<String,String>)application.getAttribute("listUserSession");

                String userId = Integer.toString(user.getUid());
                String sessionId = session.getId();
                map.put(userId,sessionId);
                application.setAttribute("listUserSession",map);
                return "1";
            }else {
                return "0";
            }
        }else {
            return "0";
        }
    }

    @SystemLog(operation = "注销")
    @RequestMapping(value = "/logout")
    public String logout(HttpServletRequest request){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        ServletContext application = session.getServletContext();
        Map<String,String> map =(Map<String, String>) application.getAttribute("listUserSession");
        map.remove(Integer.toString(user.getUid()));
        session.invalidate();
        return "redirect:/index";
    }

}
