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

    <style>
        .btn2{float:right;position: absolute;top:-160px;color:#909090;font-size:12px;right:0px;border:1px solid #EAEAEA;background-color:#EAEAEA;}
        .btn2:hover{text-decoration: underline;color:#000;}
    </style>
</head>

<body>

<div class="container_com container_nav cf">
    <!--注销-->
    <c:if test="${!empty sessionScope.user}"><a href="logout" class="btn2">欢迎，${sessionScope.user.uname}【注销】</a></c:if>
	<a href="index.jsp" class="logo">
    	<img src="images/logo.png" width="258" height="91" />
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

<!--标题-->
<div class="container_com  container_full title_coloumn">
	<span class="cn">个人信息</span>
    <div class="title_coloumn_line"><img src="images/title_tip.gif" width="20" height="31" class="title_img" /></div>
</div>

<!--修改个人信息-->
<!--已上传资料内容-->
<div class="container_com container_1000 m_center cf b_70">

    <div class="cell_wrap container_s">
        <div class="cell_wrap_b">
            <div class="cell_wrap_container">

                <ul class="nav nav-tabs">
                    <li class="active"><a href="#shenfen" data-toggle="tab">修改信息</a></li>
                    <li><a href="#mima" data-toggle="tab">修改密码</a></li>
                </ul>
                <div class="tab-content" style="padding: 10px;">
                    <!--修改个人信息-->
                    <div class="tab-pane active" id="shenfen">
                        <form action="xiugai">
                            <div class="row" style="margin-bottom: 15px;margin-top:20px;">
                                <div class="col-xs-3"></div>
                                <div class="col-xs-6">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label text-right">手机号</label>
                                        <div class="col-sm-6">
                                            <input onfocus=this.blur(); name="uphone" style="text-align: center;" type="text" class="form-control" value="${user.uphone}">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-3"></div>
                            </div>
                            <div class="row" style="margin-bottom: 15px;">
                                <div class="col-xs-3"></div>
                                <div class="col-xs-6">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label text-right">姓名</label>
                                        <div class="col-sm-6">
                                            <input name="uname" style="text-align: center;" type="text" class="form-control" value="${user.uname}">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-3"></div>
                            </div>
                            <div class="row" style="margin-bottom: 15px;">
                                <div class="col-xs-3"></div>
                                <div class="col-xs-6">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label text-right">宿舍号</label>
                                        <div class="col-sm-6">
                                            <input name="uapart" style="text-align: center;" type="text" class="form-control" value="${user.uapart}">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-3"></div>
                            </div>
                            <div class="row" style="margin-bottom: 15px;">
                                <div class="col-xs-3"></div>
                                <div class="col-xs-6">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label text-right">支付宝昵称</label>
                                        <div class="col-sm-6">
                                            <input name="uzifu" style="text-align: center;" type="text" class="form-control"  value="${user.uzifu}">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-3"></div>
                            </div>
                            <button type="submit" class="btn btn-default col-xs-2 col-xs-offset-5">确认修改</button>
                        </form>
                    </div>
                    <!--修改密码-->
                    <div class="tab-pane" id="mima">
                        <form action="mima">
                            <div class="row" style="margin-bottom: 15px;margin-top:20px;">
                                <div class="col-xs-3"></div>
                                <div class="col-xs-6">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label text-right">旧密码</label>
                                        <div class="col-sm-6">
                                            <input name="password" style="text-align: center;" type="password" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-3"></div>
                            </div>
                            <div class="row" style="margin-bottom: 15px;">
                                <div class="col-xs-3"></div>
                                <div class="col-xs-6">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label text-right">新密码</label>
                                        <div class="col-sm-6">
                                            <input name="newPassword" style="text-align: center;" type="password" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-3"></div>
                            </div>
                            <div class="row" style="margin-bottom: 15px;">
                                <div class="col-xs-3"></div>
                                <div class="col-xs-6">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label text-right">确认新密码</label>
                                        <div class="col-sm-6">
                                            <input style="text-align: center;" type="password" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-3"></div>
                            </div>
                            <button type="submit" class="btn btn-default col-xs-2 col-xs-offset-5">确认修改</button>
                        </form>
                    </div>
                </div>


            </div>
        </div>
    </div>

</div>

<!--联系信息-->
<div class="container_com container_1000 m_center b_70">
	<div class="call_info m_center">
    	<div class="phone b_30">
        	<p>合作：027-84761733</p>
			<p>客服：400-0879-875</p>
        </div>
        <div class="wrap_qq  b_30">
        	<a href="http://wpa.qq.com/msgrd?v=3&uin=1040876664&site=qq&menu=yes" target="_blank" class="qqzaixian">在线客服</a>
            <a href="http://wpa.qq.com/msgrd?v=3&uin=1040876664&site=qq&menu=yes" target="_blank" class="qqzaixian">在线客服</a>
        </div>
        <div class="erweima cf">
        	<div class="f_left">
            	<span class="erweima_img">
                	<img src="images/erweima.png" width="130" height="130" />
                </span>
                <span class="weixin">官方微信（扫一扫）</span>
            </div>
            <div class="f_right">
                    <a href="#this" class="erweima_img">
                        <img src="images/wberweima.png" width="130" height="130" />
                    </a>
                    <a href="#this" class="weibo">官方微博（点一点）</a>
                </div>
        </div>
    </div>
</div>

<div class="footer">
    Copyright &copy;2016 行走的打印店 All rights reserved  技术支持：煜城工作室
</div>
<script>
    <c:if test="${!empty message}">alert("${message}");</c:if>
</script>
</body>
</html>
