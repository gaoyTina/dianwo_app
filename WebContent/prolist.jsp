<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="java.util.regex.*" %>
<%
List<Map<String, Object>> list = (List<Map<String, Object>>)request.getAttribute("list");
String pagestr = (String)request.getAttribute("pagestr");
Map<String, Object> currentmember=(Map<String,Object>)session.getAttribute("currentmember");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<!--先引入公共的样式表  公共样式表里面的样式所有页面都有 -->
		<link rel="stylesheet" type="text/css" href="css/common.css"/>
		<!--引入当前页面的私有样式-->
		<link rel="stylesheet" type="text/css" href="css/productlist.css"/>
		<!--引入轮播样式表-->
		<link rel="stylesheet" type="text/css" href="css/slide.css"/>
		
	</head>
	<body>
		<!--头部开始-->
		<div id="top">
			<div class="innerclass" id="topinner">
				<a href="index">首页</a> |
				<a href="uiprolist?typeid=1">小米</a> |
				<a href="uiprolist?typeid=2">红米</a> |
				<a href="uiprolist?typeid=3">电视</a> 
				<div id="topright">
				    <%if(currentmember==null) {%>
					<a href="uilogin.jsp">登录</a>
					<a href="reg.jsp">注册</a>
					<%}else{ %>
					欢迎您,<%=currentmember.get("truename")%>!
					<%} %>
					<a href="uiorderlist">我的订单</a>
					<a href="uiaddtocar" id="car">购物车</a>
				</div>
			</div>
		</div>
		<div id="header" class="innerclass">
			<a href="index" id="logo"><img src="img/Logo.png"></a>
			<div id="nav">
				<a href="uiprolist?typeid=1">小米手机</a>
				<a href="uiprolist?typeid=2">红米</a>
				<a href="uiprolist?typeid=3">电视</a>
				<a href="uiprolist?typeid=4">笔记本</a>
				<a href="uiprolist?typeid=5">盒子</a>
				<a href="uiprolist?typeid=6">路由器</a>
				<a href="uiprolist?typeid=7">智能硬件</a>
				<a href="uiprolist?typeid=8">服务</a>
				<a href="uiprolist?typeid=9">社区</a>
			</div>
			<div id="search">
				<input type="text" name="tbsearchkey" placeholder="小米node3" />
			    <p id="btnsearch"></p>
			</div>
		</div>
		<!--头部结束-->
		
		<!--主体开始-->
		<div id="main" class="innerclass">
			
			<p class="title">小米手机</p>
			<ul id="prolist">
			<%int i=0; %>
			<%for (Map<String, Object> m : list) { %>
				<%
					i++;
					if(i%4==0){
				%>
				<li class="last">
					<a href="uiproview?id=<%=m.get("id")%>" class="hasimg"><img src="upload/<%=m.get("imgurl")%>" style="max-width:170px;max-height:145px;"></a>
					<a href="uiproview?id=<%=m.get("id")%>" class="hastxt"><%=m.get("proname")%></a>
					<p class="description">
						<%if (m.get("brief").toString().length()>20){%>
							<%=m.get("brief").toString().substring(0,20)%>
						<%}else{%>
							<%=m.get("brief")%>
						<%}%>
						</p>
					<p class="price"><%=m.get("price")%>元</p>
				</li>
				<%}else{ %>
				<li>
					<a href="uiproview?id=<%=m.get("id")%>" class="hasimg"><img src="upload/<%=m.get("imgurl")%>" style="max-width:170px;max-height:145px;"></a>
					<a href="uiproview?id=<%=m.get("id")%>" class="hastxt"><%=m.get("proname")%></a>
					<p class="description">
						<%if (m.get("brief").toString().length()>20){%>
							<%=m.get("brief").toString().substring(0,20)%>
						<%}else{%>
							<%=m.get("brief")%>
						<%}%>
						</p>
					<p class="price"><%=m.get("price")%>元</p>
				</li>
				<% } %>
			<%}%>
				
				
			</ul>
			
			<div class="pager" style="clear:both;"><%=pagestr%></div>
		</div>
		<!--主体结束-->
		
		
		<!--底部开始-->
		<div id="footer">
			<div id="service" class="innerclass">
				<a href="###" style="background-image: url(img/icon1.png);">预约维修服务</a> | <a href="###" style="background-image: url(img/icon2.png);">7天无理由退货</a> | <a href="###" style="background-image: url(img/icon3.png);">15天免费换货</a> | <a href="###" style="background-image: url(img/icon4.png);">满150元包邮</a> |<a href="###" style="background-image: url(img/icon5.png);">520余家售后 </a> 
			</div>
			
			<div id="bottomwrapper" class="innerclass">
				<div id="bottomleft">
					<dl>
						<dt>帮助中心</dt>
						<dd>账户管理</dd>
						<dd>购物指南</dd>
						<dd>订单操作</dd>
					</dl>
					<dl>
						<dt>帮助中心</dt>
						<dd>账户管理</dd>
						<dd>购物指南</dd>
						<dd>订单操作</dd>
					</dl>
					<dl>
						<dt>帮助中心</dt>
						<dd>账户管理</dd>
						<dd>购物指南</dd>
						<dd>订单操作</dd>
					</dl>
					<dl>
						<dt>帮助中心</dt>
						<dd>账户管理</dd>
						<dd>购物指南</dd>
						<dd>订单操作</dd>
					</dl>
					<dl>
						<dt>帮助中心</dt>
						<dd>账户管理</dd>
						<dd>购物指南</dd>
						<dd>订单操作</dd>
					</dl>
					<dl>
						<dt>帮助中心</dt>
						<dd>账户管理</dd>
						<dd>购物指南</dd>
						<dd>订单操作</dd>
					</dl>
				</div>
				<div id="bottomright">
				</div>
			</div>
			
			<div id="copyright" class="innerclass">
				<p class="first">
					<a href="###">小米商城</a> |
					<a href="###">miui</a> |
					<a href="###">米聊</a> |
					<a href="###">游戏</a> |
					<a href="###">多看阅读</a> |
					<a href="###">小城</a> |
					<a href="###">游戏</a> |
					<a href="###">小米商城</a> |
					<a href="###">游戏</a> |
					<a href="###">小米</a> 
				</p>
				<p> ICP备案号 数 蜀 ICB 55234441212 京公安备案 ：sssss223222</p>
				<p>违法和不良信息举报电话：12315 </p>
			</div>
			
		</div>
		<!--底部结束-->
	
	
	
	<!--引入jq库-->
	<script src="js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
	<!--引入轮播-->
	<script src="js/tyslide.js" type="text/javascript" charset="utf-8"></script>
	<!--库--框架-插件---组建 ：这些都数指具有一定结构和功能的代码  -->
	
	<!--调用轮播代码-->
	<script type="text/javascript">
		$("#ppt01").tyslide({
			boxh:460,//盒子的高度
			w:1226,//盒子的宽度
			h:460,//图片的高度
			isShow:true,//是否显示控制器
			isShowBtn:true,//是否显示左右按钮
			controltop:10,//控制按钮上下偏移的位置,要将按钮向下移动   首先保证boxh 高度>图片 h
			controlsW:20,//控制按钮宽度
			controlsH:20,//控制按钮高度
			radius:1,//控制按钮圆角度数
			controlsColor:"#FECA14",//普通控制按钮的颜色
			controlsCurrentColor:"#FF6700"//当前控制按钮的颜色
		});
	</script>

		
	</body>
</html>
    