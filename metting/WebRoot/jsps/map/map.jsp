<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
  <style type="text/css">
    body, html{
      width: 100%;
      height: 100%;
      margin:0;
      font-family:"微软雅黑";
      font-size:14px;
    }
    #l-map {
      width:100%; 
      height:100%;
      overflow: hidden;
    }
    .map_popup button {
      background: url("http://map.baidu.com/img/popup_close.gif") no-repeat scroll 0 0 transparent;
      cursor: pointer;
      height: 12px;
      position: absolute;
      right: 4px;
      top: 6px;
      width: 12px;
    } 
  </style>
  <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=pLn6TnDU2itSq4hWpMIRkCcID8KUHn5r"></script>
  <!-- 加载百度地图样式信息窗口 -->
  <script type="text/javascript" src="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.js"></script>
  <link rel="stylesheet" href="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.css" />
  <!-- 加载城市列表 -->
  <script type="text/javascript" src="http://api.map.baidu.com/library/CityList/1.2/src/CityList_min.js"></script>

  <title>叠加麻点图层</title>
</head>
<body>
  <div id="l-map"></div>
  <div id="result">
    <button id="open">打开</button><button id="close">关闭</button>
  </div>
</body>
</html>
<script type="text/javascript">
  // 百度地图API功能
  var map = new BMap.Map("l-map");          // 创建地图实例
  var point = new BMap.Point(115.839691,28.767964); // 创建点坐标
  map.centerAndZoom(point, 15);                 // 初始化地图，设置中心点坐标和地图级别
  map.enableScrollWheelZoom();
  map.addControl(new BMap.NavigationControl());  //添加默认缩放平移控件

  
  
  //获取位置
  var geolocation = new BMap.Geolocation();
    geolocation.getCurrentPosition(function(r){
        if(this.getStatus() == BMAP_STATUS_SUCCESS){
            var mk = new BMap.Marker(r.point);
            map.addOverlay(mk);
            map.panTo(r.point);
          }
        else {
            alert('failed'+this.getStatus());
        }        
    },{enableHighAccuracy: true})


  var customLayer;
  function addCustomLayer(keyword) {
    if (customLayer) {
      map.removeTileLayer(customLayer);
    }
    customLayer=new BMap.CustomLayer({
      geotableId: 189234,
      q: '', //检索关键字
      tags: '', //空格分隔的多字符串
      filter: '' //过滤条件,参考http://lbsyun.baidu.com/lbs-geosearch.htm#.search.nearby
    });
    map.addTileLayer(customLayer);
    customLayer.addEventListener('hotspotclick',callback);
  }
  function callback(e)//单击热点图层
  {
      var customPoi = e.customPoi;//poi的默认字段
      var contentPoi=e.content;//poi的自定义字段
      var local ="<%=request.getContextPath()%>/MettingServlet?method=load&bid="+contentPoi.bid;
      var content = '<p style="width:280px;margin:0;line-height:20px;">地址：' + customPoi.address + '<br/>标签:'+contentPoi.tags+'<span>   </span><a  target="_blank" href="'+local+'">查看详情</a>'+'</p>';
      var searchInfoWindow = new BMapLib.SearchInfoWindow(map, content, {
        title: customPoi.title, //标题
        width: 290, //宽度
        height: 40, //高度
        panel : "panel", //检索结果面板
        enableAutoPan : true, //自动平移
        enableSendToPhone: true, //是否显示发送到手机按钮
        searchTypes :[
          BMAPLIB_TAB_SEARCH,   //周边检索
          BMAPLIB_TAB_TO_HERE,  //到这里去
          BMAPLIB_TAB_FROM_HERE //从这里出发
        ]
      });
      var point = new BMap.Point(customPoi.point.lng, customPoi.point.lat);
      searchInfoWindow.open(point);
  }
  document.getElementById("open").onclick = function(){
    addCustomLayer();
  };
  document.getElementById("open").click();
  document.getElementById("close").onclick = function(){
    if (customLayer) {
      map.removeTileLayer(customLayer);
    }
  };
  // 创建CityList对象，并放在citylist_container节点内
  var myCl = new BMapLib.CityList({container : "citylist_container", map : map});

  // 给城市点击时，添加相关操作
  myCl.addEventListener("cityclick", function(e) {
    // 修改当前城市显示
    document.getElementById("curCity").innerHTML = e.name;

    // 点击后隐藏城市列表
    document.getElementById("cityList").style.display = "none";
  });
  // 给“更换城市”链接添加点击操作
  document.getElementById("curCityText").onclick = function() {
    var cl = document.getElementById("cityList");
    if (cl.style.display == "none") {
      cl.style.display = "";
    } else {
      cl.style.display = "none";
    } 
  };
  // 给城市列表上的关闭按钮添加点击操作
  document.getElementById("popup_close").onclick = function() {
    var cl = document.getElementById("cityList");
    if (cl.style.display == "none") {
      cl.style.display = "";
    } else {
      cl.style.display = "none";
    } 
  };
</script>