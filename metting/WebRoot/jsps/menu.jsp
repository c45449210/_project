<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>jQuery鼠标悬停下拉导航菜单 </title>

<link href="./css/menu.css" rel="stylesheet" type="text/css" />

<script  src="./js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script  src="./js/nav.js"  type="text/javascript"></script>

</head>
<body>

<div class="rz_bw_nav001_m">
	<div class="nav">
		<div class="nav_main">
			<ul id="nav_all">
				<li><a href="#">首页</a></li>
				<li><a href="#">关于我们</a>
					<ul style="display: none;">
						<li style="width: 8px;"></li>
						<li><a href="#">网站简介</a></li>
						<li><a href="#">网站文化</a></li>
					</ul>
				</li>
				<li><a href="#">快速寻找会议室</a>
					<ul style="display: none;">
						<li style="width: 28px;"></li>
						<li><a href="#">面试室</a></li>
						<li><a href="#">董事会会议室</a></li>
						<li><a href="#">企业培训室</a></li>
						<li><a href="#">大型会议室</a></li>
					</ul>
				</li>
				<li><a href="#">
					<div style="_margin-top: 12px;"></div>通过地图查找</a>
				</li>
				<li><a href="#">新闻资讯</a>
					<ul style="display: none;">
						<li style="width: 340px;"></li>
						<li><a href="#">公司动态</a></li>
						<li><a href="#">行业新闻</a></li>
					</ul>
				</li>
				<li><a href="#">信息收集</a>
					<ul style="display: none;">
						<li style="width: 398px;"></li>
						<li><a href="#">设计欣赏</a></li>
						<li><a href="#">资源共享</a></li>
					</ul>
				</li>            
			</ul>
			<div class="rz_bw_server_tel">服务热线：138-0000-0000</div>
		</div>
	</div>
</div>
</div>
</body>
</html>

