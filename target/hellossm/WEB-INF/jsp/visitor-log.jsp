<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020/2/21
  Time: 10:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui/css/modules/layer/default/layer.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.js"></script>
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend>访客时间线</legend>
</fieldset>
<ul class="layui-timeline">
    <li class="layui-timeline-item">
        <i class="layui-icon layui-timeline-axis"></i>
        <div class="layui-timeline-content layui-text">
            <h3 class="layui-timeline-title" id="mytime"></h3>
            <p>
                访客日志共计：&nbsp;${pageInfo.total}&nbsp;条&emsp;当前显示：${pageInfo.size}&nbsp;条&emsp;&emsp;
                <c:if test="${pageInfo.pageNum > 1}">
                    <a href="${pageContext.request.contextPath}/visitor/log?page=${pageInfo.pageNum - 1}&size=10">上一页</a>&emsp;&emsp;
                </c:if>
                <c:if test="${pageInfo.pageNum < pageInfo.pages}">
                    <a href="${pageContext.request.contextPath}/visitor/log?page=${pageInfo.pageNum + 1}&size=10">下一页</a>
                </c:if>
            </p>
            <ul>
                <c:forEach items="${pageInfo.list}" var="log">
                    <c:if test="${log.end_date == ''}">
                        <li>【${log.name}】于&nbsp;${log.begin_date}&nbsp;访问了${log.place}，事因${log.visit_result}，目前尚未离开</li>
                    </c:if>
                    <c:if test="${log.end_date != ''}">
                        <li>【${log.name}】于&nbsp;${log.begin_date}&nbsp;访问了${log.place}，事因${log.visit_result}，并与${log.end_date}离开</li>
                    </c:if>
                </c:forEach>
            </ul>
        </div>
    </li>
    <li class="layui-timeline-item">
        <i class="layui-icon layui-timeline-axis"></i>
        <div class="layui-timeline-content layui-text">
            <div class="layui-timeline-title">2020.02.21日志开启</div>
        </div>
    </li>
</ul>
<script>
    function showTime(){
        var nowtime =new Date();
        var year=nowtime.getFullYear();
        var month=nowtime.getMonth()+1;
        var date=nowtime.getDate();
        document.getElementById("mytime").innerText=year+"年"+month+"月"+date+"日";
    }
    setInterval("showTime()",1000*60);

</script>
</body>
</html>
