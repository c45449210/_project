<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
	<title>滑动选项卡</title>

	<style type="text/css">
*{ margin:0; padding:0;}
body{ background:#eee; text-shadow:0px 1px 0px rgba(255,255,255,0.60); color:#333;}
a{color:#fff; text-decoration:none;}

/*  导航部分 */
#mynav{ width:100%; height:40px; background:#2093e0; border-bottom:1px solid #fff; position:relative; z-index:99; color:#fff; line-height:40px;}
#mynav ul{width:1000px; padding:0; margin:0 auto; list-style-type:none;}
#mynav ul li{ float:left; margin：0px 5px; border-right:1px solid #fff;}
#mynav ul li a{ display:block; padding:0px 20px; height:40px; line-height:40px; color:#fff; text-shadow:0px -1px 0px rgba(30,30,30,0.60);}

.swiper-slide {
  height: 500px;
  width: 100%;
  background: none;
  color: #000;
}

.content-slide {
  padding: 20px;
  height: auto;
}

.content-slide p {
  text-indent: 2em;
  line-height: 1.9;
}

* {
  margin: 0;
  padding: 0;
}

<!--图片显示-->
.box {
  width: 800px;
  height: 260px;
  position: relative;
  margin: 10px;
}

.big {
   width: 400px;
  height: 400px;
  position: absolute;
  top: 100px;
  left: 420px;
  border: 1px solid #ccc;
  overflow: hidden;
  display: none;
  z-index:10;
}
.box span{
	position: absolute;
	left: 423px;
  top:150px
  border:1px solid red;
	top: 182px;
	width: 378px;
	height: 201px;
	z-index: -10;
}
.box iframe{
	position: absolute;
	left: 20px;
	top: 459px;
	height: 395px;
	width: 774px;
  }
.mask {
  width: 175px;
  height: 175px;
  background: rgba(255, 255, 0, 0.4);
  position: absolute;
  top: 0;
  left: 0;
  cursor: move;
  display: none;
}

.small {
  position: relative;
}

.box img {
  vertical-align: top;
}
.box a{
		position: absolute;
	left: 473px;
	top: 349px;
	z-index: 5;
}

#bigBox img {
  position: absolute;
}

<!--表格-->
#infotable {
  width: 700px;
  padding: 0;
  margin: 0;
}

caption {
  padding: 0 0 5px 0;
  width: 700px;
  font: italic 11px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
  text-align: right;
}

th {
  font: bold 11px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
  color: #4f6b72;
  border-bottom: 1px solid #C1DAD7;
  border-top: 1px solid #C1DAD7;
  letter-spacing: 2px;
  text-transform: uppercase;
  text-align: left;
  padding: 6px 6px 6px 12px;
  background: #CAE8EA url(images/bg_header.jpg) no-repeat;
}

th.nobg {
  border-top: 0;
  border-left: 0;
  background: none;
}

td {
  border-right: 1px solid #C1DAD7;
  border-bottom: 1px solid #C1DAD7;
  background: #fff;
  font-size: 11px;
  padding: 6px 6px 6px 12px;
  color: #4f6b72;
}

td.alt {
  background: #F5FAFA;
  color: #797268;
}

th.spec {
  border-left: 1px solid #C1DAD7;
  border-top: 0;
  background: #fff url(images/bullet1.gif) no-repeat;
  font: bold 10px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
}

th.specalt {
  border-left: 1px solid #C1DAD7;
  border-top: 0;
  background: #f5fafa url(images/bullet2.gif) no-repeat;
  font: bold 10px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
  color: #797268;
}
<!--论坛 -->
   .forum{
    width: 1000px;
    height: 180px;
    border-top:1px black solid;
    border-bottom:1px black solid;
    margin-bottom:10px;
  }
  .forum_img{
    float: left;
    width: 12%;
    height: 180px;
    border-right:1px black solid;
    border-top:1px black solid;
    border-bottom:1px black solid;
    background:#DEF5F5;
    
  }
  .forum_img img{
  left: 6px;
  top: 29px;
  width: 103px;
  height: 104px;
  padding: 2px;
  }
  .forum_text{
  float: left;
  width:87%;
  height: 180px;
  border-top:1px black solid;
    border-bottom:1px black solid;
  }
  .forum_text p{
  text-indent:50px; 
  }
    
</style>

	<link rel="stylesheet" href="../css/desc_menu.css">
</head>
<body>
<div id="mynav">
	<ul>
		<li><a href="#mao1">会议室详情</a></li>
		<li><a href="#mao2">用户评价</a></li>
	</ul> 
</div>

