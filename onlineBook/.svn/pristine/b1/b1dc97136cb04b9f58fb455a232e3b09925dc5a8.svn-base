<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>用户留言管理</title>

<link rel="stylesheet" href="${pageContext.request.contextPath }/backstage_css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/backstage_css/web.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/backstage_css/jquery-ui-1.10.4.custom.css">
<script src="${pageContext.request.contextPath }/backstage_js/jquery-1.11.0.js"></script>
<script src="${pageContext.request.contextPath }/backstage_js/jquery-ui-1.10.4.custom.js"></script>
<script src="${pageContext.request.contextPath }/backstage_js/bootstrap.js"></script>

</head>


<body>

<label class="label">留言信息列表</label>
<table class="table table-striped table-bordered table-condensed"> 
 <thead>
 <tr> <th>留言编号</th>     
       <!-- <th>留言标题</th> --> 
       <th>留言内容</th>
       <th>留言人</th> 
       <th>留言时间</th>
       <th>删除</th>
       <th>修改</th>
       <!-- <th>审核状态</th>  -->
       <th>详情</th> 
  </tr> 
 </thead>
  <tbody>   
  <c:forEach items="${list.beanlist}" var="message" varStatus="varnot">
  <tr> 
       <td>${message.message_id}</td>     
       <td>${message.message_content}</td> 
       <td>${message.message_username}</td> 
       <td>${message.message_date}</td> 
      <%--  <td><a href="deleteUserMessageById?userMessageId=<s:property value="#uml.userMessageId"/>"><i class="icon-trash"></i></a></td> 
       <td>
       <s:if test="#uml.isConfirm==0">未通过</s:if>
       <s:elseif test="#uml.isConfirm==1">
                              已通过
       </s:elseif>
       </td> --%>
       <td><a onclick="del(${message.message_id})">删除</a></td>
       <td><a onclick="update(${message.message_id})">修改</a></td>
       <td><a href="${pageContext.request.contextPath }/htfindbyidMessageForpage.action?message_id=${message.message_id}">详情<i class="icon-edit"></i></a></td> 
  </tr>  
 </c:forEach>
  </tbody>
</table>
<div class="pagination"> 
	<div class="fenye">
	 <tr style="text-align: center">
	 
					 	    <td colspan="7">
			                                                                     第${list.pc }页/共${list.tp }页
					    	<a href="${pageContext.request.contextPath }/htfindbyallMessage.action?pc=${1 }">首页</a>
					    	<c:if test="${list.pc>1 }">
					    		<a href="${pageContext.request.contextPath }/htfindbyallMessage.action?pc=${list.pc-1 }">上一页</a>
					    	</c:if>
					    	
					    	<c:choose>
						    	<c:when test="${list.tp<10 }">
							    	<c:set var="begin" value="1"/>
							    	<c:set var="end" value="${list.tp }"/>
						    	</c:when>
						    	<c:otherwise>
						    	    <c:set var="begin" value="${list.pc-5 }"/>
						    	    <c:set var="end" value="${list.pc+4 }"/>
						    	    <c:if test="${begin<1 }">
						    	    	<c:set var="begin" value="1"/>
						    	    	<c:set var="end" value="10"/>
						    	    </c:if>
						    	    <c:if test="${end>list.tp }">
						    	        <c:set var="begin" value="${list.tp-9 }" />
						    	        <c:set var="end" value="${list.tp }" />
						    	    </c:if>
						    	</c:otherwise>
					    	</c:choose>
					    	<c:forEach var="i" begin="${begin }" end="${end }">
					    	    <c:if test="${list.pc!=i }">
					    	    	<a href="${pageContext.request.contextPath }/htfindbyallMessage.action?pc=${i }">${i }</a>
					    	    </c:if>
				    			<c:if test="${list.pc==i }">[${i }]</c:if>
					    	</c:forEach>
					    	<c:if test="${list.pc<list.tp }">
					    		<a href="${pageContext.request.contextPath }/htfindbyallMessage.action?pc=${list.pc+1 }">下一页</a>
					    	</c:if>
					    	<a href="${pageContext.request.contextPath }/htfindbyallMessage.action?pc=${list.tp }">尾页</a>
					 	 </td>
					 </tr>
		</div>

</div>
</body>

<script type="text/javascript">
	function update(id){
	    var flag = confirm("确定修改吗?");
	    if(flag){
	        window.location.href="${pageContext.request.contextPath }/htupdateMessageForpage.action?message_id="+id;
	    }
	}
	
	function del(id){
	    var flag = confirm("确定删除吗?");
	    if(flag){
	        window.location.href="${pageContext.request.contextPath }/htdelMessage.action?message_id="+id;
	    }
	}
</script>
</html>
