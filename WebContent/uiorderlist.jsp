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
		<!--引入公共样式表-->
		<link rel="stylesheet" type="text/css" href="css/common.css"/>
		<link rel="stylesheet" type="text/css" href="css/comm.css"/>
		<style type="text/css">
			#main{
				width:1226px;
				height:350px;
				margin:0 auto;
				background-color:#fff;
				border-radius:5px;
			}
			h2{
				text-align:center;
				color:#333;
				line-height:80px;
			}
			a.goon{
				display:block;
				text-align:center;
			}
		</style>
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
		<div id="main">
			<p class="path">会员中心/我的订单/订单列表</p>

<table border="0" cellspacing="0" cellpadding="0" class="tb tblis">
       <tr>
       	  <td style="width:160px;">订单号</td><td style="width:100px;">姓名</td><td style="width:100px;">电话</td><td>地址</td><td style="width:100px;">金额</td><td style="width:180px;">时间</td><td style="width:120px;">操作</td>   
       </tr>
       <%for (Map<String, Object> m : list) { %>
        <tr>
       		<td><%=m.get("orderid")%></td>
       		<td><%=m.get("sname")%></td>
       		<td><%=m.get("stel")%></td>
       		<td><%=m.get("saddress")%></td>
       		<td><%=m.get("sumprice")%></td>
       		<td><%=m.get("ctime")%></td>
       		<td><a href="uiorderview?orderid=<%=m.get("orderid")%>">查看详细</a></td>
       </tr>
    	<% } %>
    </table>
    
    <div class="pager">
       		<%=pagestr%>
    </div>
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
		
	</body>
</html>