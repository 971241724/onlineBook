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
<title>添加公告</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/backstage_css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/backstage_css/web.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/backstage_css/jquery-ui-1.10.4.custom.css">
<script src="${pageContext.request.contextPath }/backstage_js/jquery-1.11.0.js"></script>
<script src="${pageContext.request.contextPath }/backstage_js/jquery-ui-1.10.4.custom.js"></script>
<script src="${pageContext.request.contextPath }/backstage_js/bootstrap.js"></script>
</head>
<body>
	<div class="main">
		<table class="table table-bordered">
			<caption>
				<strong>添加公告信息</strong>
			</caption>
			<tr>
				<td>
				<form action="${pageContext.request.contextPath }/htaddNotice.action" method="post" class="form-horizontal">
						
				标题： <input type="text" name="notice_title" class="input-large" />
						<br/><br/>
				内容：
					<textarea name="notice_content" class="textarea" rows="6"></textarea>
				<br/><br/>
				<input type="submit" value="提交" class="btn-primary">&nbsp;&nbsp;
				<input type="reset" value="重置" class="btn-primary">
			 </form>
			 </td>
			</tr>
		</table>

	</div>


</body>
</html>