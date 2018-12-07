<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title></title>
    <script src="js/jquery.min.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: "微软雅黑";
        }

        body {
            background: #F7F7F7;
        }

        .form {
            margin:0 auto;
            height: 420px;
            width: 340px;
            font-size: 18px;
            -webkit-box-shadow: 0px 0px 10px #A6A6A6;
            background: #fff;
        }

        .border-btn {
            border-bottom: 1px solid #ccc;
        }

        #landing,
        #registered {
            float: left;
            text-align: center;
            width: 170px;
            padding: 15px 0;
            color: #545454;
        }

        #landing-content {
            clear: both;
        }

        .inp1 {
            height: 30px;
            margin: 0 auto;
            margin-bottom: 30px;
            width: 200px;
        }

        .inp1>input {
            text-align: center;
            height: 30px;
            width: 200px;
            margin: 0 auto;
            transition: all 0.3s ease-in-out;
        }
        .inp2 {
            height: 25px;
            margin: 0 auto;
            margin-bottom: 15px;
            width: 200px;
        }

        .inp2>input {
            text-align: center;
            height: 25px;
            width: 200px;
            margin: 0 auto;
            transition: all 0.3s ease-in-out;
        }

        .login {
            border: 1px solid #A6A6A6;
            color: #a6a6a6;
            height: 30px;
            width: 202px;
            text-align: center;
            font-size: 13.333333px;
            margin-left: 70px;
            line-height: 30px;
            margin-top: 30px;
            transition: all 0.3s ease-in-out;
        }

        .login:hover {
            background: #A6A6A6;
            color: #fff;
        }

        #bottom {
            margin-top: 30px;
            font-size: 13.333333px;
            color: #a6a6a6;
        }

        #registeredtxt {
            float: left;
            margin-left: 80px;
        }

        #forgotpassword {
            float: right;
            margin-right: 80px;
        }

        #photo {
            border-radius: 80px;
            border: 1px solid #ccc;
            height: 80px;
            width: 80px;
            margin: 0 auto;
            overflow: hidden;
            clear: both;
            margin-top: 30px;
            margin-bottom: 30px;
        }

        #photo>img:hover {
            -webkit-transform: rotateZ(360deg);
            -moz-transform: rotateZ(360deg);
            -o-transform: rotateZ(360deg);
            -ms-transform: rotateZ(360deg);
            transform: rotateZ(360deg);
        }

        #photo>img {
            height: 80px;
            width: 80px;
            -webkit-background-size: 220px 220px;
            border-radius: 60px;
            -webkit-transition: -webkit-transform 1s linear;
            -moz-transition: -moz-transform 1s linear;
            -o-transition: -o-transform 1s linear;
            -ms-transition: -ms-transform 1s linear;
        }


        #registered-content {
            margin-top: 40px;
            display: none;
        }

        .fix {
            clear: both;
        }
        .disno{display: none;}
    </style>
</head>

<body>
<div class="form">
    <div id="landing">登录</div>
    <div id="registered">注册</div>
    <div class="fix"></div>
    <div id="landing-content">
        <form autocomplete="off" action="" id="denglu">
            <div id="photo"><img src="images/photo.jpg" /></div>
            <div class="inp1"><input name="uphoned" type="text" placeholder="手机号" /></div>
            <div class="inp1"><input name="upwdd" type="password" placeholder="密码" /></div>
            <button type="button" id="dl" class="login">登录</button>
            <button type="button" id="zz" class="login disno">正在登陆...</button>
        </form>
    </div>
    <div autocomplete="off" id="registered-content">
        <form action="" id="zhuce">
            <div class="inp2"><input name="uname" type="text" placeholder="请输入姓名" /></div>
            <div class="inp2"><input name="uphone" type="text" placeholder="请输入手机号" /></div><!--需要判断手机号为11位数字-->
            <div class="inp2"><input name="uapart" type="text" placeholder="请输入宿舍号" /></div>
            <div class="inp2"><input name="uzifu" type="text" placeholder="请输入支付宝昵称" /></div>
            <div class="inp2"><input name="upwd" type="password" placeholder="请输入密码" /></div>
            <div class="inp2"><input name="password" type="password" placeholder="请再次输入密码" /></div>
            <button id="zc" type="button" class="login">立即注册</button>
        </form>
    </div>
</div>
<script>
    $(document).ready(function() {

        $("#landing").addClass("border-btn");

        $("#registered").click(function() {
            $("#landing").removeClass("border-btn");
            $("#landing-content").hide(500);
            $(this).addClass("border-btn");
            $("#registered-content").show(500);

        });

        $("#landing").click(function() {
            $("#registered").removeClass("border-btn");
            $(this).addClass("border-btn");

            $("#landing-content").show(500);
            $("#registered-content").hide(500);
        });

        $('#dl').click(function () {
            if($("input[name='uphoned']").val()==''||$("input[name='uphoned']").val()==null||$("input[name='uphoned']").val()==undefined){
                alert("请输入电话号和密码！");
                return;
            }
            $('#dl').addClass('disno');
            $('#zz').removeClass('disno');
            var data=$('#denglu').serialize();
            $.post("login",data,function(data){
                if(data=='1'){
                    top.location.href="index";
                }else if(data=='0'){
                    alert('登录失败！');
                    top.location.href="index";
                }else {
                    alert('系统错误，请联系管理员！');
                    top.location.href="index";
                }
            });
        });

        $("#zc").click(function () {
            var uname=$.trim($('input[name="uname"]').val());
            var uphone=$.trim($('input[name="uphone"]').val());
            var uapart=$.trim($('input[name="uapart"]').val());
            var uzifu=$.trim($('input[name="uzifu"]').val());
            var upwd=$.trim($('input[name="upwd"]').val());
            var password=$.trim($('input[name="password"]').val());
            if(upwd!=password){
                alert("密码不一致");
                return false;
            }
            var data = $("#zhuce").serialize();
            $.post("register",data,function(data){
                console.log(data);
                if(data=='1'){
                    alert('注册成功！');
                    top.location.href="index";
                }else if(data=='2'){
                    alert('此手机号已注册！');
                    top.location.href="index";
                }else if(data=='0'){
                    alert('注册失败！');
                    top.location.href="index";
                } else {
                    alert('系统错误，请联系管理员！');
                    top.location.href="index";
                }
            });
        });
    });
</script>
</body>

</html>