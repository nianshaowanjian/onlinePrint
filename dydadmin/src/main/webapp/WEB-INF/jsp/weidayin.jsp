<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE>
<html lang="zh-cn">
<head >
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title></title>
    <script src="js/laydate.js"></script>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/index1.css">
</head>
<body class="mian_bj">
<div class="mian_top_01">
    <div class="mian_top_c">
        <ul>
            <li><a><p>未打印信息</p></a></li>
        </ul>
    </div>
    <div class="mian_b">
        <div class="mian_b1">
            <div style="padding-top: 15px;padding-left: 15px;text-align: center;">
                <button>一键导出Excel表格</button>
            </div>
        </div>
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="mian_b_bg" style="white-space: nowrap;overflow: hidden;text-overflow:ellipsis;">
            <tr>
                <td class="mian_b_bg_lm"><span></span>时间</td>
                <td class="mian_b_bg_lm"><span></span>手机号</td>
                <td class="mian_b_bg_lm"><span></span>姓名</td>
                <td class="mian_b_bg_lm"><span></span>宿舍号</td>
                <td class="mian_b_bg_lm"><span></span>支付宝昵称</td>
                <td class="mian_b_bg_lm"><span></span>文件</td>
                <td class="mian_b_bg_lm"><span></span>总页码</td>
                <td class="mian_b_bg_lm"><span></span>金额</td>
                <td class="mian_b_bg_lm"><span></span>打印类型</td>
                <td class="mian_b_bg_lm"><span></span>备注</td>
                <td class="mian_b_bg_lm"><span></span>加急</td>
                <td class="mian_b_bg_lm" colspan="2"><span></span>操作</td>
            </tr>

           <c:forEach items="${list}" var="i" varStatus="status">
               <tr id="${i.fid}">
                   <td><fmt:formatDate value="${i.ftime}" pattern="yyyy/MM/dd  HH:mm:ss" /></td>
                   <td>${i.user.uphone}</td>
                   <td>${i.user.uname}</td>
                   <td>${i.user.uapart}</td>
                   <td>${i.user.uzifu}</td>
                   <td>
                       <a href="" style="color:blue;">${i.fname}</a>
                   </td>
                   <td>${i.yema}页</td>
                   <td>${i.money}元</td>
                   <td>${i.zhizhang},${i.danshuang},${i.caiyin}</td>
                   <td><c:if test="${!empty i.beizhu}">
                       <a style="cursor: pointer;" data-container="body" data-toggle="popover" data-placement="left"
                          data-content="${i.beizhu}">
                           备注</a></c:if></td>
                   <td>${i.jiaji}</td>
                   <td>
                       <a path="dayin?fid=${i.fid}" onclick="dayin(this)" href="###" style="color:blue;">打印</a>
                   </td>
                   <td>
                       <a fid="${i.fid}" onclick="setfid(this)" href="###" data-toggle="modal" data-target="#myModal">拒绝</a>
                   </td>
               </tr>
           </c:forEach>
        </table>
    </div>
</div>

<!-- 模态声明-->
<div class="modal fade" id="myModal">
    <!-- 窗口声明 -->
    <div class="modal-dialog" style="width: 400px;">
        <!-- 内容声明 -->
        <div class="modal-content">
            <!-- 头部 -->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
                <p class="modal-title" style="font-size: 20px;">请输入拒绝理由</p>
            </div>
            <form action="" method="post" id="jujue">
                <!-- 主体 -->
                <div class="modal-body">
                    <input type="hidden" id="jujuef" name="fid" value="">
                    <textarea placeholder="请言简意赅。。" name="jujue" class="form-control" cols="" rows="" style="width: 100%"></textarea>
                </div>
                <!-- 注脚 -->
                <div class="modal-footer">
                    <a onclick="jujue()" href="###" data-dismiss="modal" class="btn btn-default">发送</a>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    function dayin(obj){
        var self = $(obj);
        var path = self.attr("path");
        $.get(path,function (data,status) {
            console.log(status);
            if(data=="1"){
                self.parent().parent().hide();
            }else {
                alert("打印失败，请重试！");
            }
        })
    }
    function setfid(obj) {
        var fid = $(obj).attr("fid");
        $("#jujuef").attr("value",fid);
    }
    function jujue(){
        data = $("#jujue").serialize();
        $.post("jujue",data,function (res) {
            if(res=="1"){
                var fid = $("#jujuef").val();
                $("#"+fid).hide();
            }else {
                alert("拒绝失败，请重试！");
            }
        })
    }
    $(function () {
        $("[data-toggle='popover']").popover();
    });
</script>
</body>
</html>