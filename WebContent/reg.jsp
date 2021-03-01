<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<!--引入公共的样式表-->
		<link rel="stylesheet" type="text/css" href="css/common.css"/>
		<!--引入注册页面的样式表-->
		<link rel="stylesheet" type="text/css" href="css/reg.css"/>
	</head>
	<body>
		<!--主体开始-->
		<div id="main">
			<div id="reglogo"><img src="img/Logo.png"></div>
			<h3>注册小米帐号</h3>
			<p class="title">用户名</p>
			<p class="hasinput"><input type="text" name="tbusername" id="tbusername"></p>
			
			<p class="title">密码</p>
			<p class="hasinput"><input type="password" name="tbpassword1" id="tbpassword1"></p>
			
			<p class="title">确认密码</p>
			<p class="hasinput"><input type="password" name="tbpassword2" id="tbpassword2"></p>
			
			<p class="title">姓名</p>
			<p class="hasinput"><input type="text" name="tbtruename" id="tbtruename"></p>
			
			<p class="title">电话</p>
			<p class="hasinput"><input type="text" name="tbtel" id="tbtel"></p>
			
			<p class="title">地址</p>
			<p class="hasinput"><input type="text" name="tbaddress" id="tbaddress"></p>
			
			<input type="button" value="立即注册" id="btnreg">
			
			<div id="contact">注册小米帐号即表示你同意并愿意遵守小米用户协议。</div>
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
		
		<script src="js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			$("#btnreg").click(function(e){
				
				var otbusername=$("#tbusername");
				console.log(otbusername.val().length);
				if(!(otbusername.val().length>0))
				{
					alert("请输入用户名!");
					otbusername.focus();
					e.preventDefault();
					return false;
				}
				
				var otbpassword1=$("#tbpassword1");
				if(!(otbpassword1.val().length>0))
				{
					alert("请输入密码!");
					otbpassword1.focus();
					e.preventDefault();
					return false;
				}
				
				var otbpassword2=$("#tbpassword2");
				if(otbpassword1.val()!=otbpassword2.val())
				{
					alert("两次输入的密码不一致!");
					otbpassword2.focus();
					e.preventDefault();
					return false;
				}
				
				$.ajax({
				    url:'uireg', //要请求的url地址
				    type:'POST', //请求方法 GET or POST
				    async:true, //是否使用异步请求的方式
				    timeout:5000, //请求超时的时间，以毫秒计
				    data:{
				    	loginname:$("#tbusername").val(),
				    	password:$("#tbpassword1").val(),
				    	truename:$("#tbtruename").val(),
				        tel:$("#tbtel").val(),
				        address:$("#tbaddress").val()
				    },
				    dataType:'json', //预期的服务器返回参数类型
				    beforeSend:function(){
				        
				    },//再发送请求前调用的方法
				    success:function(data) {
				       alert("注册成功");
				       location.href="uilogin.jsp";
				    }, //请求成功时回调方法，data为服务器返回的数据
				    error:function(){
				       
				    }, //请求发生错误时调用方法
				    complete:function(){
						
				    } 
				});
				
				
			});
			
			
		</script>
	</body>
</html>
