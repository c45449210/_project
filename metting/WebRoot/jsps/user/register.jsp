<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>用户注册</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/jsps/css/register.css">
<body>

<div class="register-container">
	<h1>注册</h1>
	
	<div class="connect">
		<p>${register_msg}</p>
	</div> 
	
	<form action="<%=request.getContextPath()%>/UserServlet" method="post" id="registerForm">
		<input type="hidden" name="method" value="regist"/>
		<div>
			<input value="${register_form.username }" type="text" name="username" class="username" placeholder="您的用户名" autocomplete="off"/>
		</div>
		<div>
			<input type="password" name="password" class="password" name="username" placeholder="输入密码" oncontextmenu="return false" onpaste="return false" />
		</div>
		<div>
			<input value="${register_form.password }" type="password" name="confirm_password" class="confirm_password" placeholder="再次输入密码" oncontextmenu="return false" onpaste="return false" />
		</div>
		<%-- <div>
			<input value="${register_form.phone }" type="text" name="phone_number" class="phone_number" placeholder="输入手机号码" autocomplete="off" id="number"/>
		</div> --%>
		<div>
			<input value="${register_form.email }" type="email" name="email" class="email" placeholder="输入邮箱地址" oncontextmenu="return false" onpaste="return false" />
		</div>

		<button id="submit" type="submit">注 册</button>
	</form>
	<a href="login.jsp">
		<button type="button" class="register-tis">已经有账号？</button>
	</a>

</div>

</body>
<script src="<%=request.getContextPath()%>/jsps/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/jsps/js/common.js"></script>
<!--背景图片自动更换-->
<script src="<%=request.getContextPath()%>/jsps/js/supersized.3.2.7.min.js"></script>
<script src="<%=request.getContextPath()%>/jsps/js/supersized-init.js"></script>
<!--表单验证-->
<script src="<%=request.getContextPath()%>/jsps/js/jquery.validate.min.js?var1.14.0"></script>
</html>