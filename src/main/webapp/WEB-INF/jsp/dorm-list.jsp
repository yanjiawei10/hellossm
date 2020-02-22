<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020/2/18
  Time: 15:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title></title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.js"></script>
    <script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.js"></script>
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script>
        function changePageSize() {
            //获取下拉框的值
            var pageSize = $("#changePageSize").val();
            //向服务器发送请求，改变每页显示条数
            location.href = "${pageContext.request.contextPath}/dorm/findAll?page=1&size="+ pageSize;
        }
        $("#serarch_btn").click(function () {
            var keyword = $("#keyword").val();
            location.href="${pageContext.request.contextPath}/dorm/findAll?page=1&size=5&keyword="+keyword;
        });
        $("#refresh").click(function () {
            $("#myform").reset();
            location.href="${pageContext.request.contextPath}/dorm/findAll?page=1&size=5";
        });
    </script>
</head>
<body>
<%--<div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="">首页</a>
            <a href="">演示</a>
            <a>
              <cite>导航元素</cite></a>
          </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>--%>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">
                    <form id="myform" class="layui-form layui-col-space5">
                        <div class="layui-inline layui-show-xs-block">
                            <input class="layui-input" type="text" autocomplete="off" placeholder="请输入关键字" name="keyword" id="keyword" value="${param.keyword}">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <button class="layui-btn"  id="serarch_btn" lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
                        </div>
                        <div class="layui-inline layui-show-xs-block x-right">
                            <a class="layui-btn layui-btn-normal" href="${pageContext.request.contextPath}/dorm/findAll?page=1&size=5"><i class="layui-icon">&#xe669;</i></a>
                        </div>
                    </form>
                </div>
                <xblock>
                    <a href="${pageContext.request.contextPath}/dorm/toAdd" class="layui-btn layui-btn-normal"><i class="layui-icon">&#xe654;</i>添加</a>
                    <a onclick="exportInfo(${sessionScope.adminInfo.power})" class="layui-btn layui-btn-warm" href="javascript:;"><i class="layui-icon">&#xe67c;</i>导出</a>
                    <span class="x-right" style="line-height:40px">共有数据：${pageInfo.total} 条</span>
                </xblock>
                <div class="layui-card-body">
                    <table class="layui-table layui-form" style="table-layout: fixed;width: 100%">
                        <thead>
                        <tr style="text-align: center">
                            <th style="text-align: center">ID</th>
                            <th style="text-align: center">宿舍号</th>
                            <th style="text-align: center">宿舍简介</th>
                            <th style="text-align: center">宿舍奖惩</th>
                            <th style="text-align: center">宿舍长</th>
                            <th style="text-align: center">育人导师</th>
                            <c:if test="${sessionScope.adminInfo.power > 2}">
                            <th style="text-align: center">操作</th>
                            </c:if>
                        </thead>
                        <tbody>
                        <%
                            int j = 1;
                        %>
                        <c:forEach items="${pageInfo.list}" var="dorm">
                        <tr id="light" style="text-align: center">
                            <td><%=j++%></td>
                            <td>${dorm.dorm_id}</td>
                            <td style="white-space: nowrap;text-overflow: ellipsis;overflow: hidden;">${dorm.dorm_intro}</td>
                            <td style="white-space: nowrap;text-overflow: ellipsis;overflow: hidden;">${dorm.dorm_rps}</td>
                            <td>${dorm.dorm_leader}</td>
                            <td>${dorm.teacher}</td>
                            <c:if test="${sessionScope.adminInfo.power > 2}">
                                <td class="td-manage">
                                    <a title="更新信息" href="${pageContext.request.contextPath}/dorm/toUpdate?id=${dorm.id}">
                                        <i class="layui-icon">&#xe642;</i>
                                    </a>
                                    <a title="查看详情" onclick="look(${dorm.id})" href="javascript:;">
                                        <i class="layui-icon">&#xe60a;</i>
                                    </a>
                                    <a title="进入宿舍" href="${pageContext.request.contextPath}/dorm/byDorm_leader?dorm_id=${dorm.dorm_id}">
                                        <i class="layui-icon">&#xe857;</i>
                                    </a>
                                </td>
                            </c:if>
                            </c:forEach>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="pull-left">
                    <div class="form-group form-inline">
                        共&nbsp;${pageInfo.pages}&nbsp;页&emsp;当前页：${pageInfo.pageNum}&nbsp;/&nbsp;${pageInfo.pages}&emsp; 每页
                        <select class="form-control" id="changePageSize" onchange="changePageSize()">
                            <option value="1">${pageInfo.size}</option>
                            <option value="5">5</option>
                            <option value="10">10</option>
                            <option value="15">15</option>
                            <option value="20">20</option>
                        </select> 条
                    </div>
                </div>
                <c:choose>
                    <c:when test="${pageInfo.pages < 5}">
                        <c:set var="begin" value="1">
                        </c:set>
                        <c:set var="end" value="${pageInfo.pages}">
                        </c:set>
                    </c:when>
                    <c:when test="${pageInfo.pageNum <= 3}">
                        <c:set var="begin" value="1">
                        </c:set>
                        <c:set var="end" value="5">
                        </c:set>
                    </c:when>
                    <c:when test="${pageInfo.pageNum > 3 and pageInfo.pageNum <= pageInfo.pages-2}">
                        <c:set var="begin" value="${pageInfo.pageNum - 2}">
                        </c:set>
                        <c:set var="end" value="${pageInfo.pageNum + 2}">
                        </c:set>
                    </c:when>
                    <c:otherwise>
                        <c:set var="begin" value="${pageInfo.pages - 4}">
                        </c:set>
                        <c:set var="end" value="${pageInfo.pages}">
                        </c:set>
                    </c:otherwise>
                </c:choose>
                <div class="layui-card-body x-right" style="height: min-content">
                    <div class="page">
                        <div>
                            <a class="next" href="${pageContext.request.contextPath}/dorm/findAll?page=1&size=${pageInfo.pageSize}&keyword=${param.keyword}">首页</a>
                            <c:if test="${pageInfo.pageNum > 1}">
                                <a class="prev" href="${pageContext.request.contextPath}/dorm/findAll?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}&keyword=${param.keyword}">上一页</a>
                            </c:if>
                            <c:forEach var="i" begin="${begin}" end="${end}" step="1">
                                <c:if test="${pageInfo.pageNum == i}">
                                    <span class="current">${i}</span>
                                </c:if>
                                <c:if test="${pageInfo.pageNum != i}">
                                    <a class="num" href="${pageContext.request.contextPath}/dorm/findAll?page=${i}&size=${pageInfo.pageSize}&keyword=${param.keyword}">${i}</a>
                                </c:if>
                            </c:forEach>
                            <c:if test="${pageInfo.pageNum < pageInfo.pages}">
                                <a class="next" href="${pageContext.request.contextPath}/dorm/findAll?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}&keyword=${param.keyword}">下一页</a>
                            </c:if>
                            <a class="next" href="${pageContext.request.contextPath}/dorm/findAll?page=${pageInfo.pages}&size=${pageInfo.pageSize}&keyword=${param.keyword}">尾页</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    //查看详情
    function look(id) {
        layer.open({
            type: 2,
            title:'宿舍详情',
            skin: 'layui-layer-rim', //加上边框
            area: ['800px', '430px'], //宽高
            content: '${pageContext.request.contextPath}/dorm/look?id='+id
        });
    }
    //导出Excel操作
    function exportInfo(power) {
        if (power < 3) {
            layer.msg('对不起，您没有权限导出宿舍信息');
            return false;
        }
        layer.confirm('确定导出所有宿舍数据吗？',function (index) {
            location.href="${pageContext.request.contextPath}/dorm/export";
            layer.close(index);
        });
    }
</script>
</body>
</html>
