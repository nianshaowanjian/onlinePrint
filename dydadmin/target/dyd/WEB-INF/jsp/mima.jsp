<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html lang="zh-cn">
<head >
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title></title>
    <script src="js/laydate.js"></script>
    <link rel="stylesheet" type="text/css" href="css/index1.css">
    <style>
        .pad{display: inline-block;margin-bottom: 15px;text-align: center;}
    </style>
</head>
<body class="mian_bj">
<div class="mian_top_01">
    <div class="mian_top_c">
        <ul>
            <li><a><p>修改密码</p></a></li>
        </ul>
    </div>
    <div class="mian_b">
        <div style="text-align: center;background: #eee;" class="mima">
            <form method="post" action="modifypwd">
                <input style="margin-top: 20px;" class="pad" type="password" class="pad" name="apwd" placeholder="请输入新密码" /><br/>
                <input type="password" class="pad" name="" placeholder="请确认新密码" /><br/>
                <button type="submit" style="margin-bottom: 20px;">确认修改</button>
            </form>
        </div>
    </div>
</div>
<script>
    <c:if test="${!empty message}"> alert("${message}");</c:if>
</script>
</body>
</html>