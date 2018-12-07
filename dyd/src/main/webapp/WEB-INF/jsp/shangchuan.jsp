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
        /* 设置链接默认样式，默认颜色和鼠标移入颜色根据实际需求自行更改 */
        a:hover{text-decoration: none;}
        .btn2{float:right;position: absolute;top:-160px;color:#909090;font-size:12px;right:0px;border:1px solid #EAEAEA;background-color:#EAEAEA;}
        .btn2:hover{text-decoration: underline;color:#000;}
    </style>

</head>

<body>

<div class="container_com container_nav cf">
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
	<span class="cn">上传文件</span>
    <div class="title_coloumn_line"><img src="images/title_tip.gif" width="20" height="31" class="title_img" /></div>
</div>

<!--上传表单-->
<div class="container_com container_1000 m_center cf b_70">

    <div class="cell_wrap container_s">
        <div class="cell_wrap_b">
            <div class="cell_wrap_container">

                    <div class="row">
                        <div class="col-xs-7">
                            <form id="formdata" action="" enctype="multipart/form-data">
                            <div class="row form-group">
                                <label class="col-xs-3 text-right">请选择文件</label>
                                <div class="col-xs-6">
                                    <input id="data" type="file" name="file" class="form-control">
                                </div>
                                <div class="xol-xs-3">
                                    <button id="scb" class="btn btn-primary" type="button">上传文件</button>
                                </div>
                            </div>
                            </form>
                            <script>
                                $(function () {
                                    $("#scb").click(function () {
                                        var upfile = new FormData($("#formdata")[0]);
                                        $.ajax({
                                            url:'upload',
                                            type:'post',
                                            data:upfile,
                                            //必须false才会自动加上正确的Content-Type
                                            contentType: false,
                                            //必须false才会避开jQuery对 formdata 的默认处理
                                            //XMLHttpRequest会对 formdata 进行正确的处理
                                            processData: false,
                                            success:function(data){
                                                $('input[name="fid"]').attr("value",data);
                                                $("#scb").text("已上传");
                                               alert("上传成功！");
                                            },
                                            error:function(e){
                                                alert("上传失败，请重新上传！");
                                            }
                                        });
                                    });
                                });
                            </script>
                            <form action="fileinfo" id="formprice">
                            <div style="margin-bottom: 30px;">
                                <div class="row">
                                    <p class="col-xs-3 text-right" style="margin-bottom: 10px;font-weight: bold">请选择打印类型</p>
                                </div>
                                <div class="row radio">
                                    <div class="col-xs-3 text-right">单双面</div>
                                    <div class="col-xs-9">
                                        <label class="col-xs-3">
                                            <input type="radio" name="danshuang" value="单面" checked="checked">单面
                                        </label>
                                        <label class="col-xs-3">
                                            <input type="radio" name="danshuang" value="双面">双面
                                        </label>
                                    </div>
                                </div>
                                <div class="row radio">
                                    <div class="col-xs-3 text-right">纸张类型</div>
                                    <div class="col-xs-9">
                                        <label class="col-xs-3">
                                            <input type="radio" name="zhizhang" value="A3">A3
                                        </label>
                                        <label class="col-xs-3">
                                            <input type="radio" name="zhizhang" value="A4" checked="checked">A4
                                        </label>
                                    </div>
                                </div>
                                <div class="row radio">
                                    <div class="col-xs-3 text-right">是否彩印</div>
                                    <div class="col-xs-9">
                                        <label class="col-xs-3">
                                            <input type="radio" name="caiyin" value="彩">是
                                        </label>
                                        <label class="col-xs-3">
                                            <input type="radio" name="caiyin" value="" checked="checked">否
                                        </label>
                                    </div>
                                </div>
                                <div class="row radio">
                                    <div class="col-xs-3 text-right">是否加急</div>
                                    <div class="col-xs-9">
                                        <label class="col-xs-3">
                                            <input type="radio" name="jiaji" value="急">是
                                        </label>
                                        <label class="col-xs-3">
                                            <input type="radio" name="jiaji" value="" checked="checked">否
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="row form-group">
                                <label class="col-xs-3 text-right">总页码</label>
                                <div class="col-xs-4">
                                    <input name="yema" type="text" value="" class="form-control text-center">
                                </div>
                            </div>
                            <div class="row form-group">
                                <label class="col-xs-3 text-right">份数</label>
                                <div class="col-xs-4">
                                    <input name="fenshu" type="text" value="" class="form-control text-center">
                                </div>
                            </div>
                            <div class="row form-group">
                                <label class="col-xs-3 text-right">备注（可选填）</label>
                                <div class="col-xs-7">
                                    <textarea name="beizhu" class="form-control" rows="" cols=""></textarea>
                                </div>
                            </div>
                            <%--<div class="row form-group">--%>
                                <%--<label class="col-xs-3 text-right">手机号</label>--%>
                                <%--<div class="col-xs-4">--%>
                                    <%--<input onfocus=this.blur(); type="text" name="uphone" value="" class="form-control text-center">--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="row form-group">--%>
                                <%--<label class="col-xs-3 text-right">宿舍号</label>--%>
                                <%--<div class="col-xs-4">--%>
                                    <%--<input onfocus=this.blur(); type="text" name="uapart" value="" class="form-control text-center">--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="row form-group">--%>
                                <%--<label class="col-xs-3 text-right">支付宝昵称</label>--%>
                                <%--<div class="col-xs-4">--%>
                                    <%--<input onfocus=this.blur(); type="text" name="uzifu" value="" class="form-control text-center">--%>
                                <%--</div>--%>
                            <%--</div>--%>
                                <input type="hidden" name="fid" value="">
                                <input type="hidden" name="money" value="">
                            <div class="row">
                                <button id="pricebtn" type="button" style="position: relative;left: 15px;" class="btn btn-primary col-xs-3 col-xs-offset-3" data-toggle="modal" data-target="#myModal">提交</button>
                                <div class="radio col-xs-1 col-xs-offset-3">
                                </div>
                            </div>
                            </form>
                        </div>
                        <div class="col-xs-4" style="border:1px solid #6E6E6E;padding-top:15px;border-radius: 5px;">
                            <p style="color:#FE4101;">*提示：</p>
                            <p>1.在线支付金额与打印所需金额不一致时，订单将被拒绝。</p>
                            <p>2.......................</p>
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
<div class="row">

    <%--data-toggle="modal" data-target="#myModal"--%>
    <!-- 模态声明 -->
    <div class="modal fade" id="myModal">
        <!-- 窗口声明 -->
        <div class="modal-dialog" style="width:300px;">
            <!-- 内容声明 -->
            <div class="modal-content">
                <!-- 头部 -->
                <div class="modal-header">
                    <button type="button" class="close"
                            data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                    <h4 class="modal-title">支付宝支付</h4>
                </div>
                <!-- 主体 -->
                <div class="modal-body" style="text-align: center;">
                    <p class="text-center" style="nargin-bottom:20px;">请扫描二维码向我付款</p>
                    <p class="text-center">您应支付<span id="price" style="color:#FE4101;"></span>元</p>
                    <div style="width:130px;height:130px;margin:20px auto;">
                        <img src="images/erweima.png" width="130" height="130" />
                    </div>
                    <button id="zhifubtn" type="button" class="btn btn-default" data-dismiss="modal">支付完成</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="footer">
    Copyright &copy;2016 行走的打印店 All rights reserved  技术支持：煜城工作室
</div>
<script>
    $("#pricebtn").click(function () {
        var zhizhang;
        var zhi = $.trim($("input[name='zhizhang']:checked").val());
        var yema = $.trim($("input[name='yema']").val());
        var fenshu = $.trim($("input[name='fenshu']").val());
        if(zhi=="A3"){
            zhizhang = 0.2;
        }else{
            zhizhang = 0.1
        }
        var price = zhizhang*10*parseInt(yema)*parseInt(fenshu)/10;
        $("#price").text(price);
        $('input[name="money"]').attr("value",price);
        console.log(price);
    });
    $("#zhifubtn").click(function () {
        $("#formprice").submit();
    });
</script>
<script>
    $(function () {
        <c:if test="${!empty message}">alert("${message}");location.href="shangchuan";</c:if>
    });
</script>
</body>
</html>
