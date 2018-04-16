<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>跳转界面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
			body{
				background-color:#C4E8FB;
				background-size:100%;
			}
		</style>
   </head>
  
  <body>
    <center>
		<h2>
			<%
				response.setHeader("refresh", "5;URL=pageSelectCart.action?pc=1");//这里的5,是你要确定的时间秒URL是要跳转的地址
			%>
		</h2>
		<p>支付成功，页面将在5秒后跳转至购物车界面……</p>
	</center>
  </body>
</html>
