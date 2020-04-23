<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>jquery全屏banner自动轮</title>
<script type="text/javascript" src="./js/jquery.js"/></script>
<script type="text/javascript">
function banner(){	
	var bn_id = 0;
	var bn_id2= 1;
	var speed33=3000;
	var qhjg = 1;
    var MyMar33;
	$("#banner .d1").hide();
	$("#banner .d1").eq(0).fadeIn("slow");
	if($("#banner .d1").length>1)
	{
		$("#banner_id li").eq(0).addClass("nuw");
		function Marquee33(){
			bn_id2 = bn_id+1;
			if(bn_id2>$("#banner .d1").length-1)
			{
				bn_id2 = 0;
			}
			$("#banner .d1").eq(bn_id).css("z-index","2");
			$("#banner .d1").eq(bn_id2).css("z-index","1");
			$("#banner .d1").eq(bn_id2).show();
			$("#banner .d1").eq(bn_id).fadeOut("slow");
			$("#banner_id li").removeClass("nuw");
			$("#banner_id li").eq(bn_id2).addClass("nuw");
			bn_id=bn_id2;
		};
	
		MyMar33=setInterval(Marquee33,speed33);
		
		$("#banner_id li").click(function(){
			var bn_id3 = $("#banner_id li").index(this);
			if(bn_id3!=bn_id&&qhjg==1)
			{
				qhjg = 0;
				$("#banner .d1").eq(bn_id).css("z-index","2");
				$("#banner .d1").eq(bn_id3).css("z-index","1");
				$("#banner .d1").eq(bn_id3).show();
				$("#banner .d1").eq(bn_id).fadeOut("slow",function(){qhjg = 1;});
				$("#banner_id li").removeClass("nuw");
				$("#banner_id li").eq(bn_id3).addClass("nuw");
				bn_id=bn_id3;
			}
		})
		$("#banner_id").hover(
			function(){
				clearInterval(MyMar33);
			}
			,
			function(){
				MyMar33=setInterval(Marquee33,speed33);
			}
		)	
	}
	else
	{
		$("#banner_id").hide();
	}
}
</script>

</head>

<body>

<style type="text/css">

* {
    list-style-type: none;
    margin: 0;
    padding: 0;
}
a, img {
    border: 0 none;
}
body {
    font: 12px/180% Arial,Helvetica,sans-serif,"新宋体";
}
.banner {
    height: 200px;
    overflow: hidden;
}
.banner .d1 {
    display: block;
    height: 200px	;
    left: 0;
    position: absolute;
    top: 0;
    width: 100%;
}
.banner .d2 {
    clear: both;
    height: 15px;
    left: 0;
    position: absolute;
    top: 180px;
    width: 100%;
    z-index: 100;
}
.banner .d2 ul {
    display: inline;
    float: left;
    left: 50%;
    margin: 0 0 0 -96px;
    position: absolute;
    top: 0;
}
.banner .d2 li {
    background: rgba(0, 0, 0, 0) url("images/img1.png") no-repeat scroll center center;
    cursor: pointer;
    display: inline;
    float: left;
    height: 15px;
    margin: 0 3px;
    overflow: hidden;
    width: 17px;
}
.banner .d2 li.nuw {
    background: rgba(0, 0, 0, 0) url("images/img1_1.png") no-repeat scroll center center;
}

</style>

<div class="banner" id="banner" >
	<a href="#" class="d1" style="background:url(images/banner1.jpg) center no-repeat;"></a>
	<a href="#" class="d1" style="background:url(images/banner2.jpg) center no-repeat;"></a>
	<a href="#" class="d1" style="background:url(images/banner3.jpg) center no-repeat;"></a>
	<a href="#" class="d1" style="background:url(images/banner4.jpg) center no-repeat;"></a>
	<a href="#" class="d1" style="background:url(images/banner5.jpg) center no-repeat;"></a>
	<div class="d2" id="banner_id">
		<ul>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
	</div>
</div>

<script type="text/javascript">banner()</script>

</body>
</html>