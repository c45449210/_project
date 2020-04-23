<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>登陆</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/jsps/css/register.css">

<body>

<div class="login-container">
	<h1>用户登陆</h1>
	
	<div class="connect">
		<p>${login_msg}</p>
	</div>  
	
	<form action="<%=request.getContextPath()%>/UserServlet" method="post" id="loginForm">
		<input type="hidden" name="method" value="login"/>
		<div>
			<input type="text" name="username" class="username" placeholder="用户名" value="${login_form.username }" autocomplete="off"/>
		</div>
		<div>
			<input type="password" name="password" class="password" placeholder="密码" value="${login_form.password }" oncontextmenu="return false" onpaste="return false" />
		</div>
		<button id="submit" type="submit">登 陆</button>
	</form>

	<a href="register.jsp">
		<button type="button" class="register-tis">还没有账号？</button>
	</a>

</div>

<script src="<%=request.getContextPath()%>/jsps/js/jquery.min.js" ></script>
<script src="<%=request.getContextPath()%>/jsps/js/common.js"></script>
<!--背景图片自动更换-->
<script src="<%=request.getContextPath()%>/jsps/js/supersized.3.2.7.min.js"></script>
<script src="<%=request.getContextPath()%>/jsps/js/supersized-init.js"></script>
<!--表单验证-->
<script src="<%=request.getContextPath()%>/jsps/js/jquery.validate.min.js?var1.14.0"></script>

</body>
</html>