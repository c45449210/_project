<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>添加会议室</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
body {
	background: rgb(254, 238, 189);
}
</style>
</head>

<body>
	<h1>添加会议室</h1>
	<p style="font-weight: 900; color: red">${msg }</p>
	<form action="<c:url value='/admin/AdminMettingServlet'/>" method="post" >
		
		<input type="hidden" name="method" value="add"/>
		
		<table width="450" border="12" cellspacing="0" cellpadding="10">
			<tr>
				<td width="130">会议室名称：</td>
				<td width="252"><input type="text" name="bname"
					 />
				</td>
			</tr>
			<tr>
				<td>会议室图片：</td>
				<td><input style="width: 223px; height: 20px;" type="file" name="image" /></td>
			</tr>
			<br />
			<tr>
				<td>会议室单价：</td>
				<td><input type="text" name="price"  />
					元</td>
			</tr>
			<tr>
				<td>会议室拥有者：</td>
				<td><input type="text" name="author"  />
				</td>
			</tr>
			<tr>
				<td>会议室分类：</td>
				<td><select style="width: 150px; height: 20px;" name="cid">
						<c:forEach items="${categoryList }" var="c">
							<option value="${c.cid }"
								<c:if test="${c.cid eq metting.category.cid }">selected="selected"</c:if>>${c.cname
								}</option>
						</c:forEach>
				</select>
				</td>
			</tr>
			<td>会议室地址：</td>
			<td><input type="text" name="maddress"
				 />
			</td>
			</tr>
			<tr>
				<td>会议室简介</td>
				<td><input type="text" name="mtext"  />
				</td>
			</tr>
			<tr>
				<td>坐标</td>
				<td><input type="text" name="mlocal" />
				</td>
			</tr>
			<tr>
				<td>面积:</td>
				<td><input type="text" name="are" />
				</td>
			</tr>
			<tr>
				<td>层高:</td>
				<td><input type="text" name="height"  />
					米</td>
			</tr>
			<tr>
				<td>立柱:</td>
				<td><input type="text" name="lizhu" >
				</td>
			</tr>
			<tr>
				<td>楼层:</td>
				<td><input type="text" name="floor">
				</td>
			</tr>
			<tr>
				<td>容纳人数</td>
				<td><input type="text" name="people">
				</td>
			</tr>
			<tr>
				<td>剧场式:</td>
				<td><input type="text" name="juchangshi"
				>
				</td>
			</tr>
			<tr>
				<td>宴会式:</td>
				<td><input type="text" name="yanhuishi"
					 />
				</td>
			</tr>
			<tr>
				<td>课桌式：</td>
				<td><input type="text" name="kezhuoshi"
					 />
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="添加会议室" />
				</td>
			</tr>

			</form>
</body>
</html>
