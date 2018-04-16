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
<title>已处理订单</title>

<link rel="stylesheet" href="${pageContext.request.contextPath }/backstage_css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/backstage_css/web.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/backstage_css/jquery-ui-1.10.4.custom.css">
<script src="${pageContext.request.contextPath }/backstage_js/jquery-1.11.0.js"></script>
<script src="${pageContext.request.contextPath }/backstage_js/jquery-ui-1.10.4.custom.js"></script>
<script src="${pageContext.request.contextPath }/backstage_js/bootstrap.js"></script>

</head>


<body>
<div class="main">
<label class="label">已处理订单</label>
<table class="table table-striped table-bordered table-condensed"> 
 <thead>
 <tr> <th>订单编号</th> 
      <th>订单客户</th>
      <th>订货日期</th>
      <th>送货电话</th>
      <th>送货地址</th>
      
  </tr> 
 </thead>
  <tbody>   
  <c:forEach items="${page.beanlist }" var="bl">
  		<tr> 
			<td class="order_id">${bl.order_id }</td>
			<td>${bl.user.user_name }</td>
			<td><fmt:formatDate value="${bl.pay_date}" pattern="yyyy-MM-dd"/></td>
			<td>${bl.user.user_phone }</td>
			<td>${bl.user.user_site }</td> 
  		</tr>  
	</c:forEach> 
  </tbody>
</table>
<div class="pagination">
		     <ul>
		     	<li><a>第${page.pc }页/共${page.tp }页</a></li>
		     	<li><a href="${pageContext.request.contextPath }/findDealedOrder.action?pc=${1 }">首页</a></li>
		        <c:if test="${page.pc>1 }">
		           <li class="active">
			    		<a href="${pageContext.request.contextPath }/findDealedOrder.action?pc=${page.pc-1 }">上一页</a>
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
			    	    		<a href="${pageContext.request.contextPath }/findDealedOrder.action?pc=${i }">${i }</a>
			    	        </li>
			    	    </c:if>
		    			<c:if test="${page.pc==i }">
		    				<%-- <li class="active">${i }</li> --%>
		    			</c:if>
			    </c:forEach>
			    <c:if test="${page.pc<page.tp }">
			        <li>
			    		<a href="${pageContext.request.contextPath }/findDealedOrder.action?pc=${page.pc+1 }">下一页</a>
			        </li>
			    </c:if>
			    <li>
			    	<a href="${pageContext.request.contextPath }/findDealedOrder.action?pc=${page.tp }">尾页</a>
		        </li>
		     </ul>
		     <c:if test="${message!=null }">
		     	<font style="color: red;">${message }</font>
		     </c:if>
	</div>

</body>
</html>
