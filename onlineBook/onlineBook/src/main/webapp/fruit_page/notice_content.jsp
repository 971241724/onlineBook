<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%--  <%@ taglib prefix="s" uri="/struts-tags" %>  --%> 
       <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- saved from url=(0013)about:internet -->
	<title></title>
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath }/fruit_page_img/favicon.ico" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/fruit_page_css/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/fruit_page_css/jquery-ui-1.10.4.custom.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/fruit_page_css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/fruit_page_css/notice.css">
    <script src="${pageContext.request.contextPath }/fruit_page_js/showcontent.js"></script>
	<script src="${pageContext.request.contextPath }/fruit_page_js/modernizr.js"></script>
	<script src="${pageContext.request.contextPath }/fruit_page_js/jquery-1.11.0.js"></script>
	<script src="${pageContext.request.contextPath }/fruit_page_js/jquery-ui-1.10.4.custom.js"></script>
	<script src="${pageContext.request.contextPath }/fruit_page_js/jquery.validate.js"></script>
	<script src="${pageContext.request.contextPath }/fruit_page_js/jquery.form.js"></script>
	<script src="${pageContext.request.contextPath }/fruit_page_js/common.js"></script>
	<!-- 本页面加载文件 -->
</head>
<body style="overflow: auto;">
<div class="div-frm" style="margin:5px 25px 0px 25px;">
	<table id="tabedit" class="frm">
        	<div id="d1">
				<div >
					<p >${notice.notice_title}</p>
				</div>
				<div>
					${notice.notice_content}
				</div>
				<div >
					<p >${notice.notice_date}</p>
					
				</div>
			</div>
	</table>
</div>
</body>

</html>