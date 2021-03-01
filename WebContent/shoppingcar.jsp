<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="java.util.regex.*" %>
<%
List<Map<String, Object>> carlistall = (List<Map<String, Object>>)request.getAttribute("carlistall");
Map<String, Object> obj=(Map<String,Object>)request.getSession().getAttribute("currentmember");	
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<!--引入公共样式表-->
		<link rel="stylesheet" type="text/css" href="css/common.css"/>
		<!--引入购物车页面的样式表-->
		<link rel="stylesheet" type="text/css" href="css/shoppingcar.css"/>
	</head>
	<body>
		<!--头部开始-->
		<div id="carheader">
			<div id="carheaderwrapper" class="innerclass">
				<a href="index" id="carlogo"><img src="img/Logo.png"></a>
				<span id="mycar">我的购物车</span>
				<span id="msg">温馨提示：商品是否购买成功，以下单为准，请尽快结算哦.</span>
			</div>
		</div>
		
		<!--头部结束-->
		
		<!--购物车开始-->
		
		<table border="0" cellspacing="0" cellpadding="0" class="innerclass" id="cartable">
			<tr><td style="width: 150px;height: 30px;">商品图片</td><td>商品名称</td><td>单价</td><td style="width: 150px;">数量</td><td style="width: 150px;">小计</td><td style="width: 150px;">操作</td></tr>
			<%for (Map<String, Object> m : carlistall) { %>
			<tr data-proid="<%=m.get("proid")%>"><td><img src="upload/<%=m.get("imgurl")%>" style="width:124px;height:145px;"></td><td style="font-size: 16px;"><%=m.get("proname")%></td><td><span><%=m.get("price")%></span>元</td><td><div class="pronumber"><span class="left">-</span><input type="text" value="<%=m.get("procount")%>"/><span class="right">+</span> </div>  </td><td><span></span>元</td><td><span class="del">删除</span></td></tr>
			<%}%>
		</table>
		
		<p id="carbuy" class="innerclass"><a href="index">继续购物</a> <span style="padding-left: 20px;color: #ff6700;font-size:18px;">合计 <b id="sum">3999</b>元 </span> <span id="btnorder">去结算</span></p>
		<div id="receiverinfo" class="innerclass">
			<%if(obj!=null){%>
				<p>收货人姓名:<input type="text" name="tbname" id="tbname" value="<%=obj.get("truename")%>"/></p>
				<p>收货人电话:<input type="text" name="tbtel" id="tbTel" value="<%=obj.get("tel")%>"/></p>
				<p>收货人地址:<input type="text" name="tbaddress" id="tbaddress" value="<%=obj.get("address")%>" /></p>
				<p>
					<span id="btngotoorder">立即下单</span>
				</p>
			<%}else{%>
			<p>您还没有登录,请登录后再结算! <a href="uilogin.jsp">点击此处登录</a></p>
			
			<%}%>
		</div>	
		
		<!--购物车结束-->
		
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
			//给id为 btnorder的元素绑定一个点击事件
			$("#btnorder").click(function(){
				//点击id为 btnorder的按钮，就会执行此处的代码
				$("#receiverinfo").slideDown();
			});
			
			//给立即下单的按钮绑定一个点击事件
			$("#btngotoorder").click(function(){
				//要去判断这三个文本框里面是否输入了内容  判断的标准：去获取每个文本框里面的值，看这个值的长度是否大于0，如果大于0，就表示输入了内容
				if(!$("#tbname").val().length>0)//判断长度是否大于0，取反之后就数不大于0，即：没有输入内容。
				{
					alert("请输入收货人姓名!");
					$("#tbname").focus();//让一个表单元素获得焦点 
					return false;
				}
				
				if(!$("#tbTel").val().length>0)//判断长度是否大于0，取反之后就数不大于0，即：没有输入内容。
				{
					alert("请输入收货人联系电话!");
					$("#tbTel").focus();//让一个表单元素获得焦点 
					return false;
				}
				
				if(!$("#tbaddress").val().length>0)//判断长度是否大于0，取反之后就数不大于0，即：没有输入内容。
				{
					alert("请输入收货人详细地址!");
					$("#tbaddress").focus();//让一个表单元素获得焦点 
					return false;
				}
				
				//检查购物车里面是否又商品
				var len=$("#cartable").find("tr").length;
				if(len<2)
				{
					e.preventDefault();
					return false;
				}
				
				$.ajax({
				    url:'uiaddorder', //要请求的url地址
				    type:'POST', //请求方法 GET or POST
				    async:true, //是否使用异步请求的方式
				    timeout:5000, //请求超时的时间，以毫秒计
				    data:{
				    	tbname:$("#tbname").val(),
				        tbtel:$("#tbTel").val(),
				        tbaddress:$("#tbaddress").val()
				    },
				    dataType:'json', //预期的服务器返回参数类型
				    beforeSend:function(){
				        
				    },//再发送请求前调用的方法
				    success:function(data) {
				       location.href="result.jsp";
				    }, //请求成功时回调方法，data为服务器返回的数据
				    error:function(){
				       
				    }, //请求发生错误时调用方法
				    complete:function(){
						jisuan();
				    } 
				});
				
			});
			
			
			//给所有的加号绑定点击事件
			$(".pronumber span.right").click(function(){
				//点击加号的时候，把当前加号按钮所在的行的商品数量取出来，加上1  然后再放回去。
				var oldvalue=$(this).prev().val();
				var newvalue=parseInt(oldvalue)+1;
				var that=this;
				var proid=$(that).parent().parent().parent().attr("data-proid");
				$.ajax({
				    url:'uiupdatecarcount', //要请求的url地址
				    type:'POST', //请求方法 GET or POST
				    async:true, //是否使用异步请求的方式
				    timeout:5000, //请求超时的时间，以毫秒计
				    data:{
				        id :proid,
				        countvalue:newvalue
				    },
				    dataType:'json', //预期的服务器返回参数类型
				    beforeSend:function(){
				        
				    },//再发送请求前调用的方法
				    success:function(data) {
				        console.log(data);
				    }, //请求成功时回调方法，data为服务器返回的数据
				    error:function(){
				       
				    }, //请求发生错误时调用方法
				    complete:function(){
				    	$(that).prev().val(newvalue);
						jisuan();
				    } //回调方法 无论success或者error都会执行
				});
				
			});
			//给所有的减号绑定点击事件
			$(".pronumber span.left").click(function(){
				//点击加号的时候，把当前加号按钮所在的行的商品数量取出来，加上1  然后再放回去。
				var oldvalue=$(this).next().val();
				var newvalue=parseInt(oldvalue)-1;
				if(newvalue<1)
				{
					newvalue=1;
				}
				
				var that=this;
				var proid=$(that).parent().parent().parent().attr("data-proid");
				$.ajax({
				    url:'uiupdatecarcount', //要请求的url地址
				    type:'POST', //请求方法 GET or POST
				    async:true, //是否使用异步请求的方式
				    timeout:5000, //请求超时的时间，以毫秒计
				    data:{
				        id :proid,
				        countvalue:newvalue
				    },
				    dataType:'json', //预期的服务器返回参数类型
				    beforeSend:function(){
				        
				    },//再发送请求前调用的方法
				    success:function(data) {
				        console.log(data);
				    }, //请求成功时回调方法，data为服务器返回的数据
				    error:function(){
				       
				    }, //请求发生错误时调用方法
				    complete:function(){
				    	$(that).prev().val(newvalue);
						jisuan();
				    } //回调方法 无论success或者error都会执行
				});
				
				
				$(this).next().val(newvalue);
				jisuan();
			});
			
			
			
			$("span.del").click(function(){
				var that=this;
				var proid=$(that).parent().parent().attr("data-proid");
				$.ajax({
				    url:'uicardelete', //要请求的url地址
				    type:'POST', //请求方法 GET or POST
				    async:true, //是否使用异步请求的方式
				    timeout:5000, //请求超时的时间，以毫秒计
				    data:{
				        id :proid
				    },
				    dataType:'json', //预期的服务器返回参数类型
				    beforeSend:function(){
				        
				    },//再发送请求前调用的方法
				    success:function(data) {
				        console.log(data);
				        $(that).parent().parent().remove();
				    }, //请求成功时回调方法，data为服务器返回的数据
				    error:function(){
				       
				    }, //请求发生错误时调用方法
				    complete:function(){
						jisuan();
				    } 
				});
			});
			
			
			
			
			function jisuan()
			{
				
				//1、运算每一行的小计  = 单价*数量
				//2、对所有行的小计进行合计。
				var sum=0;
				$(".pronumber").each(function(index,item){
					//把每一行的单价和数量取出来进行运算，并且把运算的结果交给小计
					var num= parseInt($(item).find("input").val());//取出当前行商品的数量，并且将数量转为数字
					var price=parseInt($(item).parent().prev().find("span").text());//取出商品的单价
					var xiaoji=price*num;
					$(item).parent().next().find("span").text(xiaoji);
					sum=sum+xiaoji;
				});
				$("#sum").text(sum);
			}
			
			jisuan();
		</script>
		
	</body>
</html>
    