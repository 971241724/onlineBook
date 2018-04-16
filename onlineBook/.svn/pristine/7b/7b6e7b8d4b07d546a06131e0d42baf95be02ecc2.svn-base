<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<title>fruit日志管理</title>

<link rel="stylesheet" href="${pageContext.request.contextPath }/backstage_css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/backstage_css/web.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/backstage_css/jquery-ui-1.10.4.custom.css">
<script src="${pageContext.request.contextPath }/backstage_js/jquery-1.11.0.js"></script>
<script src="${pageContext.request.contextPath }/backstage_js/jquery-ui-1.10.4.custom.js"></script>
<script src="${pageContext.request.contextPath }/backstage_js/bootstrap.js"></script>

</head>


<body>
	<div class="main">
		<label class="label">日志操作</label>
		<table class="table table-striped table-bordered table-condensed">
			<thead>
				<tr>
					<th>序号</th>
					<th>用户名</th>
					<th>操作时间</th>
					<th>操作IP</th>
					<th>操作模块</th>
					<th>操作名称</th>
					<th>操作结果</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${page.beanlist }" var="bl">
					<tr>
						<td>${bl.log_id }</td>
						<td>${bl.user_name }</td>
						<td><fmt:formatDate value="${bl.create_time }" pattern="yyyy/MM/dd  HH:mm:ss" /></td>
						<td>${bl.visit_ip }</td>
						<td>${bl.module }</td>
						<td>${bl.operation }</td>
						<td>${bl.result }</td>
						<td><a onclick="deleteLog(this)">删除</a></td>
					</tr>                  
				</c:forEach>
			</tbody>
		</table>

		<div class="pagination">
		     <ul>
		     	<li><a>第${page.pc }页/共${page.tp }页</a></li>
		     	<li><a href="${pageContext.request.contextPath }/adminSelectSysOperateLog.action?pc=${1 }">首页</a></li>
		        <c:if test="${page.pc>1 }">
		           <li class="active">
			    		<a href="${pageContext.request.contextPath }/adminSelectSysOperateLog.action?pc=${page.pc-1 }">上一页</a>
			       </li>
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
			    	        <li>
			    	    		<a href="${pageContext.request.contextPath }/adminSelectSysOperateLog.action?pc=${i }">${i }</a>
			    	        </li>
			    	    </c:if>
		    			<c:if test="${page.pc==i }">
		    				<%-- <li class="active">${i }</li> --%>
		    			</c:if>
			    </c:forEach>
			    <c:if test="${page.pc<page.tp }">
			        <li>
			    		<a href="${pageContext.request.contextPath }/adminSelectSysOperateLog.action?pc=${page.pc+1 }">下一页</a>
			        </li>
			    </c:if>
			    <li>
			    	<a href="${pageContext.request.contextPath }/adminSelectSysOperateLog.action?pc=${page.tp }">尾页</a>
		        </li>
		     </ul>
		     <c:if test="${message!=null }">
		     	<font style="color: red;">${message }</font>
		     </c:if>
			
		</div>

	</div>
</body>
    <script type="text/javascript">
        function deleteLog(obj){
        	var ob = $(obj).parent().parent();
        	var log_id = ob.children(":eq(0)").text();
        	if(confirm('确定删除这条数据吗？')){
        		$.ajax({
        			url:'deleteLog.action',
        			type:'post',
        			dataType:'text',
        			data:{"log_id":log_id},
        			success:function(mes){
        				alert(mes);
        				location.href="adminSelectSysOperateLog.action?pc=1";
        			}
        		});
        	}
        }
    </script>
</html>
