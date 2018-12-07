package com.yang.websocket;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {
    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry webSocketHandlerRegistry) {
        webSocketHandlerRegistry.addHandler(myHandler(),"/websocket").addInterceptors(new WebSocketInterceptors()).setAllowedOrigins("*");
        webSocketHandlerRegistry.addHandler(myHandler(), "/sockjs/websocket").addInterceptors(new WebSocketInterceptors()).withSockJS();
    }

    @Bean
    public WebSocketHandler myHandler(){
        return new MyHandler();
    }
}