<p><a name="mao1"> </a></p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<div class="content-slide">
          <!-- 详细信息 -->
					<h2 style="margin-left:50px;">${metting_desc.bname }</h2>
					<div class="box" id="box" style="margin-left:50px;margin-top:20px;">
						<div id="smallBox" class="small" style="height:250px;width:400px;">
							<img src="<c:url value='/${metting_desc.image }'/>" style="height:250px;width:350px;"/>
							<div id="mask" class="mask"></div>
						</div>
						 <iframe width="450" height="250" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://api.map.baidu.com/mapCard/finish.html?location=江西省|南昌市|东湖区|${metting_desc.maddress }&information=${metting_desc.bname }||||&point=[${metting_desc.mlocal }]&width=770&height=330&basicInformation=false&route=false&searchBox=false&zoom=12"></iframe>
						<div id="bigBox" class="big">
							<img src="<c:url value='/${metting_desc.image }'/>" id="bigImg"
								width="700" />
						</div>
						<span>${metting_desc.mtext }</span>
						<a href="../user/reserve.jsp">  
      					<img src="../images/yuding.gif" height="48"> </a> 
					</div>
					<div  style="height:500px">
  </div>
  <table id="infotable" cellspacing="0" >
            <caption>
            </caption>
            <tr>
              <th colspan="4" scope="col" class="nobg">会议室设施</th>
            </tr>
            <tr >
              <th width="217" height="35"   class="specalt" scope="row">面积: ${metting_desc.are }㎡</th>
              <td width="217" class="alt">层高: ${metting_desc.height }m</td>
              <td width="217" class="alt">立柱: ${metting_desc.lizhu }个</td>
              <td width="202" class="alt">楼层: ${metting_desc.floor }F</td>
            </tr>
                       <tr >
              <th scope="row" height="35" class="specalt"><span class="specalt">容纳人数 ${metting_desc.people }人</span></th>
              <td class="alt">剧场式: ${metting_desc.juchangshi }人</td>
              <td class="alt">宴会式: ${metting_desc.yanhuishi }人</td>
              <td class="alt">课桌式：${metting_desc.kezhuoshi }人</td>
              </tr>
          </table>
          <p>&nbsp;</p>
          <!-- <li>价格：${metting.price }元</li> -->

</div>
       
<p><a name="mao2"> </a>        
</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
<div class="content-slide">
  <h2 style="margin-left:10px;">用户评价</h2>
  <p style="margin-left:50px;">&nbsp;</p>
  <div class = "forum" style="
    margin-bottom: 20px;
">
    <div class = "forum_img" >
    <span>张三</span>
    <img style="margin-left:10px;height: 100px;width:100px;"src="../images/touxiang.jpg"   />
     </div>
  
    <div class = "forum_text" >
    <p>会议室干净，亲眼见各种替换，卫生过硬。虽然窗外是高架，双层玻璃下无任何影响。就是房间小了些。</p>
    </div>
    
    <div style="clear:both"></div>
</div>




</div>

	<script type="text/javascript" src="../js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="../js/desc_menu.js"></script>
	<script type="text/javascript" src="../js/js/navfix.js"></script>
	<!-- 显示图片的js -->
	<script type="text/javascript">
		var box = document.getElementById("box");
		var smallBox = document.getElementById("smallBox");
		var bigBox = document.getElementById("bigBox");
		var bigImg = document.getElementById("bigImg");
		var mask = document.getElementById("mask");//1.鼠标经过小盒子 显示遮罩和大盒子 鼠标离开后隐藏
		smallBox.onmouseover = function() {
			mask.style.display = "block";
			bigBox.style.display = "block";
		};
		smallBox.onmouseout = function() {
			mask.style.display = "none";
			bigBox.style.display = "none";
		};
		smallBox.onmousemove = function(event) {
			var event = event || window.event;
			var pageX = event.pageX || event.clientX
					+ document.documentElement.scrollLeft;
			var pageY = event.pageY || event.clientY
					+ document.documentElement.scrollTop;
			var targetX = pageX - box.offsetLeft;
			var targetY = pageY - box.offsetTop;
			var maskX = targetX - mask.offsetWidth / 2;
			var maskY = targetY - mask.offsetHeight / 2;
			if (maskX < 0) {
				maskX = 0;
			}
			if (maskX > smallBox.offsetWidth - mask.offsetWidth) {
				maskX = smallBox.offsetWidth - mask.offsetWidth;
			}
			if (maskY < 0) {
				maskY = 0;
			}
			if (maskY > smallBox.offsetHeight - mask.offsetHeight) {
				maskY = smallBox.offsetHeight - mask.offsetHeight;
			}
			mask.style.left = maskX + "px";
			mask.style.top = maskY + "px";
			var bigToMove = bigImg.offsetWidth - bigBox.offsetWidth;
			var maskToMove = smallBox.offsetWidth - mask.offsetWidth;
			var rate = bigToMove / maskToMove;
			bigImg.style.left = -rate * maskX + "px";
			bigImg.style.top = -rate * maskY + "px";
		};
	</script>
</body>
</html>