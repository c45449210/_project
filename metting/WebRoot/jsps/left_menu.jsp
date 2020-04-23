<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<title>jQuery实现左侧导航</title>
<link href="css/left_menu.css" rel="stylesheet" type="text/css">
<script src="js/jquery.js"></script>
<script src="js/left_menu.js"></script>
</head>
	<body style="width: 170px;">
		<ul>
			<li><a class="hover" href="<%=request.getContextPath()%>/MettingServlet?method=getRecommend&uid=${session_user.uid }" target="_blank">为您推荐</a></li>
			<li><a href="<%=request.getContextPath()%>/jsps/map/map.jsp" target="index_main_body">寻找最近的会议室</a></li>
			<li><a href="<%=request.getContextPath()%>/MettingServlet?method=findByCategory&cid=<%=1 %>" target="index_main_body">面试室</a></li>
			<li><a href="<%=request.getContextPath()%>/MettingServlet?method=findByCategory&cid=<%=2 %>" target="index_main_body">董事会会议室</a></li>
			<li><a href="<%=request.getContextPath()%>/MettingServlet?method=findByCategory&cid=<%=3 %>" target="index_main_body">企业培训室</a></li>
			<li><a href="<%=request.getContextPath()%>/MettingServlet?method=findByCategory&cid=<%=4 %>" target="index_main_body">大型会议室</a></li>
			<div id="lanPos"></div>
		</ul>
</body>
</html>
