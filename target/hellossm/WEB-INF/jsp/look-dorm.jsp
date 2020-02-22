<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020/2/20
  Time: 17:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layer/layer.js"></script>
</head>
<body>
<br />
<form>
    <table class="table" style="width: 100%;text-align: center;">

        <tbody>
        <tr>
            <td style="text-align: center"><label>宿舍号</label></td>
            <td colspan="3" style="text-align: center">${dorm.dorm_id}</td>
        </tr>
        <tr>
            <td style="text-align: center"><label>宿舍简介</label></td>
            <td colspan="3" style="text-align: center">${dorm.dorm_intro}</td>
        </tr>
        <tr>
            <td style="text-align: center">
                <label>宿舍奖惩</label>
            </td>
            <td colspan="3" style="text-align: center">${dorm.dorm_rps}</td>
        </tr>
        <tr>
            <td style="text-align: center">
                <label>宿舍长</label>
            </td>
            <td colspan="3" style="text-align: center">${dorm.dorm_leader}</td>
        </tr>
        <tr>
            <td style="text-align: center"><label>育人导师</label></td>
            <td colspan="3" style="text-align: center">${dorm.teacher}</td>
        </tr>
        <c:if test="${sessionScope.adminInfo.power == 1}">
            <tr>
                <td colspan="4"><a class="btn btn-warning" href="${pageContext.request.contextPath}/dorm/toUpdate?id=${dorm.id}">去修改</a></td>
            </tr>
        </c:if>
        </tbody>
    </table>
</form>

</body>
</html>
