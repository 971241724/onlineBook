<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<title>修改用户留言</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/backstage_css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/backstage_css/web.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/backstage_css/jquery-ui-1.10.4.custom.css">
<script src="${pageContext.request.contextPath }/backstage_js/jquery-1.11.0.js"></script>
<script src="${pageContext.request.contextPath }/backstage_js/jquery-ui-1.10.4.custom.js"></script>
<script src="${pageContext.request.contextPath }/backstage_js/bootstrap.js"></script>
<script>
window.onload=function(){
red=document.getElementsByName("userMessage.isConfirm");
var val=red[0].dataset.value;
if(val==1){
	red[0].checked=true;
	
}else{
	red[1].checked=true;
}
	
}
</script>
</head>
<body>
	<div class="main">
		<table class="table table-bordered">
			<caption>
				<strong>修改用户留言</strong>
			</caption>
			<tr>
				<td>
				<form action="${pageContext.request.contextPath }/htupdateMessage.action" method="post" class="form-horizontal">
						<input type="hidden" name="id" value="${message.message_id}">
						<input type="hidden" name="message_username" value="${message.message_username}">
						<input type="hidden" name="message_date" value="${message.message_date}">
						<input type="hidden" name="message_theme" value="${message.message_theme}">
				<%-- 标题： <input type="text" name="userMessage.userMessageTitle" class="input-large uneditable-input"
							value="<s:property value="userMessage.userMessageTitle"/>" />
						 <br/><br/> --%>
				内容：
				<textarea name="message_content"  rows="6" cols="26">${message.message_content}</textarea>
				<br/> <br/>
							<%--    是否通过审核：
			    已通过<input type="radio" name="userMessage.isConfirm"  data-value="<s:property value="userMessage.isConfirm"/>" value="1"/>
			   未通过<input type="radio" name="userMessage.isConfirm"  value="0"/>  --%>       
			<br/>	
			<input type="submit" value="提交" class="btn-primary">&nbsp;&nbsp;
			<input type="reset" value="重置" class="btn-primary">
			 </form>
			 </td>
			</tr>
		</table>

	</div>


</body>
</html>