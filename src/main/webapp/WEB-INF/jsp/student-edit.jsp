<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/layer/layer.js"></script>
</head>
<body>
<form>
    <table class="table" style="width: 100%;text-align: center;">
        <tbody>
        <tr>
            <td>
                <input type="hidden" id="id" value="${stu.id}">
                <label for="name">姓名</label>
            </td>
            <td>
                <input type="text" readonly class="form-control" value="${stu.name}" id="name" name="name" required>
            </td>
            <td>
                <label for="sex">性别</label>
            </td>
            <td>
                <select class="form-control" name="sex" id="sex">
                    <c:if test="${stu.sex == '男'}">
                        <option value="男" selected>男</option>
                        <option value="女">女</option>
                    </c:if>
                    <c:if test="${stu.sex == '女'}">
                        <option value="男">男</option>
                        <option value="女" selected>女</option>
                    </c:if>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                <label for="sno">学号</label>
            </td>
            <td>
                <c:if test="${sessionScope.adminInfo.power >= 3}">
                    <input type="text" value="${stu.sno}" name="sno" class="form-control" id="sno" aria-describedby="textHelp" required>
                </c:if>
                <c:if test="${sessionScope.adminInfo.power < 3}">
                    <input type="text" readonly value="${stu.sno}" name="sno" class="form-control" id="sno" aria-describedby="textHelp" required>
                </c:if>

            </td>
            <td>
                <label for="stu_class">班级</label>
            </td>
            <td>
                <c:if test="${sessionScope.adminInfo.power < 2}">
                    <input type="text" readonly value="${stu.stu_class}" name="stu_class" class="form-control" id="stu_class" required>
                </c:if>
                <c:if test="${sessionScope.adminInfo.power >= 2}">
                    <input type="text" value="${stu.stu_class}" name="stu_class" class="form-control" id="stu_class" required>
                </c:if>
            </td>
        </tr>
        <tr>
            <td><label for="phone">联系方式</label></td>
            <td>
                <input type="text" value="${stu.phone}" name="phone" class="form-control" id="phone" required>
            </td>
            <td><label for="place">家庭住址</label></td>
            <td>
                <input type="text" value="${stu.place}" name="place" class="form-control" id="place" required>
            </td>
        </tr>
        <tr>
            <td><label for="dorm_id">宿舍号</label></td>
            <td>
                <c:if test="${sessionScope.adminInfo.power < 2}">
                    <input type="text" readonly value="${stu.dorm_id}" name="dorm_id" class="form-control" id="dorm_id" required>
                </c:if>
                <c:if test="${sessionScope.adminInfo.power >= 2}">
                    <input type="text" value="${stu.dorm_id}" name="dorm_id" class="form-control" id="dorm_id" required>
                </c:if>
            </td>
            <td><label for="teacher">育人导师</label></td>
            <td>
                <c:if test="${sessionScope.adminInfo.power >= 1}">
                    <input type="text" value="${stu.teacher}" name="teacher" class="form-control" id="teacher" required>
                </c:if>
                <c:if test="${sessionScope.adminInfo.power < 1}">
                    <input type="text" readonly value="${stu.teacher}" name="teacher" class="form-control" id="teacher" required>
                </c:if>

            </td>
        </tr>
        <tr>
            <td><label for="status">状态</label></td>
            <td colspan="3">
                <c:if test="${stu.status == 0}">
                    <select class="form-control" name="status" id="status">
                        <option value="0" selected>禁用</option>
                        <option value="1">激活</option>
                    </select>
                </c:if>
                <c:if test="${stu.status == 1}">
                    <select class="form-control" name="status" id="status">
                        <option value="0">禁用</option>
                        <option value="1" selected>激活</option>
                    </select>
                </c:if>

            </td>
        </tr>
        <tr>
            <td colspan="4">
                <button type="button" id="edit-btn" class="btn btn-primary">确认修改</button>
                <c:if test="${sessionScope.adminInfo.power > 2}">
                    <a type="button" class="btn btn-default" href="${pageContext.request.contextPath}/student/findAll">返回列表</a>
                </c:if>
                <c:if test="${sessionScope.adminInfo.power == 1}">
                    <a type="button" class="btn btn-default" href="${pageContext.request.contextPath}/dorm/byDorm_leader?uid=${sessionScope.adminInfo.uid}">返回列表</a>
                </c:if>
            </td>
        </tr>
        </tbody>
    </table>
</form>
<script>
    $("#edit-btn").click(function () {
        var id = $("#id").val().trim();
        var name = $("#name").val().trim();
        var sex = $("#sex").val().trim();
        var sno = $("#sno").val().trim();
        var stu_class = $("#stu_class").val().trim();
        var phone = $("#phone").val().trim();
        var place = $("#place").val().trim();
        var dorm_id = $("#dorm_id").val().trim();
        var teacher = $("#teacher").val().trim();
        var status = $("#status").val().trim();
        if (name == 0 || sex == 0 || sno == 0 || stu_class == 0 || phone == 0 || place == 0 || dorm_id == 0 || teacher == 0) {
            layer.msg('字段不能为空');
            return false;
        }
        layer.confirm('确定要修改吗',function (index) {
            if (${sessionScope.adminInfo.power < 1}) {
                layer.msg('对不起，您没有权限');
                layer.close(index);
                return false;
            }

        $.ajax({
            url: "${pageContext.request.contextPath}/student/update",//要请求的服务器url
            //这是一个对象，表示请求的参数，两个参数：method=ajax&val=xxx，服务器可以通过request.getParameter()来获取
            //data:{method:"ajaxTest",val:value},
            data: {
                id:id,
                name:name,
                sex:sex,
                sno: sno,
                stu_class:stu_class,
                phone: phone,
                place: place,
                dorm_id:dorm_id,
                teacher:teacher,
                status:status
            },
            type: "POST", //请求方式为POST
            dataType: "json",
            success:function(result){  //这个方法会在服务器执行成功时被调用 ，参数data就是服务器返回的值(现在是json类型)
                //alert(result);
                if(result){
                    layer.msg('修改成功');
                    if (${sessionScope.adminInfo.power == 1}) {
                        setTimeout(function () {window.location.href='${pageContext.request.contextPath}/dorm/byDorm_leader?uid=${sessionScope.adminInfo.uid}';},2000);
                        return false;
                    }
                    if (${sessionScope.adminInfo.power == 2}) {
                        setTimeout(function () {window.location.href='${pageContext.request.contextPath}/dorm/findStudent?name=${sessionScope.adminInfo.name}';},2000);
                        return flase;
                    }
                    setTimeout(function () {window.location.href='${pageContext.request.contextPath}/student/findAll';},2000);
                }else {
                    layer.msg('修改失败，请联系管理员');
                    if (${sessionScope.adminInfo.power == 1}) {
                        setTimeout(function () {window.location.href='${pageContext.request.contextPath}/dorm/byDorm_leader?uid=${sessionScope.adminInfo.uid}';},2000);
                        return false;
                    }
                    if (${sessionScope.adminInfo.power == 2}) {
                        setTimeout(function () {window.location.href='${pageContext.request.contextPath}/dorm/findStudent?name=${sessionScope.adminInfo.name}';},2000);
                        return flase;
                    }
                    setTimeout(function () {window.location.href='${pageContext.request.contextPath}/student/findAll';},2000);
                }
            }
        });
        });
    });
</script>
</body>
</html>
