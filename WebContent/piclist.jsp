<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="java.util.regex.*" %>

<%
List<Map<String, Object>> list = (List<Map<String, Object>>)request.getAttribute("list");
String pagestr = (String)request.getAttribute("pagestr");
%>

	
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>重庆工商大学融智学院软件工程班级信息发布系统v1.0</title>
		<link rel="stylesheet" type="text/css" href="css/comm.css"/>
		<link rel="stylesheet" type="text/css" href="css/slide.css"/>
		<style type="text/css">
			.header{
				width: 1200px;
				height: 35px;
				line-height: 35px;
				background-color:#CA5A34;
				box-shadow: 0px 2px 2px #CA5A34;
				margin: 0 auto;
			}
			
			.header ul{
				list-style: none;
				margin: 0 auto;
				width: 1200px;
			}
			
			.header ul li{
				line-height: 35px;
				float: left;
				padding: 0 15px;
			}
			
			.header ul li:hover {
				background-color: blueviolet;
			}
			.header ul li a{
				text-decoration: none;
				color: #fff;
			}		
			.main{
				width: 1200px;
				margin: 0 auto;
				overflow: hidden;
			}	
			.pptwrapper{
				padding-top: 5px;
				min-height: 250px;
			}
			
			.newsitem{
				width:388px;
				height:252px;
				float: left;
				border: solid 1px #eee;
				margin-top: 10px;
				margin-right: 10px;
			}
			.itemright{
				margin-right:0;
				width: 398px;
			}
			.newsitem .title{
				height: 35px;
				line-height: 35px;
				padding-left: 10px;
				border-bottom: solid 1px #eee;
				background-color: #eee;
				color: #333;
			}
			
			.newsitem a {
				line-height:30px;
				border-bottom:dashed 1px #eee;
				display: block;
				padding-left: 10px;
				color: #333;
			}
			
			.footer{
				clear: both;
				height:150px;
				width: 1200px;
				margin: 0 auto;
				border: solid 1px #eee;
				background-color: #A52A2A;
				margin-top: 10px;
				padding-top: 50px;
				background-image: url(img/bottom_frame_logo.png);
				background-repeat: no-repeat;
				background-position: 50px 30px;
			}
			
			.footer p{
				color: white;
				line-height: 35px;
				font-size: 14px;
				text-align: center;
			}
			
			.path{
				line-height: 35px;
				border-bottom: solid 1px #eee;
				margin-bottom: 10px;
			}
			
			.listwrapper{
				
			}
			
			.leftclass{
				float: left;
				width: 220px;
				border: solid 1px #eee;
				margin-right: 20px;
				border-bottom: 0;
			}
			
			.leftclass a{
				display: block;
				line-height: 35px;
				border-bottom: solid 1px #eee;
				padding-left: 10px;
			}
			.rightlist{
				width: 936px;
				float: left;
				border: solid 1px #eee;
				padding: 10px;
				over-flow:hidden;
			}
			
			.rightlist li{
				
				border-bottom: dashed 1px #eee;
				float:left;
				width:280px;
				height:200px;
				margin-left:10px;
				margin-top:20px;
			}
			
			.rightlist li img{
				
			
				width:280px;
				height:150px;
				
			}
			
			
			
			.rightlist a{
				
			}
		</style>
	</head>
	<body>
	<div class="header">
		<ul>
			<li><a href="index">首页</a></li>
			<li><a href="uinewslist?typeid=1">学校公告</a></li>
			<li><a href="uinewslist?typeid=2">菁菁校园</a></li>
			<li><a href="uinewslist?typeid=3">学校趣闻</a></li>
			<li><a href="uipiclist">校园风光</a></li>
			<li><a href="guestbookadd.jsp">在线留言</a></li>
			<li><a href="contactus.html">联系我们</a></li>
		</ul>
	</div>
	<div class="main">
		<div class="pptwrapper">
			<div class="pptbox" id="ppt01">
				<ul class="innerwrapper">
					<li><a href="#"><img src="img/01.png"/></a></li>
					<li><a href="#"><img src="img/02.png"/></a></li>
					<li><a href="#"><img src="img/03.png"/></a></li>
				</ul>
				<ul class="controls">
					<li class="current">1</li>
					<li>2</li>
					<li>3</li>
				</ul>			
				<span class="btnleft"></span>
				<span class="btnright"></span>
			</div>					
		</div>
		<div class="path">
			当前位置 / 融智信息 / 校园风光
		</div>
		
		<div class="listwrapper">
			<div class="leftclass">
				<a href="uinewslist?typeid=1">学校公告</a>
				<a href="uinewslist?typeid=2">菁菁校园</a>
				<a href="uinewslist?typeid=3">学校趣闻</a>
				<a href="uinewslist?typeid=4">班级通知</a>
				<a href="uinewslist?typeid=5">数学建模</a>
				<a href="uinewslist?typeid=6">生活技巧</a>
			</div>
			<ul class="rightlist">
				<%for(Map<String, Object> m:list) {%>
				<li>
					<p><img src="upload/<%=m.get("imgurl")%>"></p>
					<h5><%=m.get("title")%></h5>
					<p><%=m.get("contents")%></p>
				</li>
				<%} %>
			</ul>
			
			<div style="clear: both;"></div>
			<div class="pager" style="float:right;width:950px;font-size:14px"><%=pagestr%></div>
		</div>
			
	</div>
	<div class="footer">
		<p>地址：重庆市巴南区龙洲湾街道尚文大道906号(401320)  </p><p>电话：023-88968651 传真：023-88968650</p>
	</div>
		
		<script src="js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/tyslide.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			$("#ppt01").tyslide({
			boxh:250,//盒子的高度
			w:1200,//盒子的宽度
			h:250,//图片的高度
			isShow:true,//是否显示控制器
			isShowBtn:true,//是否显示左右按钮
			controltop:5,//控制按钮上下偏移的位置,要将按钮向下移动   首先保证boxh 高度>图片 h
			controlsW:60,//控制按钮宽度
			controlsH:10,//控制按钮高度
			radius:0,//控制按钮圆角度数
			controlsColor:"#eee",//普通控制按钮的颜色
			controlsCurrentColor:"#ccc"//当前控制按钮的颜色
		});
		</script>
	</body>
</html>
	