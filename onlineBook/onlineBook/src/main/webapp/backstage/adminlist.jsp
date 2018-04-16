<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>fruit公告管理中心</title>

<link rel="stylesheet" href="${pageContext.request.contextPath }/backstage_css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/backstage_css/web.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/backstage_css/jquery-ui-1.10.4.custom.css">
<script src="${pageContext.request.contextPath }/backstage_js/jquery-1.11.0.js"></script>
<script src="${pageContext.request.contextPath }/backstage_js/jquery-ui-1.10.4.custom.js"></script>
<script src="${pageContext.request.contextPath }/backstage_js/bootstrap.js"></script>

</head>


<body>
	<div class="main">
		<label class="label">管理员列表</label>
		<table class="table table-striped table-bordered table-condensed">
			<thead>
				<tr>
					<th>管理员ID</th>
					<th>姓名</th>
					<th>性别</th>
					<th>年龄</th>
				</tr>
			</thead>
			<tbody>
			    <c:forEach items="${page.beanlist }" var="bl">
			    	<tr>
			    		<td>${bl.admin_id }</td>
			    		<td>${bl.admin_name }</td>
			    		<td>${bl.admin_sex }</td>
			    		<td>${bl.admin_age }</td>
			    	</tr>
			    </c:forEach>
			    <tr style="text-align: center">
			 	    <td colspan="4" style="text-align: center">
	                                第${page.pc }页/共${page.tp }页
			    	<a href="${pageContext.request.contextPath }/selectAdmin.action?pc=${1 }">首页</a>
			    	<c:if test="${page.pc>1 }">
			    		<a href="${pageContext.request.contextPath }/selectAdmin.action?pc=${page.pc-1 }">上一页</a>
			    	</c:if>
			    	
			    	<c:choose>
				    	<c:when test="${page.tp<10 }">
					    	<c:set var="begin" value="1"/>
					    	<c:set var="end" value="${page.tp }"/>
				    	</c:when>
				    	<c:otherwise>
				    	    <c:set var="begin" value="${page.pc-5 }"/>
				    	    <c:set var="end" value="${page.pc+4 }"/>
				    	    <c:if test="${begin<1 }">
				    	    	<c:set var="begin" value="1"/>
				    	    	<c:set var="end" value="10"/>
				    	    </c:if>
				    	    <c:if test="${end>page.tp }">
				    	        <c:set var="begin" value="${page.tp-9 }" />
				    	        <c:set var="end" value="${page.tp }" />
				    	    </c:if>
				    	</c:otherwise>
			    	</c:choose>
			    	<c:forEach var="i" begin="${begin }" end="${end }">
			    	    <c:if test="${page.pc!=i }">
			    	    	<a href="${pageContext.request.contextPath }/selectAdmin.action?pc=${i }">${i }</a>
			    	    </c:if>
		    			<c:if test="${page.pc==i }">[${i }]</c:if>
			    	</c:forEach>
			    	<c:if test="${page.pc<page.tp }">
			    		<a href="${pageContext.request.contextPath }/selectAdmin.action?pc=${page.pc+1 }">下一页</a>
			    	</c:if>
			    	<a href="${pageContext.request.contextPath }/selectAdmin.action?pc=${page.tp }">尾页</a>
			 	 </td>
			 </tr>
			
			<!-- <s:iterator value="listAdmins" id="la">
				<tr>
					<td><s:property value="#la.adminId"/></td>
					<td><s:property value="#la.adminName"/></td>
					<td><s:property value="#la.adminSex"/></td>
					<td>
					<s:if test="#la.adminBirth==null">未填写</s:if>
					<s:elseif test="#la.adminBirth!=null"><s:text name="global.time"><s:param value="#la.adminBirth"></s:param></s:text></s:elseif>
					</td>
				</tr>
			</s:iterator> -->	
			</tbody>
		</table>



	</div>
</body>
</html>
