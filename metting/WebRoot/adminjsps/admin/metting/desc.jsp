<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP starting page</title>
    
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
	body {
		font-size: 10pt;
		background: rgb(254,238,189);
	}
	
	li {
		margin: 10px;
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
  <div style="margin-left:350px; width:420px;"><img  style="width:400px; height:250px;"src="<c:url value='/${metting.image }'/>" border="0"/></div>
 
  <form style="margin-left:330px;" id="form" action="<c:url value='/admin/AdminMettingServlet'/>" method="post">
  	<input type="hidden" name="method" value="" id="method"/>
  	<input type="hidden" name="bid" value="${metting.bid }"/>
  	<input type="hidden" name="image" value="${metting.image }"/>
    
    <table width="450" border="12" cellspacing="0" cellpadding="10">
  <tr>
    <td width="130">会议室名称：</td>
    <td width="252"><input type="text" name="bname" value="${metting.bname }"/></td>
  </tr>
  <tr>
    <td>会议室单价：</td>
    <td><input type="text" name="price" value="${metting.price }"/>
      元</td>
  </tr>
  <tr>
    <td>会议室拥有者：</td>
    <td><input type="text" name="author" value="${metting.author }"/></td>
  </tr>
  <tr>
    <td>会议室分类：</td>
    <td><select style="width: 150px; height: 20px;" name="cid">
      <c:forEach items="${categoryList }" var="c">
        <option value="${c.cid }" <c:if test="${c.cid eq metting.category.cid }">selected="selected"</c:if>  >${c.cname }</option>
      </c:forEach>
    </select></td>
  </tr>
   <td>会议室地址：</td>
    <td><input type="text" name="maddress" value="${metting.maddress }"/></td>
  </tr>
  <tr>
    <td>会议室简介</td>
    <td><input type="text" name="mtext" value="${metting.mtext }"/></td>
  </tr>
  <tr>
    <td>坐标</td>
    <td><input type="text" name="mlocal" value="${metting.mlocal }"/></td>
  </tr>
  <tr>
    <td>面积:</td>
    <td><input type="text" name="are" value="${metting.are }"/></td>
  </tr>
  <tr>
    <td>层高:</td>
    <td><input type="text" name="height" value="${metting.height }"/>
      米</td>
  </tr>
  <tr>
    <td>立柱:</td>
    <td><input type="text" name="lizhu" value="${metting.lizhu }"/></td>
  </tr>
  <tr>
    <td>楼层:</td>
    <td><input type="text" name="floor" value="${metting.floor }"/></td>
  </tr>
  <tr>
    <td>容纳人数</td>
    <td><input type="text" name="people" value="${metting.people }"/></td>
  </tr>
  <tr>
    <td>剧场式:</td>
    <td><input type="text" name="juchangshi" value="${metting.juchangshi }"/></td>
  </tr>
  <tr>
    <td>宴会式:</td>
    <td><input type="text" name="yanhuishi" value="${metting.yanhuishi }"/></td>
  </tr>
  <tr>
    <td>课桌式：</td>
    <td><input type="text" name="kezhuoshi" value="${metting.kezhuoshi }"/></td>
  </tr>
  <tr>
    <td style="text-align:center;vertical-align:middle;"><input type="submit" value="删除" onclick="setMethod('delete')"/></td>
    <td style="text-align:center;vertical-align:middle;"><input type="submit" value="确认" onClick="setMethod('edit')"/></td>
  </tr>
</table>
<br/>
  	<br/>
  	
    
  </form>
  </body>
</html>