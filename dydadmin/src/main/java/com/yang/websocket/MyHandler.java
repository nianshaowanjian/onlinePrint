package com.yang.websocket;

import com.yang.model.Admin;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.*;

import java.util.HashMap;
import java.util.Map;

@Service
public class MyHandler implements WebSocketHandler {

    private static final Map<Integer,WebSocketSession> map;

    static {
        map = new HashMap<>();
    }

    /*onOpen()*/
    @Override
    public void afterConnectionEstablished(WebSocketSession webSocketSession) throws Exception {
        Admin admin = getadmin(webSocketSession);
        if(admin!=null){
            map.put(admin.getAid(),webSocketSession);
        }
    }

    /*onMessage*/
    @Override
    public void handleMessage(WebSocketSession webSocketSession, WebSocketMessage<?> webSocketMessage) throws Exception {
        Admin admin = (Admin) webSocketSession.getAttributes().get("admin");
    }

    /*onError*/
    @Override
    public void handleTransportError(WebSocketSession webSocketSession, Throwable throwable) throws Exception {
        if (webSocketSession.isOpen()){
            //关闭session
            try {
                webSocketSession.close();
            } catch (Exception e) {
            }
        }
        //移除用户
        Admin admin = getadmin(webSocketSession);
        if(admin!=null){
            map.remove(admin.getAid());
        }
    }

    /*onClose*/
    @Override
    public void afterConnectionClosed(WebSocketSession webSocketSession, CloseStatus closeStatus) throws Exception {
        //移除用户
        Admin admin = getadmin(webSocketSession);
        if(admin!=null){
            map.remove(admin.getAid());
        }
    }

    @Override
    public boolean supportsPartialMessages() {
        return false;
    }

    private Admin getadmin(WebSocketSession session){
        try {
            Admin admin = (Admin) session.getAttributes().get("admin");
            return admin;
        } catch (Exception e) {
            return null;
        }
    }

    /*发送消息给指定的用户*/
    public void sendMessage(TextMessage messageInfo){
        for (Map.Entry<Integer, WebSocketSession> entry : map.entrySet()) {
            Admin sessionadmin = (Admin)  entry.getValue().getAttributes().get("admin");
            try {
                if (entry.getValue().isOpen()){
                    entry.getValue().sendMessage(messageInfo);
                }
                break;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
