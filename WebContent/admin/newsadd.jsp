<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="../css/comm.css"/>
		
	</head>
	<body>
		<form action="newsadd" method="post">
			<p class="path">剩余人生信息系统/信息中心/发布信息</p>
			<table border="0" cellspacing="0" cellpadding="0" class="tb">
				<tr>
					<td class="lable">类别</td><td>
					    <select name="typeid">
					    	<option value="1">关注</option>
					    	<option value="2">附近</option>
					    	<option value="3">王者荣耀</option>
					    	<option value="4">颜值</option>
					    	<option value="5">才艺</option>
					    </select>
				    </td>
				</tr>
				<tr><td class="lable">头像</td><td><input type="file" name="tbpicture"/></td></tr>
				<tr><td class="lable">昵称</td><td><input type="text" name="tbname"/></td></tr>
				<tr><td class="lable">性别图片</td><td><input type="file" name="tbimage"/></td></tr>
				<tr><td class="lable">年龄</td><td><input type="number" name="tbyear"/></td></tr>
				<tr><td class="lable">动态</td><td><input type="file" name="tbdtai"/></td></tr>
				<tr><td class="lable">发布时间</td><td><input type="text" name="tbtime"/></textarea></td></tr>
				<tr><td class="lable">&nbsp;</td><td><input type="submit" name="btnsave" value="发布" id="btnsave"/></td></tr>
			</table>
			
		</form>
		
	</body>
</html>