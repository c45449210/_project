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

	<form id="form"
		action="<%=request.getContextPath()%>/MettingServlet?method=reserve"
		method="post" onSubmit="return checkForm()">
		
		<input type="hidden" name="bidString" value=${metting_desc.bid }>
		<input type="hidden" name="uidString" value=${session_user.uid }>
		
		<table width="100%" height="600" cellspacing="0">
			<tr>
				<td align="center" width="287" height="40"><font color="red">*&nbsp;</font>联系人</td>
				<td width="607"><input style=" width:200px;height:30px;"
					type="text" name="userNameString" id="reserve_username"
					onBlur="checkUserName()"><span class="default"
					style="color:red;" id="nameErr"><span>&nbsp;</span>
				</td>
			</tr>
			<tr>
				<td align="center"><font color="red">*&nbsp;</font>手机号码</td>
				<td><input style=" width:200px;height:30px;" type="text"
					name="userTeleString" id="reserve_tele" onBlur="checkUserPhone()">
					<span class="default" style="color:red;" id="phoneErr">&nbsp;</span>
				</td>
			</tr>
			<tr>
				<td align="center">活动需求</td>
				<td><input name="userNeedString" type="checkbox" value="场地">场地
					<input name="userNeedString" type="checkbox" value="住宿">住宿 <input
					name="userNeedString" type="checkbox" value="餐饮">餐饮</td>
			</tr>
			<tr>
				<td align="center"><font color="red">*&nbsp;</font>会议类型</td>
				<td><select name="userCategoryString">
						<option value="volvo">面试室</option>
						<option value="saab">董事会会议室</option>
						<option value="opel">企业培训室</option>
						<option value="audi">大型会议室</option>
				</select>
				</td>
			</tr>
			<tr>
				<td align="center">会议时长</td>
				<td><input style=" width:200px;height:30px;" type="text"
					name="mettingTimeString" id="reserve_time">
				</td>
			</tr>
			<tr>
				<td align="center">摆台形式</td>
				<td><input name="mettingRadioGroup1" type="radio" id="RadioGroup1_0"
					value="不限" checked="checked"> 不限 <input name="RadioGroup1"
					type="radio" id="RadioGroup1_1" value="剧场式"> 剧场式 <input
					name="RadioGroup1" type="radio" id="RadioGroup1_2" value="课桌式">
					课桌式 <br /> <input name="RadioGroup1" type="radio"
					id="RadioGroup1_3" value="U型式"> U型式 <input
					name="RadioGroup1" type="radio" id="RadioGroup1_4" value="宴会式">
					宴会式 <input name="RadioGroup1" type="radio" id="RadioGroup1_5"
					value="懂事会"> 董事会</td>
			</tr>
			<tr>
				<td align="center">会议设施</td>
				<td><input name="mettingReserveNeedThing" type="checkbox" value="场地">
					场地 <input name="reserve_need_thing" type="checkbox" value="投影仪">
					投影仪 <input name="reserve_need_thing" type="checkbox" value="幕布">
					幕布 <input name="reserve_need_thing" type="checkbox" value="音响">
					音响 <input name="reserve_need_thing" type="checkbox" value="纸笔">
					纸笔 <input name="reserve_need_thing" type="checkbox" value="LED">
					LED <input name="reserve_need_thing" type="checkbox" value="指引牌">指引牌<br>
					<input name="reserve_need_thing" type="checkbox" value="舞台">
					舞台 <input name="reserve_need_thing" type="checkbox" value="演讲台">
					演讲台 <input name="reserve_need_thing" type="checkbox" value="白板">
					白板 <input name="reserve_need_thing" type="checkbox" value="桌卡">
					桌卡 <input name="reserve_need_thing" type="checkbox" value="麦克风">
					麦克风</td>
			</tr>
			<tr>
				<td align="center">联系邮箱</td>
				<td><input style=" width:200px;height:30px;" type="text"
					name="orderEmailString" id="reserve_email">
				</td>
			</tr>
			<tr>
				<td align="center">活动日期</td>
				<td><input style=" width:200px;height:30px;" type="text"
					name="orderDateString" id="reserve_date">
				</td>
			</tr>
			<tr>
				<td align="center">活动人数</td>
				<td><input style=" width:200px;height:30px;" type="text"
					name="orderPeopleString" id="reserve_people">
				</td>
			</tr>
			<tr>
				<td align="center">公司名称</td>
				<td><input style=" width:200px;height:30px;" type="text"
					name="orderCompanynameString" id="reserve_companyname">
				</td>
			</tr>
			<tr>
				<td align="center">整体预算</td>
				<td><input style=" width:200px;height:30px;" type="text"
					name="orderMoneyString" id="reserve_money">
				</td>
			</tr>
			<tr>
				<td align="center">其他需求</td>
				<td><textarea name="orderElseString" id="reserve_else"
						style="resize:none; width: 500px;
height: 100px;" cols="15"
						rows=""></textarea>
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2"><input type="image" name="..."
					src="../images/yuding.gif" onClick="document.submit()">
				</td>
			</tr>
		</table>

	</form>
</body>
<script type="text/javascript"> 
 function checkForm(){ 
  var nametip = checkUserName(); 
  var phonetip = checkPhone(); 
  return nametip && passtip && conpasstip && phonetip; 
  } 
  //验证用户名   
  function checkUserName(){ 
  var username = document.getElementById('reserve_username'); 
  var errname = document.getElementById('nameErr'); 
  var pattern = /^\w{3,}$/;  //用户名格式正则表达式：用户名要至少三位 
  if(username.value.length == 0){ 
    errname.innerHTML="用户名不能为空"
    errname.className="error"
    return false; 
    } 
  if(!pattern.test(username.value)){ 
    errname.innerHTML="用户名不合规范"
    errname.className="error"
    return false; 
    } 
   else{ 
     errname.innerHTML=""
     errname.className="success"; 
     return true; 
     } 
  } 
   function checkPhone(){ 
  var userphone = document.getElementById('reserve_tele'); 
  var phonrErr = document.getElementById('phoneErr'); 
  var pattern = /^1[34578]\d{9}$/; //验证手机号正则表达式 
  if(!pattern.test(userphone.value)){ 
    phonrErr.innerHTML="手机号码不合规范"
    phonrErr.className="error"
    return false; 
    } 
   else{ 
     phonrErr.innerHTML="OK"
     phonrErr.className="success"; 
     return true; 
     } 
  } 
  
  </script>
</html>
