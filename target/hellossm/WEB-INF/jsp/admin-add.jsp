<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020/2/12
  Time: 13:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layer.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layer/layer.js"></script>
</head>
<body background="${pageContext.request.contextPath}/images/01.jpg">
<br><br>
<div class="row form-horizontal">
    <div class="form-group">
        <label class="col-sm-2 control-label form-label">用户名:</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" name="username" id="username">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label form-label">密码:</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" name="password" id="password">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label form-label">姓名:</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" name="name" id="name">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label form-label">学/工号:</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" name="uid" id="uid">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label form-label">手机号:</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" name="phone" id="phone">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label form-label">权限:</label>
        <div class="col-sm-8">
            <select class="form-control" name="power" id="power">
                <option value="0" selected>访客</option>
                <c:if test="${sessionScope.adminInfo.power > 0}">
                    <option value="1">宿舍长</option>
                </c:if>
                <c:if test="${sessionScope.adminInfo.power > 1}">
                    <option value="2">普通管理员</option>
                </c:if>
                <c:if test="${sessionScope.adminInfo.power > 2}">
                    <option value="3">超级管理员</option>
                </c:if>
                <c:if test="${sessionScope.adminInfo.power > 3}">
                    <option value="4">系统管理员</option>
                </c:if>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label form-label">描述:</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" name="description" id="description">
        </div>
    </div>
</div>
<div class="row">
    <div class="form-group btn-group col-md-offset-5">
        <button class="btn btn-primary" onclick="toValidate()">确认添加</button>
        <a type="button" class="btn btn-default" href="${pageContext.request.contextPath}/findAllAdmin">返回列表</a>
    </div>
</div>

</body>
<script src="${pageContext.request.contextPath}/js/jquery-3.1.1.js"></script>
<script src="${pageContext.request.contextPath}/js/validate.js"></script>
<script>
    $(function () {
        //ajax校验用户名是否存在
        $("#username").change(function () {
            //取username的值
            var u_name = $(this).val();
            //ajax异步请求
            $.get("${pageContext.request.contextPath}/checkUserName",{"u_name":u_name},function (msg) {
                //$(".error").html(msg);
                if (msg == "账号可用") {
                    layer.msg('用户名已存在');
                }else {
                    layer.msg('用户名可用');
                }
            });
        });
    });
    $("#uid").change(function () {
        var uid = $("#uid").val().trim();
        $.get("${pageContext.request.contextPath}/checkUid",{"uid":uid},function (data) {
            if (data) {
                layer.msg('该学/工号已被注册，请重新输入');
            }
        });
    });
    function toValidate(){
        var val = new validate({
            /*rules里面是检验规则，
            *key为需要检验的input的id,
            *value为此input对应的检验规则
            */
            rules:{
                username:"notEmpty",
                name:"notEmpty",
                uid:"notEmpty",
                description:"notEmpty",
                phone:"mobile",
                password:"notEmpty"
            },
            /*submitFun里面为检验成功后要执行的方法*/
            submitFun:function(){
                toSubmit();
            }
        })
    }
    function toSubmit(){
        //增加管理员，异步提交管理员表单
        var username = $("#username").val().trim();
        var password = $("#password").val().trim();
        var name = $("#name").val().trim();
        var uid = $("#uid").val().trim();
        var phone = $("#phone").val().trim();
        var power = $("#power").val().trim();
        var description = $("#description").val().trim();
        $.ajax({
            url: "${pageContext.request.contextPath}/addAdmin",//要请求的服务器url
            //这是一个对象，表示请求的参数，两个参数：method=ajax&val=xxx，服务器可以通过request.getParameter()来获取
            //data:{method:"ajaxTest",val:value},
            data: {
                username:username,
                password:password,
                name: name,
                uid:uid,
                phone: phone,
                power: power,
                description: description
            },
            type: "POST", //请求方式为POST
            dataType: "json",   //服务器返回的数据是什么类型
            success: function(result){  //这个方法会在服务器执行成功时被调用 ，参数result就是服务器返回的值(现在是json类型)
                if(result){
                    layer.msg('添加成功');
                    setTimeout(function () {window.location.href='${pageContext.request.contextPath}/findAllAdmin';},2000);
                }else {
                    layer.msg('添加失败，请联系管理员');
                    setTimeout(function () {window.location.href='${pageContext.request.contextPath}/findAllAdmin';},2000);
                }
            }
        });
    }
</script>
</body>
</html>
