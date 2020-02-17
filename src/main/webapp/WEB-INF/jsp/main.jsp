<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020/2/10
  Time: 15:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!doctype html>
<html>
<head>
    <title>管理员端平台</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/theme2571.min.css"><%--灰色管理员主题 --%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.js"></script>
    <script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
    <script>
        // 是否开启刷新记忆tab功能
        // var is_remember = false;
    </script>
</head>
<body class="index">
<!-- 顶部开始 -->
<div class="container">
    <div class="logo">
        <a href="http://www.ppdxzz.cn">皮皮的小猪仔</a></div>
    <div class="left_open">
        <a><i title="展开左侧栏" class="iconfont">&#xe699;</i></a>
    </div>
    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;">我的消息</a>
            <dl class="layui-nav-child">
                <!-- 二级菜单 -->
                <dd>
                    <a onclick="xadmin.add_tab('消息','http://www.baidu.com')">消息</a>
                </dd>
                <dd>
                    <a href="${pageContext.request.contextPath}">XXX</a>
                </dd>
                <dd>
                    <a href="${pageContext.request.contextPath}">XXX</a>
                </dd>
            </dl>
        </li>
        <li class="layui-nav-item">
            <a href="javascript:;">${sessionScope.adminInfo.name}</a>
            <dl class="layui-nav-child">
                <!-- 二级菜单 -->
                <dd>
                    <a onclick="xadmin.add_tab('个人信息','http://www.baidu.com')">个人信息</a></dd>
                <dd>
                    <a href="${pageContext.request.contextPath}/loginOut">切换帐号</a></dd>
                <dd>
                    <a href="${pageContext.request.contextPath}/loginOut">退出</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item to-index">
            <a href="/">前台首页</a>
        </li>
    </ul>
</div>
<!-- 顶部结束 -->
<!-- 中部开始 -->
<!-- 左侧菜单开始 -->
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="学生管理">&#xe6b8;</i>
                    <cite>学生管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('学生信息','${pageContext.request.contextPath}/student/findAll?page=1&size=4')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>学生信息</cite></a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="管理员管理">&#xe726;</i>
                    <cite>管理员管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('管理员列表','${pageContext.request.contextPath}/findAllAdmin?page=1&size=4')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>管理员列表</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('角色管理','admin-role.html')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>角色管理</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('权限分类','admin-cate.html')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>权限分类</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('权限管理','admin-rule.html')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>权限管理</cite></a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="宿舍管理">&#xe6b4;</i>
                    <cite>宿舍管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('宿舍列表','error.html')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>宿舍列表</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('人员信息','error.html')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>人员信息</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('宿舍卫生','demo.html')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>宿舍卫生</cite></a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="访客管理">&#xe6f5;</i>
                    <cite>访客管理</cite>
                    <i class="iconfont nav_right">&#xe6f5;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('访客信息','unicode.html')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>访客信息</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.open('来访登记','unicode.html')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>来访登记</cite></a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="系统统计">&#xe6ce;</i>
                    <cite>系统统计</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('地图','echarts3.html')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>地图</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('饼图','echarts4.html')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>饼图</cite></a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</div>
<!-- <div class="x-slide_left"></div> -->
<!-- 左侧菜单结束 -->
<!-- 右侧主体开始 -->
<div class="page-content">
    <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
        <ul class="layui-tab-title">
            <li class="home">
                <i class="layui-icon">&#xe68e;</i>我的桌面
            </li>
        </ul>
        <div class="layui-tab-content"><%--中间的空白面板--%>
            <div class="layui-tab-item layui-show o_div" >
                <jsp:include page="welcome.jsp"></jsp:include>
            </div>
        </div>
        <div id="tab_show"></div>
    </div>
</div>
<div class="page-content-bg"></div>
<style id="theme_style"></style>
<!-- 右侧主体结束 -->
<!-- 中部结束 -->
<!-- 底部开始 -->
<!-- 底部结束 -->
</body>
</html>
