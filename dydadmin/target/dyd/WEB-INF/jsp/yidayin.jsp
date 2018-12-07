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
    <style>
        .laydate_box, .laydate_box * {
            box-sizing:content-box;
        }
    </style>
</head>
<body class="mian_bj">
<div class="mian_top_01">
    <div class="mian_top_c">
        <ul>
            <li><a><p>已打印信息</p></a></li>
        </ul>
    </div>
    <div class="mian_b">
        <div class="mian_b1">
            <div style="padding-top: 15px;padding-left: 15px;">
                <form autocomplete="off" action="sel" method="post">
                    开始时间点：<input type="text" name="ftimeago" class="laydate-icon" id="d1" />
                    &nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;
                    截止时间点：<input type="text" name="ftime" class="laydate-icon" id="d2" />
                    &nbsp;&nbsp;&nbsp;
                    <button type="submit">查询</button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button>一键导出Excel表格</button>
                </form>
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
            </tr>
            <c:forEach items="${list}" var="i" varStatus="status">
            <tr>
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
            </tr>
            </c:forEach>
        </table>
    </div>
</div>
<script type="text/javascript">
    !function(){
        laydate.skin('yahui');//切换皮肤，请查看skins下面皮肤库
        laydate({ elem: '#d1',
            format: 'YYYY-MM-DD',
            festival: true, //显示节日
            //istime: true,//时分秒
            //min: laydate.now(), //设定最小日期为当前日期
            //max: '2099-06-16', //最大日期
            /*choose: function(datas){ //选择日期完毕的回调
                alert('得到：'+datas);
            }*/
        });//绑定元素
        laydate({
            elem: '#d2',
            format:'YYYY-MM-DD',
            festival: true,
        });//绑定元素
    }();

    $("[data-toggle='popover']").popover();
</script>
</body>
</html>