<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>

    <!--公共脚本-->
    <!--jquery-->
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>

    <!--前端脚本-->
    <script type="text/javascript" src="js/common.js"></script>

    <!--公共样式-->
    <link rel="stylesheet" type="text/css" href="css/common.css"/>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <script type="text/javascript">
        $(document).ready(function(e) {
            //首页轮播
            xlc.tabList ("#js_diannao" , "mouseover" , "focus" , true , 3000);
        });
    </script>
    <style>
        .btn1{float:right;position: absolute;top:-160px;right:0px;border:1px solid #EAEAEA;background-color:#EAEAEA;}
        .btn1:hover{border:1px solid #000;background-color:#B1B1B1;}
        .btn2{float:right;position: absolute;top:-160px;color:#909090;font-size:12px;right:0px;border:1px solid #EAEAEA;background-color:#EAEAEA;}
        .btn2:hover{text-decoration: underline;color:#000;}
    </style>

</head>

<body>

<div class="container_com container_nav cf" style="position: relative;">
    <!--注销、登录-->
    <c:if test="${empty sessionScope.user}"><button class="btn1" data-toggle="modal" data-target="#myModal">登录/注册</button></c:if>
    <c:if test="${!empty sessionScope.user}"><a href="logout" class="btn2">欢迎，${sessionScope.user.uname}【注销】</a></c:if>
    <a href="index" class="logo focus">
        <img src="images/logo.png" width="258" height="91" />
        <div class="choose"></div>
    </a>
    <ul class="nav_com">
        <li class="navItem_1">
            <a href="yishangchuan" class="icon_nav icon_nav_1">
                <span class="gaoguang"></span>
                <img src="images/icon_1.png" width="95" height="145" />
            </a>
            <a href="yishangchuan" class="nav_txt">已上传文件</a>
            <div class="choose"></div>
        </li>
        <li class="navItem_2">
            <span class="gaoguang"></span>
            <a href="shangchuan" class="icon_nav icon_nav_2">
                <img src="images/icon_2.png" width="70" height="126" />
            </a>
            <a href="shangchuan" class="nav_txt">上传文件</a>
            <div class="choose"></div>
        </li>
        <li class="navItem_3">
            <span class="gaoguang"></span>
            <a href="xiugai" class="icon_nav icon_nav_3">
                <img src="images/icon_3.png" width="81" height="100" />
            </a>
            <a href="xiugai" class="nav_txt">个人信息</a>
            <div class="choose"></div>
        </li>
        <li class="navItem_4 zx">
            <span class="gaoguang"></span>
            <a href="logout" class="icon_nav icon_nav_4">
                <img src="images/icon_4.png" width="89" height="89" />
            </a>
            <a href="logout" class="nav_txt">退出登录</a>
            <div class="choose"></div>
        </li>
    </ul>
</div>

<!--&lt;!&ndash;蔓藤&ndash;&gt;-->
<!--<div class="container_com m_center container_manteng">-->
    <!--<img class="ye ye1" src="images/ye_1.png" width="24" height="22" />-->
    <!--<img class="ye ye2" src="images/ye_2.png" width="34" height="24" />-->
    <!--<img class="ye ye3" src="images/ye_3.png" width="24" height="22" />-->
    <!--<img class="ye ye4" src="images/ye_4.png" width="19" height="28" />-->
    <!--<img class="ye ye5" src="images/ye_5.png" width="12" height="20" />-->
    <!--<img class="ye ye6" src="images/ye_6.png" width="18" height="30" />-->
    <!--<img class="ye ye7" src="images/chong.png" width="21" height="25" />-->
    <!--<img src="images/manteng.png" width="410" height="152" />-->
<!--</div>-->


<div class="container_com container_geban">
    <div class="container_com container_indexmain">
        <div class="diannao" id="js_diannao">
            <ul class="lunbo js_slideWrap">
                <li style="background-image:url('images/l_1.png')">
                    <p class="p1"><img src="images/img_1.png" /></p>
                    <p class="p2"><img src="images/img_2.png" /></p>
                </li>
                <li style="background-image:url('images/l_2.png')">
                    <p class="p1"><img src="images/img_3.png" /></p>
                    <p class="p2"><img src="images/img_4.png" /></p>
                </li>
                <li style="background-image:url('images/l_3.png')">
                    <p class="p1"><img src="images/img_5.png" /></p>
                    <p class="p2"><img src="images/img_6.png" /></p>
                </li>
            </ul>
            <ul class="lunbo_tip js_slideTip">
                <li class="focus"></li>
                <li></li>
                <li></li>
            </ul>
            <img src="images/gaoguang.png" width="379" height="225" class="gaoguang_diannao" />
            <img src="images/diannao.png" width="417" height="305" />
        </div>
        <div class="ps">
            <img src="images/dyj.png" width="160" height="140" />
        </div>
    </div>
</div>
<div class="row">
    <!-- 模态声明，show 表示显示 -->
    <div class="modal fade " id="myModal">
        <!-- 窗口声明 -->
        <div class="modal-dialog" style="width:344px;">
            <!-- 内容声明 -->
            <div class="modal-content">
                <iframe src="loginjsp" width="100%" style="border: 0;height: 420px"></iframe>
            </div>
        </div>
    </div>
</div>
<!-- 结束 -->

<div class="footer">
    Copyright &copy;2016 行走的打印店 All rights reserved  技术支持：煜城工作室
</div>
<%--<script>
    $(function () { $('#myModal').modal({
        keyboard: true
    })});
</script>--%>
</body>
</html>
