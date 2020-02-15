<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020/2/10
  Time: 21:45
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
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script>
        function changePageSize() {
            //获取下拉框的值
            var pageSize = $("#changePageSize").val();
            //向服务器发送请求，改变每页显示条数
            location.href = "${pageContext.request.contextPath}/findAllAdmin?page=1&size="+ pageSize;
        }
        $("#serarch_btn").click(function () {
            var username = $("#username").val();
            var password = $("#password").val();
            location.href="${pageContext.request.contextPath}/findAllAdmin?page=1&size=4&username="+username;
        });
    </script>
</head>
<body>
<%--<div class="x-nav">
          &lt;%&ndash;<span class="layui-breadcrumb">
            <a href="">首页</a>
            <a href="">演示</a>
            <a>
              <cite>导航元素</cite></a>
          </span>&ndash;%&gt;
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>--%>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">
                    <form class="layui-form layui-col-space5">
                        <div class="layui-inline layui-show-xs-block">
                            <input class="layui-input" type="text" autocomplete="on" placeholder="用户名" name="username" id="username" value="${param.username}">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <input class="layui-input" type="text" autocomplete="off" placeholder="姓名" name="name" id="name">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <input type="text" name="description" id="description" placeholder="描述" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <button class="layui-btn"  id="serarch_btn" lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
                        </div>
                    </form>
                </div>
                <xblock>
                    <a href="${pageContext.request.contextPath}/adminAdd" class="layui-btn layui-btn-normal"><i class="layui-icon">&#xe654;</i>添加</a>
                    <button id="fileDownLoad" class="layui-btn layui-btn-warm" lay-filter="toolbarDemo" lay-submit=""><i class="layui-icon">&#xe67c;</i>导出</button>
                    <span class="x-right" style="line-height:40px">共有数据：${pageInfo.total} 条</span>
                </xblock>
                <div class="layui-card-body">
                    <table class="layui-table layui-form">
                        <thead>
                        <tr style="text-align: center">
                            <th style="text-align: center">用户名</th>
                            <th style="text-align: center">姓名</th>
                            <th style="text-align: center">联系方式</th>
                            <th style="text-align: center">权限</th>
                            <th style="text-align: center">描述</th>
                            <th style="text-align: center">操作</th>
                        </thead>
                        <tbody>
                        <c:forEach items="${pageInfo.list}" var="admin">
                        <tr style="text-align: center">
                            <td>${admin.username}</td>
                            <td>${admin.name}</td>
                            <td>${admin.phone}</td>
                            <td>${admin.power}</td>
                            <td>${admin.description}</td>
                            <td class="td-manage">
                                <a title="编辑" href="${pageContext.request.contextPath}/adminEdit?id=${admin.id}">
                                    <i class="layui-icon">&#xe642;</i>
                                </a>
                                <a onclick="member_stop(this,'10001')" href="javascript:;"  title="授权">
                                    <i class="layui-icon">&#xe672;</i>
                                </a>
                                <a title="删除" onclick="member_del(this,${admin.id},${sessionScope.adminInfo.power})" href="javascript:;">
                                    <i class="layui-icon">&#xe640;</i>
                                </a>
                            </td>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="pull-left">
                    <div class="form-group form-inline">
                        当前页：${pageInfo.pageNum}&nbsp;/&nbsp;${pageInfo.pages}&emsp; 每页
                        <select class="form-control" id="changePageSize" onchange="changePageSize()">
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="10">10</option>
                            <option value="15">15</option>
                            <option value="20">20</option>
                        </select> 条
                    </div>
                </div>
                <div class="box-tools pull-right">
                    <ul class="pagination">
                        <li>
                            <a href="${pageContext.request.contextPath}/findAllAdmin?page=1&size=${pageInfo.pageSize}&username=${param.username}" aria-label="Previous">首页</a>
                        </li>
                        <c:if test="${pageInfo.pageNum > 1}">
                        <li><a href="${pageContext.request.contextPath}/findAllAdmin?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}&username=${param.username}">上一页</a></li>
                        </c:if>
                        <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                            <li><a href="${pageContext.request.contextPath}/findAllAdmin?page=${pageNum}&size=${pageInfo.pageSize}&username=${param.username}">${pageNum}</a></li>
                        </c:forEach>
                        <c:if test="${pageInfo.pageNum < pageInfo.pages}">
                        <li><a href="${pageContext.request.contextPath}/findAllAdmin?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}&username=${param.username}">下一页</a></li>
                        </c:if>
                        <li>
                            <a href="${pageContext.request.contextPath}/findAllAdmin?page=${pageInfo.pages}&size=${pageInfo.pageSize}&username=${param.username}"  aria-label="Next">尾页</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    /*function edit_admin(obj,id) {
        //layer.msg('编辑'+id);
        var index = layer.open({
            type: 2 //Page层类型
            ,area: ['900px', '480px']
            ,title: '修改信息'
            ,shade: 0.6 //遮罩透明度
            ,maxmin: true //允许全屏最小化
            ,anim: 2 //0-6的动画形式，-1不开启
            ,content: 'http://localhost:8080/hellossm/adminEdit?id='+id
        });
        layer.full(index);
    }*/
    /*用户-删除*/
    function member_del(obj,id,power){
        layer.confirm('确认要删除吗？',function(index){
            if (power == 0){
                layer.msg('对不起，您没有权限！');
                return false;
            }
            //发异步删除数据
            $.get("${pageContext.request.contextPath}/deleteAdmin",{"id":id},function (data) {
                if(data = true){
                    layer.msg('删除成功!',{icon:1,time:2000});
                    setTimeout(function () {window.location.href='${pageContext.request.contextPath}/findAllAdmin';},2000);

                }else {
                    layer.msg('删除失败!',{icon:1,time:2000});
                    setTimeout(function () {window.location.href='${pageContext.request.contextPath}/findAllAdmin';},2000);
                }
            });
        });
    }
</script>
</body>
</html>
