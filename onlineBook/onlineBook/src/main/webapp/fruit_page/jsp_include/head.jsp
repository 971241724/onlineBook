<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
					<div id="header">
			<div class="wrapper1">
				<h1 class="logo" title="图书-首页"><a href="${pageContext.request.contextPath }/fruit_page/index.jsp"><img src="${pageContext.request.contextPath }/bookimages/booklogo01.jpg" alt="图书-首页"></a></h1>
				<div class="user-things">
					<div class="wrapper2">
						<div class="member">
						<c:choose>
							<c:when test="${sessionScope.user != null }">
								<a href="${pageContext.request.contextPath }/logoutUser.action">[注销]</a>
							</c:when>
							<c:otherwise>
								<a href="${pageContext.request.contextPath }/project/login.jsp" class="member-login">[登录]</a>&nbsp;|&nbsp;<a href="${pageContext.request.contextPath }/project/register.jsp" class="member-register">[注册]</a>
							</c:otherwise>
						</c:choose>
						
						</div>
						<div class="center-item">
							<div class="buy-car">
								<a href="#"><strong><!-- <s:action name="userCountCart" id="userCountCart"></s:action> --><s:property value="#userCountCart.countCart"/></strong>&nbsp;购物车<span>&nbsp;&nbsp;&nbsp;&nbsp;</span></a>
								<div class="drop buy-car-tip">
								    <c:choose>
								    	<c:when test="${sessionScope.cartSum>0 }">
								    		您的购物车里有<strong>${sessionScope.cartSum }</strong>件商品，<a href="${pageContext.request.contextPath }/pageSelectCart.action">去看看</a>！
								    	</c:when>
								    	<c:otherwise>
								    	    购物车中还没有商品，赶紧选购吧！
								    	</c:otherwise>
								    </c:choose>
								</div>
							</div>
							<div class="my-center">
								<a href="#">个人中心<span>&nbsp;&nbsp;&nbsp;&nbsp;</span></a>
								<div class="drop my-center-tip">
								 <c:choose>
								 	<c:when test="${sessionScope.user != null }">
								 		<ul class="my-center-signed">
										<li><a href="${pageContext.request.contextPath }/selectUsergetId.action" title="个人信息"><span>&#xe08a;</span>个人信息</a></li>
										<li><a href="${pageContext.request.contextPath }/selectUsergetId.action" title="我的订单"><span>&#xe058;</span>我的订单</a></li>
										<li><a href="${pageContext.request.contextPath }/selectUsergetId.action" title="我的评价"><span>&#xe065;</span>我的评价</a></li>
										<li><a href="${pageContext.request.contextPath }/project/forget.jsp" title="修改密码"><span>&#xe06e;</span>修改密码</a></li>
									</ul>
								 	</c:when>
								 	<c:otherwise>
								 		你好，请<a href="${pageContext.request.contextPath }/project/login.jsp"><strong class="member-login">登录</strong></a>！
								 	</c:otherwise>
								 </c:choose>
									
								
								</div>
							</div>
						</div>
					</div>
					<form name="search" action="${pageContext.request.contextPath }/findBook.action" method="post">
						<div class="search">
							<input type="text" name="book_name" class="search-content" placeholder="图书名称....">
							<input name="search-submi" class="search-submit" type="submit" value="搜索">
						</div>	
						<div class="search-tip">
							<span>热点搜索:</span>
							<a href="#">文学</a>
							<a href="#">科学</a>
							<a href="#">历史</a>
							<a href="#">人文</a>
							<a href="#">外语</a>
						</div>
					</form>
				</div>
			</div>
			<div class="clear-both"></div>
			<div class="nav">
					<ul class="wrapper1">
						<li class="nav-selected"><a href="${pageContext.request.contextPath }/selectBookNewTime.action">首页</a></li>	
						<li><a href="${pageContext.request.contextPath }/selectAllBook.action">图书商城</a></li>
						<li><a href="${pageContext.request.contextPath }/fruit_page/productslistdiscount.jsp">优惠专区</a></li>
						<li><a href="${pageContext.request.contextPath }/findbyallMessage.action">用户留言</a></li>
						<li><a href="${pageContext.request.contextPath }/findbyallNotice.action">活动公告</a></li>
						<li><a href="${pageContext.request.contextPath }/fruit_page/aboutus.jsp">关于我们</a></li>				
					</ul>
				</div>
		</div>