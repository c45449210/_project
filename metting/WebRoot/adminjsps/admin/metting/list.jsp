<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
<title>排列</title>

<link href="<%=request.getContextPath()%>/jsps/css/bootstrap.min.css"rel="stylesheet">
<link rel="stylesheet" type="text/css"  href="<%=request.getContextPath()%>/jsps/css/zzsc.css"  >
<style type="text/css">
    .glyphicon { margin-right:5px; }
    .btn-wrapper{
        padding: 1em 0;
    }
    .thumbnail
    {
        margin-bottom: 20px;
        padding: 0px;
        -webkit-border-radius: 0px;
        -moz-border-radius: 0px;
        border-radius: 0px;
    }

    .item.list-group-item
    {
        float: none;
        width: 100%;
        background-color: #fff;
        margin-bottom: 10px;
    }
    .item.list-group-item:nth-of-type(odd):hover,.item.list-group-item:hover
    {
        background: #428bca;
    }

    .item.list-group-item .list-group-image
    {
        margin-right: 10px;
    }
    .item.list-group-item .thumbnail
    {
        margin-bottom: 0px;
    }
    .item.list-group-item .caption
    {
        padding: 9px 9px 0px 9px;
    }
    .item.list-group-item:nth-of-type(odd)
    {
        background: #eeeeee;
    }

    .item.list-group-item:before, .item.list-group-item:after
    {
        display: table;
        content: " ";
    }

    .item.list-group-item img
    {
        float: left;
    }
    .item.list-group-item:after
    {
        clear: both;
    }
    .list-group-item-text
    {
        margin: 0 0 11px;
        height:65px;
        font-size:12px;
    }
</style>

</head>
<body>
    <div class="container">
    <!-- 切换显示菜单 -->
    <div class="btn-wrapper">
            <strong>显示为：</strong>
            <div class="btn-group">
                <a href="#" id="list" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-th-list">
                </span>列表布局</a> <a href="#" id="grid" class="btn btn-default btn-sm"><span
                    class="glyphicon glyphicon-th"></span>网格布局</a>
            </div>
        </div>
    
    <p> </p>
        <div id="products" class="row list-group">
        <c:forEach items="${mettingList }" var="metting">
            <div class="item  col-xs-4 col-lg-4">
                <div class="thumbnail">
                    <img class="group list-group-image"  src="<c:url value='/${metting.image }'/>" alt="" />
                    <div class="caption">
                        <h4 class="group inner list-group-item-heading">
                            ${metting.bname }</h4>
                        <p class="group inner list-group-item-text">
                         ${metting.mtext }</p>
                        <div class="row">
                            <div class="col-xs-12 col-md-6">
                                <p class="lead">
                                    ${metting.price }</p>
                            </div>
                            <div class="col-xs-12 col-md-6">
                                <a class="btn btn-success" href="<c:url value='/admin/AdminMettingServlet?method=load&bid=${metting.bid }' />" target="_blank">查看详情</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
           </c:forEach>
        </div> 
    </div>

<script src="<%=request.getContextPath()%>/jsps/js/jquery-1.9.1.min.js"  type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/jsps/js/bootstrap.min.js" ></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('#list').click(function(event){event.preventDefault();$('#products .item').addClass('list-group-item');});
        $('#grid').click(function(event){event.preventDefault();$('#products .item').removeClass('list-group-item');$('#products .item').addClass('grid-group-item');});
    });
</script>


</body>
</html>