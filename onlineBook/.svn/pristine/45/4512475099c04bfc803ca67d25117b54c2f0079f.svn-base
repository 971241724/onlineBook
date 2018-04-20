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
<label class="label">公告信息列表</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-mini" href="${pageContext.request.contextPath }/backstage/noticeAdd.jsp" target="view_show"><font color="#0066FF"><strong>发布公告</strong></font></a>
<table class="table table-striped table-bordered table-condensed"> 
 <thead>
 <tr> <th>公告编号</th>     
       <th>公告标题</th> 
       <!-- <th>发布人ID</th>  -->
       <th>发布时间</th>
       <th>删除</th> 
       <th>修改</th> 
  </tr> 
 </thead>
  <tbody>   
  <c:forEach items="${list.beanlist}" var="notice" varStatus="varnot">
  <tr> 
       <td>${notice.notice_id}</td>     
       <td>${notice.notice_title}</td> 
       <!-- <td><s:property value="#ml.messageAdmin.adminId"/></td>  -->
       <td>${notice.notice_date}</td> 
       <%-- <td><a href="${pageContext.request.contextPath }/htdelNotice.action?content_id=${notice.notice_id}"><i class="icon-trash"></i></a></td>  --%>
       <td><a onclick="del(${notice.notice_id})">删除</a></td>
       <%-- <td><a href="${pageContext.request.contextPath }/htupdateNoticeForpage.action?content_id=${notice.notice_id}"><i class="icon-edit"></i></a></td>  --%>
        <td><a onclick="update(${notice.notice_id})">修改</a></td>
  </tr>  
 </c:forEach>
  </tbody>
</table>
<div class="pagination">  <!-- <ul>    <li><a href="#">前一页</a></li>    <li class="active">      <a href="#">1</a>    </li>    <li><a href="#">2</a></li>    <li><a href="#">3</a></li>    <li><a href="#">4</a></li>    <li><a href="#">后一页</a></li>  </ul> -->
	<div class="fenye">
					 <tr style="text-align: center">
					 
									 	    <td colspan="7">
							                                                                     第${list.pc }页/共${list.tp }页
									    	<a href="${pageContext.request.contextPath }/htfindbyallNotice.action?pc=${1 }">首页</a>
									    	<c:if test="${list.pc>1 }">
									    		<a href="${pageContext.request.contextPath }/htfindbyallNotice.action?pc=${list.pc-1 }">上一页</a>
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
									    	    	<a href="${pageContext.request.contextPath }/htfindbyallNotice.action?pc=${i }">${i }</a>
									    	    </c:if>
								    			<c:if test="${list.pc==i }">[${i }]</c:if>
									    	</c:forEach>
									    	<c:if test="${list.pc<list.tp }">
									    		<a href="${pageContext.request.contextPath }/htfindbyallNotice.action?pc=${list.pc+1 }">下一页</a>
									    	</c:if>
									    	<a href="${pageContext.request.contextPath }/htfindbyallNotice.action?pc=${list.tp }">尾页</a>
									 	 </td>
									 </tr>
				</div>

</div></div>
</body>
<script type="text/javascript">
	function update(id){
	    var flag = confirm("确定修改吗?");
	    if(flag){
	        window.location.href="${pageContext.request.contextPath }/htupdateNoticeForpage.action?content_id="+id;
	    }
	}
	
	function del(id){
	    var flag = confirm("确定删除吗?");
	    if(flag){
	        window.location.href="${pageContext.request.contextPath }/htdelNotice.action?content_id="+id;
	    }
	}
</script>
</html>
