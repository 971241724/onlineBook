<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- saved from url=(0013)about:internet -->

	<title>优惠专区</title>
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
	<link rel="stylesheet" href="${pageContext.request.contextPath }/fruit_page_css/index.css">
	<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/fruit_page_css/productslist.css"> --%>
	<script src="${pageContext.request.contextPath }/fruit_page_js/index.js"></script>
	<script src="${pageContext.request.contextPath }/fruit_page_js/productslistdiscount.js"></script>
</head>
<%
	Object userId=request.getSession().getAttribute("userId");
	
	
%>
<%-- <s:if test="#session.userId==null">

<body data-last="<s:property value="#session.isLast"/>" data-keyword="<s:property value="keyWord"/>" data-hotLast="<s:property value="#session.hotisLast"/>" data-discountlast="<s:property value="#session.dicountisLast"/>" >
</s:if>
<s:else>

<body data-last="<s:property value="#session.isLast"/>" data-keyword="<s:property value="keyWord"/>" data-discountlast="<s:property value="#session.dicountisLast"/>" data-user="<%=userId.toString()%>">
</s:else> --%>


<body>

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
		<div id="header">
			<div class="wrapper1">

				<h1 class="logo" title="图书-首页"><a href="${pageContext.request.contextPath }/fruit_page/index.jsp"><img src="${pageContext.request.contextPath }/bookimages/booklogo01.jpg" alt="图书-首页"></a></h1>

				<div class="user-things">
					<div class="wrapper2">
						<div class="member">
						<%-- <s:if test="#session.userId!=null">
						Hi,<%=userId.toString() %>&nbsp;|&nbsp;<a href="userLogout.action">[注销]</a>
						</s:if>
						<s:else>
						<a href="javascript:void(0)" class="member-login">[登录]</a>&nbsp;|&nbsp;<a href="register.jsp" class="member-register">[注册]</a>
						</s:else>&nbsp;|&nbsp;<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;000-000-0000</span> --%>
						
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
								<a href="personcenter.jsp">个人中心<span>&nbsp;&nbsp;&nbsp;&nbsp;</span></a>
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
					<form name="search" action="findBook.action" method="get">
						<div class="search">
							<input type="text" name="keyWord" class="search-content" placeholder="图书类型....">
							<input name="search-submi" class="search-submit" type="submit" value="搜索">
						</div>	
						<div class="search-tip">
							<span>热点搜索:</span>
							<%-- <s:action name="findHotKeyWords" id="findHotKeyWords"></s:action>
							
							<s:iterator value="#findHotKeyWords.listKeyWords" id="keyWords">
							
							<a href="findVegetableByKeyWord?keyWord=<s:property value="#keyWords"/>&order=default&sort=desc&from=0"><s:property value="#keyWords"/>&nbsp;</a>
							</s:iterator> --%>
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
						<li><a href="${pageContext.request.contextPath }/selectDownSaleBook.action">优惠专区</a></li>
						<li><a href="${pageContext.request.contextPath }/findbyallMessage.action">用户留言</a></li>
						<li><a href="${pageContext.request.contextPath }/findbyallNotice.action">活动公告</a></li>
						<li><a href="${pageContext.request.contextPath }/fruit_page/aboutus.jsp">关于我们</a></li>				
					</ul>
				</div>
		</div>
		<c:choose>
			<c:when test="${downsalebook==null }">
				<div class="products-list-wrapper">
				<div id="veg-is-empty">
						<img src="${pageContext.request.contextPath }/fruit_page_img/logo.png" alt="logo"><em>对不起，没有搜索到你想要的结果！</em>
				</div>
			</c:when>
			<c:otherwise>
		<div id="content" class="wrapper1">
			<img class="slider" src="${pageContext.request.contextPath }/bookimages/book123.jpg"/>	
			<c:forEach items="${downsalebook }" var="ab">
			   		 <div class="sale-product">
						<h3><span></span>${ab.bookType_name } 
						</h3>
						<ul>
						    <c:forEach items="${ab.book }" var="b">
						    	<li>
									<a href="${pageContext.request.contextPath }/getBook_id.action?book_id=${b.book_id}" class="sale-product-photo">
										<img class="delay" src="${pageContext.request.contextPath }/fruit_page_img/delay254.gif" _src="${pageContext.request.contextPath }/${b.url}" alt="${b.book_name }"/>
										<em><img src="${pageContext.request.contextPath }/fruit_page_img/link-ico.png" alt="查看"/></em>
									</a>
									<a class="sale-product-name" href="${pageContext.request.contextPath }/getBook_id.action?book_id=${b.book_id}" title="${b.book_name }">${b.book_name }</a>
									<div class="sale-product-info">
										<!-- <span class="sale-product-discount"><strong><s:property value="#listOfEightRecommand.vegetableDiscount"/></strong>折</span> -->
										<div class="sale-product-other">
											<!-- <p class="sale-product-before">￥<s:property value="#listOfEightRecommand.vegetablePrice"/></p> -->
											<p class="sale-product-now">
												<span class="sale-product-now-price">￥${b.t_Price }</span>
												<span class="sale-product-hassaled">销量：${b.sales }</span>
											</p>
										</div>
									</div>
							    </li>
						    </c:forEach>
						</ul>
					</div>
			   </c:forEach>
		</div>
		</c:otherwise>
		</c:choose>
		<div id="footer">
			<p>
				图书商城&nbsp;|&nbsp; <a href="#">关于我们</a> &nbsp;|&nbsp; <a href="#">合作伙伴</a> &nbsp;|&nbsp; <a href="#">团队介绍</a> &nbsp;|&nbsp; <a href="#">友情链接</a> &nbsp;|&nbsp; Copyright @lvhuowang.com.All Rights Reserved &nbsp; 京ICP证 080047号 &nbsp;|&nbsp; 黑公网安备9999999999号
			</p>
		</div>
		<!-- footer end -->
		<div id="back-to-top" title="返回顶部">返回顶部</div>
		
	</div>
	<!-- all-content end -->
	
</body>
</html>