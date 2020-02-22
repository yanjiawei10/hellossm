<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020/2/18
  Time: 20:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登记成功</title>
</head>
<body>

<h4 style="text-align: center;">恭喜您，来访登记成功！</h4>
<br>
<a href="${pageContext.request.contextPath}/visitor/login_out?id=${id}" style="text-align: center;">注销登记</a>
</body>
</html>
