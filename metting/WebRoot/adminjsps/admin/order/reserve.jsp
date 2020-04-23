<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>My JSP 'bookdesc.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

td {
	border-bottom: 1px solid;
	border-top: 1px solid;
	height: 40px;
	background: #F5FAFA;
	color: #797268;
}
</style>
<script type="text/javascript">
	function setMethod(method) {
		var ele = document.getElementById("method");
		ele.value = method;
	}
</script>
</head>

<body>
	<c:forEach items="${adminOrderList }" var="adminOrderList">
		<%-- <form id="form"
		action="<%=request.getContextPath()%>/MettingServlet?method=reserve"
		method="post" onSubmit="return checkForm()"> --%>
		<%-- 
		<input type="hidden" name="bidString" value=${orderList.bid }>
		<input type="hidden" name="uidString" value=${orderList.uid }>
		 --%>
		<table width="100%" height="600" cellspacing="0">
			<tr>
				<td align="center" width="287" height="40">联系人</td>
				<td width="607"  align="center">${adminOrderList.userNameString }</td>
			</tr>
			<tr>
				<td align="center">手机号码</td>

				<td align="center">${adminOrderList.userTeleString }</td>
			</tr>
			<tr>
				<td align="center">活动需求</td>
				<td></td>
			</tr>
			<tr>
				<td align="center"><font color="red">*&nbsp;</font>会议类型</td>
				<td align="center">
					<!-- <select name="userCategoryString">
						<option value="volvo">面试室</option>
						<option value="saab">董事会会议室</option>
						<option value="opel">企业培训室</option>
						<option value="audi">大型会议室</option>
				</select> --> 面试室</td>
			</tr>
			<tr>
				<td align="center">会议时长</td>
				<td align="center">${adminOrderList.mettingTimeString }</td>
			</tr>
			<tr>
				<td align="center">摆台形式</td>
				<td align="center">不限</td>
			</tr>
			<tr>
				<td align="center">会议设施</td>
				<td align="center">投影仪</td>
			</tr>
			<tr>
				<td align="center">联系邮箱</td>
				<td align="center">${adminOrderList.orderEmailString }</td>
			</tr>
			<tr>
				<td align="center">活动日期</td>
				<td align="center">${adminOrderList.orderDateString }</td>
			</tr>
			<tr>
				<td align="center">活动人数</td>
				<td align="center">${adminOrderList.orderPeopleString }</td>
			</tr>
			<tr>
				<td align="center">公司名称</td>
				<td align="center">${adminOrderList.orderCompanynameString }</td>
			</tr>
			<tr>
				<td align="center">整体预算</td>
				<td align="center">${adminOrderList.orderMoneyString }</td>
			</tr>
			<tr>
				<td align="center">其他需求</td>
				<td align="center"><${adminOrderList.orderElseString }</td>
			</tr>
			<!-- <tr>
				<td align="center" colspan="2"><input type="image" name="..."
					src="../images/yuding.gif" onClick="document.submit()">
				</td>
			</tr> -->
		</table>

		<!-- </form> -->
	</c:forEach>
</body>
<script type="text/javascript">
	function checkForm() {
		var nametip = checkUserName();
		var phonetip = checkPhone();
		return nametip && passtip && conpasstip && phonetip;
	}
	//验证用户名   
	function checkUserName() {
		var username = document.getElementById('reserve_username');
		var errname = document.getElementById('nameErr');
		var pattern = /^\w{3,}$/; //用户名格式正则表达式：用户名要至少三位 
		if (username.value.length == 0) {
			errname.innerHTML = "用户名不能为空"
			errname.className = "error"
			return false;
		}
		if (!pattern.test(username.value)) {
			errname.innerHTML = "用户名不合规范"
			errname.className = "error"
			return false;
		} else {
			errname.innerHTML = ""
			errname.className = "success";
			return true;
		}
	}
	function checkPhone() {
		var userphone = document.getElementById('reserve_tele');
		var phonrErr = document.getElementById('phoneErr');
		var pattern = /^1[34578]\d{9}$/; //验证手机号正则表达式 
		if (!pattern.test(userphone.value)) {
			phonrErr.innerHTML = "手机号码不合规范"
			phonrErr.className = "error"
			return false;
		} else {
			phonrErr.innerHTML = "OK"
			phonrErr.className = "success";
			return true;
		}
	}
</script>
</html>
