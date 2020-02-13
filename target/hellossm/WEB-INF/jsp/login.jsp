<%--
  Created by IntelliJ IDEA.
  User: PeiChen
  Date: 2020/2/10
  Time: 10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/usersLogin.css">
    <link rel="icon" href="${pageContext.request.contextPath}/images/favicon.ico" sizes="32x32" />
    <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.js"></script>
    <script src="${pageContext.request.contextPath}/layer/layer.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/login.js"></script>
    <title>登录页面--LOGIN</title>
    <style>
        body {
            padding-bottom: 50px;
        }
        .footer {
            position: fixed;
            left: 0px;
            bottom: 0px;
            width: 100%;
            height: 80px;
            background-color: #eee;
            z-index: 9999;
        }
    </style>
<script type="text/javascript">
    $(function () {
        //ajax校验用户名是否存在
        $("#username").change(function () {
            //取username的值
            var u_name = $(this).val();
            //ajax异步请求
            $.get("${pageContext.request.contextPath}/checkUserName",{"u_name":u_name},function (msg) {
                //$(".error").html(msg);
                if (msg == "账号可用") {
                    layer.msg('账号可用');
                }else {
                    layer.msg('账号不存在');
                }
            });
        });
    });

</script>
</head>
<body>

<div class="header">

</div>

<div class="body">
    <div class="panel">
        <div class="top">
            <p>登录页面--LOGIN</p>
        </div>

        <div class="middle">
            <form action="${pageContext.request.contextPath}/login" method="post">
                &emsp;&emsp;&emsp;&emsp;
                <span class="error">${msg}</span>
                <span class="s1"></span>
                <span class="s2"></span>
                <input type="text" name="username" id="username" placeholder="用户名"  class="iputs"/>
                <input type="password" name="password" placeholder="密码" class="iputs"/>
                <input type="submit" value="登录"/>
            </form>
        </div>
    </div>
</div>
<div class="footer" style="font:12px Tahoma;color: #000000; margin:0px auto; text-align:center;">
    <br/>
    Copyright &copy; &nbsp;&nbsp;2019-2020&nbsp;
    &nbsp;&nbsp;皮皮的小猪仔&nbsp;&nbsp; All Rights Reserved<br/>
    联系方式：2535414380@qq.com<br/>
    <!-- <img style="width: 20px; height: 20px;" src="http://www.beian.gov.cn/img/ghs.png" alt="备案标识" /><a href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=32058202010228&token=2be051c1-22dd-44ec-9f4b-d41155f2d855" target="_blank" rel="nofollow noopener noreferrer">豫公网安备号</a> -->
    ICP:<a href="http://beian.miit.gov.cn">豫ICP备20001139号-1</a>
</div>
</body>
</html>
