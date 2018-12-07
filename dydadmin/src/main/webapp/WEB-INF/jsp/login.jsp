<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>在线web打印平台</title>
    <link rel="stylesheet" type="text/css" href="css/index1.css">
</head>
<body style="background:#000;height: 80%;">
<div class="png login_logo"><img src="images/qwe.png" alt="" /></div>
<div class="login">
    <form autocomplete="off" action="login" method="post">
        <div class="login_1"><input value="admin" name="aphone" type="text"></div>
        <div class="login_2"><input value="root" name="apwd" type="password"></div>
        <div class="login_3"></div>
        <div class="login_4 png">
            <button type="submit"><img src="images/login_08.jpg"></button>
        </div>
    </form>
</div>
</body>
</html>
<script>
    if (top.location !== self.location) {
        top.location=self.location;
    }
    <c:if test="${!empty message}">alert("${message}");</c:if>
</script>