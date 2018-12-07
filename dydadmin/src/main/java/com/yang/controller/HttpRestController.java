package com.yang.controller;

import com.yang.websocket.MyHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.TextMessage;

import javax.annotation.Resource;

@Controller
public class HttpRestController {

    @Resource
    MyHandler myHandler;

    @RequestMapping(value = "/broadcast")
    @ResponseBody
    public void broadcast(){
        myHandler.sendMessage(new TextMessage("1"));
    }

}
