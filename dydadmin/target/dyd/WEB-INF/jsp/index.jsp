<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head >
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title></title>
    <script src="js/jquery-1.7.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/index1.css">
    <style>
        .weidayin{
            border-radius: 15px;color:red;display: inline-block;
            position: absolute;background-color: #eeeeee;
            height: 18px;line-height: 18px;margin-top: 5px;
            margin-left:5px;font-size: 12px;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div style="min-width: 1100px;">
    <div id="header">
        <div class="header01">
            <div class="logo">
                <a href="index.jsp">
                    <img src="images/logo_03.gif" alt=""></a>
            </div>
            <div class="right_01" style="position: absolute; z-index: 9;">
                <img src="images/pic_06.gif" alt="">
            </div>
            <div class="right_02">你好<span>
                <c:out value="${sessionScope.admin.aphone}"></c:out>
            </span>，欢迎登陆</div>
        </div>
    </div>
    <div>
        <div id="left" style="background: #2F2F2F;float:left;padding-top: 8px;width: 15%;">
            <div class="side">
                <ul>
                    <li class="y_css">
                        <a href="weidayin" onclick="reset()" target="mainFrame"><span></span>
                            <p style="position: relative;" class="icon_02">未打印信息 <i class="weidayin"></i></p>
                        </a>
                    </li>
                    <li class="y_css">
                        <a href="yidayin" target="mainFrame"><span></span>
                            <p class="icon_04">已打印信息</p>
                        </a>
                    </li>
                    <li class="y_css">
                        <a href="mima" target="mainFrame"><span></span>
                            <p class="icon_05">修改密码</p>
                        </a>
                    </li>
                    <li class="y_css" id="xx6">
                        <a href="logout"><span></span>
                            <p class="icon_07">退出系统</p>
                        </a>
                    </li>
<%--                    <li class="y_css">
                        <a id="cs" href="###"><span></span>
                            <p class="icon_07">测试按钮</p>
                        </a>
                    </li>--%>
                </ul>
            </div>
        </div>
        <div style="float:left;width:85%;">
            <!--<div>-->
                <!--<img src="images/shouye.jpg" alt="" style="margin-top:5px;margin-left:10px;">-->
            <!--</div>-->
            <!--<div style="text-align: right; margin-right: 15px;">-->
                <!--<a href="login.jsp"><img alt="" src="images/middil_06.gif"></a>-->
            <!--</div>-->
            <iframe frameborder="0" id="iframepage" style="margin-top: 10px; height: 631px;" width="100%" id="mainFrame" name="mainFrame" src="weidayin"></iframe>
        </div>
    </div>
    <div style="position: fixed;bottom: 0px;height: 20px;width: 100%;background-color: #E0DFD9;">
        <p style="text-align: center;color:#6B6B6B;">Copyright © 2016-- 技术支持：煜城工作室</p>
    </div>
</div>

<script>
    $(function (){
        var hei=$(window).height()*1-80;
        $("#iframepage").css("height",hei);
        $("#left").css("height",hei);
        $(window).resize(function (){ // 监听浏览器窗口高度变化
            var hei=$(window).height()*1-80;
            $("#iframepage").css("height",hei);
            $("#left").css("height",hei);
        });
/*WebSocket*/
        var websocket;

        // 首先判断是否 支持 WebSocket
        if('WebSocket' in window) {
            websocket = new WebSocket("ws://localhost:8080/dydadmin/websocket");
        } else if('MozWebSocket' in window) {
            websocket = new MozWebSocket("ws://localhost:8080/dydadmin/websocket");
        } else {
            websocket = new SockJS("http://localhost:8080/dydadmin/sockjs/websocket");
        }

        // 打开时
        websocket.onopen = function(evnt) {
            console.log("websocket.onopen");
        };


        // 处理消息时
        websocket.onmessage = function(evnt) {
            if(evnt.data!=""&&evnt.data!=null){
                updateres();
            }
        };


        websocket.onerror = function(evnt) {
            alert("网络波动导致同步通知失效，请重新登录系统。");
        };

        websocket.onclose = function(evnt) {
            console.log("websocket.onclose");
        };

/*        // 点击了发送消息按钮的响应事件
        $("#cs").click(function(){
            // 获取消息内容
            var text = "测试信息。";
            // 判断
            if(text == null || text == ""){
                alert(" content  can not empty!!");
                return false;
            }

            // 发送消息
            websocket.send(text);
        });*/

        window.onbeforeunload = function () {
            websocket.close();
        }

    });
    function updateres() {
        var x = $(".weidayin").text();
        if(x==null||x==""){
            x = "0";
        }
        x = parseInt(x)+1;
        $(".weidayin").text(x);
    }

    function reset() {
        $(".weidayin").text("");
    }

</script>
</body>
</html>