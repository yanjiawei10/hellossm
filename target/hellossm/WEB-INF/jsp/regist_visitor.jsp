<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020/2/18
  Time: 15:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="renderer" content="webkit" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0,user-scalable=0,uc-fitscreen=yes" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta name="format-detection" content="telephone=no" />
    <title>来访登记</title>
    <!-- miniMObile.css、js -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/miniMobile.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layer/layer.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zepto.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/miniMobile.js"></script>
    <!-- mobileSelect -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/mobileSelect.css">
    <script src="${pageContext.request.contextPath}/js/mobileSelect.js" type="text/javascript"></script>
    <!-- noUiSlider -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/nouislider.css" />
    <!-- switchery -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/switchery.css"/>
    <!-- iconfont -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/iconfont.css" />
    <!-- animate.css -->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.css" />
</head>

<body class="pb12 fadeIn animated">
<header class="formheader w75 h8 f30 color6 bg-color-info" style="text-align: center;">
    学生来访登记
</header>
<style>
    .formheader {
        line-height: 0.7rem;
    }

    .formheader span {
        display: inline-block;
    }

    .formheader input {
        border: none;
    }
</style>
<div class="p3 f30 f30 w75">
    <form action="${pageContext.request.contextPath}/visitor/addLogin" method="post" name="myform">
        <div class="pt2 pb2">
            姓名：
            <input type="text" class="w59  form-control" name="name" id="name" placeholder="输入姓名"  maxlength="10" />
        </div>
        <div>
            学号：
            <input type="text" class="w59  form-control" name="sno" id="sno" min="5" max="20" placeholder="输入学号" />
        </div>
        <div class="pt2 pb2">
            手机：
            <input type="text" class="w59  form-control" name="phone" id="phone" placeholder="输入联系方式" />
        </div>
        <div class="pt2 pb2">
            楼宇：
            <select class="w59  form-control" id="place" name="place">
                <option value="西六一楼">西六一楼</option>
                <option value="西六二楼">西六二楼</option>
                <option value="西六三楼">西六三楼</option>
                <option value="西七一楼">西七一楼</option>
                <option value="西七二楼" selected="selected">西七二楼</option>
                <option value="西七三楼">西七三楼</option>
                <option value="西十二一楼">西十二一楼</option>
                <option value="西十二二楼">西十二二楼</option>
                <option value="西十二三楼">西十二三楼</option>
                <option value="西十三一楼">西十三一楼</option>
                <option value="西十三二楼">西十三二楼</option>
                <option value="西十三三楼">西十三三楼</option>
            </select>
        </div>
        <div class="mt4 mb4">
            备注：
            <input class="w59 h20 form-control" value="公事" id="visit_result" name="visit_result" placeholder="访问原因" />
        </div>
        <div class="t-c mt5">
            <input type="button" onclick="toCheck()" id="sub-btn" class="btn f30 btn-primary radius10 p2 w50" value="提交登记" />
        </div>
    </form>
</div>
<script>
    function toCheck() {
        var name = $("#name").val().trim();
        var sno = $("#sno").val().trim();
        var phone = $("#phone").val().trim();
        var place = $("#place").val().trim();
        var visit_result = $("#visit_result").val().trim();
        if (name == null || sno == null || phone == null || place == null || visit_result == null
            || name.length == 0 || sno.length == 0 || phone.length == 0 || place.length == 0 || visit_result.length == 0) {
            layer.msg('不能为空，请输入信息...');
            return false;
        }
        document.myform.submit();
    }
    if (${logout_msg != null && !(logout_msg.trim().equals(""))}) {
        layer.msg(${logout_msg});
    }
    if (${error_msg != null && !("".trim().equals(error_msg))}) {
        layer.msg(${error_msg});
    }
</script>
</body>
</html>
