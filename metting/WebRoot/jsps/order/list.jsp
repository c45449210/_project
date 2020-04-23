<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>订单列表</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script language="javaScript">
	function prom() {
		var score = prompt("请输入您评分1~5", "");//将输入的内容赋给变量 name ，

		if (score)//如果返回的有内容
		{

			document.getElementById("scoreString").value = score;
		}

	}
</script>




<style type="text/css">
* {
	font-size: 11pt;
}

div {
	border: solid 2px gray;
	width: 75px;
	height: 75px;
	text-align: center;
}

li {
	margin: 10px;
}

td {
	align: center;
	padding: 5px;
}

#buy {
	background: url(<                             c :                             url
		value =    
		               
		        '/images/all.png'/ >         
		) no-repeat;
	display: inline-block;
	background-position: 0 -902px;
	margin-left: 30px;
	height: 36px;
	width: 146px;
}

#buy:HOVER {
	background: url(<                             c :                             url
		value =    
		               
		        '/images/all.png'/ >         
		) no-repeat;
	display: inline-block;
	background-position: 0 -938px;
	margin-left: 30px;
	height: 36px;
	width: 146px;
}
</style>
</head>

<body>
	<h3 align="center">我的订单</h3>

	<table align="center" border="1" cellspacing="0">
		<tr>
			<td>订单编号</td>
			<td>预订日期</td>
			<td>整体预算</td>
			<td>评价</td>
		</tr>
		<c:forEach items="${orderList }" var="order">
			<tr bgcolor="" bordercolor="gray">

				<td>${order.oidString }</td>

				<td><c:choose>
						<c:when
							test="${order.orderDateString eq '' or order.orderDateString eq 'null'  }">
						未填写详细日期
						</c:when>
						<c:when test="${order.orderDateString!=null  }">
						 ${order.orderDateString }
						</c:when>
					</c:choose></td>

				<td>${order.orderMoneyString } <c:choose>
						<c:when
							test="${order.orderMoneyString eq '' or order.orderMoneyString eq 'null'  }">
						未填写详细预算
						</c:when>
						<c:when test="${order.orderMoneyString!=null  }">
						 ${order.orderMoneyString }
						</c:when>
					</c:choose></td>



				<td><c:choose>
						<c:when
							test="${order.scoreString eq '' or order.scoreString==null   }">

							<form id="submitScore" method="post"
								action=<c:url value='/OrderServlet?method=submitScore'/>>
								<input type="hidden" id="scoreString" name="scoreString"/>
								 <input type="hidden"
									name="oidString" value=${order.oidString } />
								<button type="submit" onclick="prom()">提交</button>
							</form>

							<!-- <a
								 href="<c:url value='/OrderServlet?method=load&oid=${order.oidString }'/>">去评分</a>-->
						</c:when>
						<c:when test="${order.scoreString !=null }">${order.scoreString }</c:when>
					</c:choose>
				</td>
			</tr>
			<%--   <c:forEach items="${order.orderItemList }" var="orderItem">
	<tr bordercolor="gray" align="center">
		<td width="15%">
			<div><img src="<c:url value='/${orderItem.metting.image }'/>" height="75"/></div>
		</td>
		<td>书名：${orderItem.metting.bname }</td>
		<td>单价：${orderItem.metting.price }元</td>
		<td>作者：${orderItem.metting.author }</td>
		<td>数量：${orderItem.count }</td>
		<td>小计：${orderItem.subtotal }元</td>
	</tr>
  </c:forEach> --%>
		</c:forEach>

	</table>
</body>
</html>
