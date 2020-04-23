<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>${metting.bname}</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
   <link href="<%=request.getContextPath()%>/jsps/css/right_flow.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="<%=request.getContextPath()%>/jsps/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jsps/js/right_flow.js"></script>

	<style type="text/css">
		*{
			font-size:10pt;
		}
		body{
			text-align:center;
		}
		.table{
			width:1024px;
			height:1080px;
			border:1px solid gray;/*固定边框,1像素*/
		    border-collapse: collapse;/*单线的列表边框*/
		}
		.table td{
			border:1px solid gray;/*固定边框,1像素*/
		}
		iframe {
			width: 100%;
			height: 100%;
		}
	</style>
  </head>
  
  <body>
<table class="table" align="center">
	<tr style="background: #4682B4; height: 120px; ">
		<td colspan="2" align="center">
			<iframe frameborder="0" src="<%=request.getContextPath()%>/jsps/top.jsp" name="top"></iframe>
		</td>
	</tr>
	
    <tr style="background: white; height: 10px; ">
		<td colspan="2" align="center">
        <iframe frameborder="0"  scrolling = "no" src="<%=request.getContextPath()%>/jsps/menu.jsp" name = "menu" style="height: 74px;"></iframe>
		</td>
	</tr>

    <tr style=" height:204px; ">
		<td colspan="2" align="center">
        <iframe frameborder="0"  src="<%=request.getContextPath()%>/jsps/photo.jsp" name="photo" ></iframe>
		</td>
	</tr>

	<tr>
		<td style="height: 1500px;"  align="center" valign="top" colspan="2">
        <iframe frameborder="0"   src="<%=request.getContextPath()%>/jsps/metting/desc.jsp" name="desc_body" ></iframe>
			
		</td>
	</tr>
    <tr style="background: white; height: 50px; ">
		<td colspan="2" align="center">
		</td>
	</tr>
</table>
<!--右侧悬浮-->


<ul id="jump">
	<li style="display:none;"><a id="top" href="#top"></a></li>
	<li><a id="sina" href="#" ></a></li>
	<li>
		<a id="weixin" href="javascript:void(0)" onmouseover="showEWM()" onmouseout="hideEWM()">
			<div id="EWM"><img src="<%=request.getContextPath()%>/jsps/images/weixin_code.jpg" /></div>
		</a>
	</li>
	<li><a id="ceping" href="#" ></a></li>
	<li><a id="share" href="#" ></a></li>
	<li><a id="reply" href="#" ></a></li>
</ul>


  </body>
</html>
