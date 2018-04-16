<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String path = request.getContextPath(); %>
         <%-- <%@ taglib prefix="s" uri="/struts-tags" %> --%>
         <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- saved from url=(0013)about:internet -->
	<title>在线图书-用户留言</title>
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath }/fruit_page_img/favicon.ico" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/fruit_page_css/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/fruit_page_css/jquery-ui-1.10.4.custom.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/fruit_page_css/base.css">
	<script src="${pageContext.request.contextPath }/fruit_page_js/modernizr.js"></script>
	<script src="${pageContext.request.contextPath }/fruit_page_js/jquery-1.11.0.js"></script>
	<script src="${pageContext.request.contextPath }/fruit_page_js/jquery-ui-1.10.4.custom.js"></script>
	<script src="${pageContext.request.contextPath }/fruit_page_js/jquery.validate.js"></script>
	<script src="${pageContext.request.contextPath }/fruit_page_js/jquery.form.js"></script>
	<script src="${pageContext.request.contextPath }/fruit_page_js/common.js"></script>
	<!-- 本页面加载文件 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/fruit_page_css/usermessage.css">
	<script src="${pageContext.request.contextPath }/fruit_page_js/usermessage.js"></script>
	<script type="text/javascript">
			window.location
	</script>
</head>
<body>

<%
	Object userId=request.getSession().getAttribute("userId");
%>
	<!-- progress start -->
	<div id="progress">
		<div id="progress-num">0% Loaded</div>
		<div class="progress-bar">
			<div class="progress-now"></div>
		</div>
	</div>
	<!-- progress end -->
	<!-- all-content start -->
	<div id="all-content">
		<!-- header start -->
			<jsp:include page="/fruit_page/jsp_include/head.jsp"></jsp:include>
		<!-- header end -->
		
		
		
		
		
		<!-- content start -->
		<div id="content" class="wrapper1">
			<div id="product-comment">
				<h3>留言</h3>
				<div class="product-comment-wrapper">
					<ul>
						<c:forEach items="${list.beanlist}" var="message" >
							<li>
								<div class="product-comment-flag"></div>
								<div class="product-comment-box">
									<div>
										<h4>
											&#xe065;&nbsp;&nbsp;<em class="product-comment-name">${message.message_username}</em>&nbsp;&nbsp;&nbsp;[<em class="product-comment-time">${message.message_date }</em>]
										</h4>
										<p class="product-comment-content">
											${message.message_content}
										</p>
									</div>
								</div>
							</li>
						</c:forEach>
						
						
						<!--  <li>
							<div class="product-comment-flag"></div>
							<div class="product-comment-box">
								<div>
									<h4>
										&#xe065;&nbsp;&nbsp;<em class="product-comment-name">用户名</em>&nbsp;&nbsp;&nbsp;[<em class="product-comment-time">2014-08-08 16:53:23</em>]
									</h4>
									<p class="product-comment-content">
										一些评价，一些评价一些评价，一些评价一些评价，一些评价一些评价，一些评价一些评价，一些评价一些评价，一些评价一些评价，一些评价一些评价，一些评价一些评价，一些评价一些评价，一些评价
									</p>
								</div>
							</div>
						</li>
						<li>
							<div class="product-comment-flag"></div>
							<div class="product-comment-box">
								<div>
									<h4>
										&#xe065;&nbsp;&nbsp;<em class="product-comment-name">用户名</em>&nbsp;&nbsp;&nbsp;[<em class="product-comment-time">2014-08-08 16:53:23</em>]
									</h4>
									<p class="product-comment-content">
										一些评价，一些评价一些评价，一些评价一些评价，一些评价一些评价，一些评价一些评价，一些评价一些评价，一些评价一些评价，一些评价一些评价，一些评价一些评价，一些评价一些评价，一些评价
									</p>
								</div>
							</div>
						</li>
						<li>
							<div class="product-comment-flag"></div>
							<div class="product-comment-box">
								<div>
									<h4>
										&#xe065;&nbsp;&nbsp;<em class="product-comment-name">用户名</em>&nbsp;&nbsp;&nbsp;[<em class="product-comment-time">2014-08-08 16:53:23</em>]
									</h4>
									<p class="product-comment-content">
										一些评价，一些评价一些评价，一些评价一些评价，一些评价一些评价，一些评价一些评价，一些评价一些评价，一些评价一些评价，一些评价一些评价，一些评价一些评价，一些评价一些评价，一些评价
									</p>
								</div>
							</div>
						</li>  -->
					
					
					</ul>
				</div>
				<div class="fenye">
					 <tr style="text-align: center">
									 	    <td colspan="7">
							                                                                     第${list.pc }页/共${list.tp }页
									    	<a href="${pageContext.request.contextPath }/findbyallMessage.action?pc=${1 }">首页</a>
									    	<c:if test="${list.pc>1 }">
									    		<a href="${pageContext.request.contextPath }/findbyallMessage.action?pc=${list.pc-1 }">上一页</a>
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
									    	    	<a href="${pageContext.request.contextPath }/findbyallMessage.action?pc=${i }">${i }</a>
									    	    </c:if>
								    			<c:if test="${list.pc==i }">[${i }]</c:if>
									    	</c:forEach>
									    	<c:if test="${list.pc<list.tp }">
									    		<a href="${pageContext.request.contextPath }/findbyallMessage.action?pc=${list.pc+1 }">下一页</a>
									    	</c:if>
									    	<a href="${pageContext.request.contextPath }/findbyallMessage.action?pc=${list.tp }">尾页</a>
									 	 </td>
									 </tr>
				</div>
			</div> 
			





			
			<form action="${pageContext.request.contextPath }/addMessage.action" method="post" id="messaging">
				<h3>留言板</h3>
				<s:property value="insertSuccess"/>
				<div class="comment-content-wrapper">
					<textarea name="message_content" id="message_content" placeholder="请输入你对此网站的留言！"></textarea>
				</div>
				<p class="comment-font-num">您最多可以输入<strong>400</strong>个字！</p>
				<div>
					<button id="message-submit">提交留言</button>
				</div>
			</form>
		</div>
		<!-- content end -->
		
		
		<!-- footer start -->
		
		<jsp:include page="/fruit_page/jsp_include/foot.jsp"></jsp:include>
		
		<!-- footer end -->
		
		
		
		
		
		
		<div id="back-to-top" title="返回顶部">返回顶部</div>
		<!-- dialog start -->
		<!-- 登陆框 -->
		<form action="#" id="dialog-login" method="post">
			<ol class="login-error">
				
			</ol>
			<div>
				<label for="dialog-login-user">账 号:&nbsp;&nbsp;</label><input name="user.userId" type="text" id="dialog-login-user"/>
			</div>
			<div>
				<label for="dialog-login-pass">密 码:&nbsp;&nbsp;</label><input name="user.userPassword" id="dialog-login-pass" type="password"/>
			</div>
			<div class="dialog-login-operation">
				<a href="register.jsp" title="注册">注册</a> | <a href="getpass.jsp" target="_blank" title="找回密码">忘记密码</a>
			</div>
		</form>
		<div class="loading"></div>
		<!-- dialog end -->
		<div class="screen" id="screen1"></div>
		<div class="screen" id="screen2"></div>
	</div>
	<!-- all-content end -->
</body>

</html>