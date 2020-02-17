<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020/2/17
  Time: 12:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</head>
<body>
<form>
    <table class="table" style="width: 100%;text-align: center;">
        <tbody>
        <tr>
            <td>
                <label for="name">姓名</label>
            </td>
            <td>
                <input type="text" readonly class="form-control" value="peichen" id="name" name="name" required>
            </td>
            <td>
                <label for="sex">性别</label>
            </td>
            <td>
                <select class="form-control" name="sex" id="sex">
                    <option value="男" selected>男</option>
                    <option value="女">女</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                <label for="sno">学号</label>
            </td>
            <td>
                <input type="text" name="sno" class="form-control" id="sno" aria-describedby="textHelp" required>
            </td>
            <td>
                <label for="class">班级</label>
            </td>
            <td>
                <input type="text" name="class" class="form-control" id="class" required>
            </td>
        </tr>
        <tr>
            <td><label for="phone">联系方式</label></td>
            <td>
                <input type="text" name="phone" class="form-control" id="phone" required>
            </td>
            <td><label for="place">家庭住址</label></td>
            <td>
                <input type="text" name="place" class="form-control" id="place" required>
            </td>
        </tr>
        <tr>
            <td><label for="dorm_id">宿舍号</label></td>
            <td>
                <input type="text" name="dorm_id" class="form-control" id="dorm_id" required>
            </td>
            <td><label for="teacher">育人导师</label></td>
            <td>
                <input type="text" name="teacher" class="form-control" id="teacher" required>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <button type="submit" id="addAdmin" class="btn btn-primary">确认修改</button>
                <a type="button" class="btn btn-default">返回列表</a>
            </td>
        </tr>
        </tbody>
    </table>
</form>
</body>
</html>
