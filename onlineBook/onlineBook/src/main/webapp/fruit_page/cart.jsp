<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- saved from url=(0013)about:internet -->
	<title>图书商城-购物车</title>
	
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath }/fruit_page_img/favicon.ico" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/fruit_page_css/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/fruit_page_css/jquery-ui-1.10.4.custom.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/fruit_page_css/base.css">
	<script src="${pageContext.request.contextPath }/fruit_page_js/jquery-1.11.0.js"></script>
	<script src="${pageContext.request.contextPath }/fruit_page_js/modernizr.js"></script>
	<script src="${pageContext.request.contextPath }/fruit_page_js/jquery-ui-1.10.4.custom.js"></script>
	<script src="${pageContext.request.contextPath }/fruit_page_js/jquery.validate.js"></script>
	<script src="${pageContext.request.contextPath }/fruit_page_js/jquery.form.js"></script>
	<script src="${pageContext.request.contextPath }/fruit_page_js/common.js"></script>
	<!-- 本页面加载文件 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/fruit_page_css/cart.css">
	<script src="${pageContext.request.contextPath }/fruit_page_js/cart.js"></script>
</head>
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
				<h1 class="logo" title="图书商城-购物车"><a href="${pageContext.request.contextPath }/fruit_page/index.jsp"><img src="${pageContext.request.contextPath }/bookimages/booklogo01.jpg" alt="图书-首页"></a></h1>

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
		
		
		<!-- header end -->
		<!-- content start -->
		<div id="content" class="wrapper1">
			<h2>
				<img src="${pageContext.request.contextPath }/fruit_page_img/cartlogo.png" alt="我的购物车" class="logo"><span class="time-now"></span>
			</h2>
	        <c:choose>
	        	<c:when test="${size == 0 }">
	        		<!-- 空购物车的情况 start -->
	        		<div class="empty-cart" style="display:block;">
						<div class="empty-cart-box">
							<div class="empty-cart-logo"><img src="${pageContext.request.contextPath }/fruit_page_img/emptycart.png" alt="空的购物车"></div>
							<div class="empty-cart-go">
								<p><strong>您的购物车还是空的，赶快去挑选商品吧！</strong></p>
								<p>点击<a href="${pageContext.request.contextPath }/selectAllBook.action">继续购物</a>!</p>
							</div>
						</div>
					</div>
	        		<!-- 空购物车的情况 end -->
	        	</c:when>
	        	
	        	
	        	<c:otherwise>
	        		<!-- 购物车有商品情况 start -->
					<div class="not-empty">
						<form action="" id="mycart" name="mycart" method="get">
							<table class="cart-list" summary="购物车清单">
								<thead>
									<tr>
										<th width="100"><input class="checked-all" name="all" type="checkbox"  onclick="function checkAll()" />&nbsp;全选</th>
										<th width="350">商品</th>
										<th width="120">原价/折扣</th>
										<th width="120">现价</th>
										<th width="120">数量</th>
										<th width="120">小计</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
								    <c:forEach items="${pCart.beanlist }" var="cl">
								    	<tr>
										<input type="hidden" name="cartIds" value="${cl.cart_id }">
										<td class="cart-list-check">
											<input name="checks" type="checkbox" value="${cl.cart_id }"/>
										</td>
										<td class="cart-list-product">
											<a href="#" class="photo"><img src="${pageContext.request.contextPath }/${cl.book.url }" alt="${cl.book.book_name }"></a>
											<a href="#" class="name">${cl.book.book_name }</a>
										</td>
										
										<c:choose>
											<c:when test="${cl.book.down_sale == 1 }">
												<td class="cart-list-prv">
													<p class="prv">￥&nbsp${cl.book.price } &nbsp元</p>
													<!-- <p class="discount"><s:property value="#cart.cartVegetable.vegetableDiscount"/>折</p> -->
												</td>
											</c:when>
											<c:otherwise>
												<td class="cart-list-now">
													<strong>无折扣</strong>
												</td>
											</c:otherwise>
										</c:choose>
										
										<c:choose>
											<c:when test="${cl.book.down_sale == 1 }">
												<td class="cart-list-now">
													<strong>￥&nbsp ${cl.book.t_Price }</strong>
												</td>
											</c:when>
											<c:otherwise>
												<td class="cart-list-now">
													<strong>￥&nbsp ${cl.book.price }</strong>
												</td>
											</c:otherwise>
										</c:choose>
										
										<!-- <td class="cart-list-now">
											
										</td> -->
										
										<td class="cart-list-num">
											<input name="cartListNum" type="text"  value="${cl.amount }" min="1" max="100" />
										</td>
										<td class="cart-list-now"><!-- cart-list-total -->
											<strong>${cl.c_price }</strong>
										</td>
										<td class="cart-list-operate">
											<a href="javascript:if(confirm('确定要删除该行数据吗？'))location='${pageContext.request.contextPath }/deleteCart.action?cart_id=${cl.cart_id}'"><input type="button" value="删 除"></a>
										</td>
									</tr>
								    </c:forEach>
								    
								    <tr style="text-align: center">
									 	    <td colspan="7">
							                                第${pCart.pc }页/共${pCart.tp }页
									    	<a href="${pageContext.request.contextPath }/pageSelectCart.action?pc=${1 }">首页</a>
									    	<c:if test="${pCart.pc>1 }">
									    		<a href="${pageContext.request.contextPath }/pageSelectCart.action?pc=${pCart.pc-1 }">上一页</a>
									    	</c:if>
									    	
									    	<c:choose>
										    	<c:when test="${pCart.tp<10 }">
											    	<c:set var="begin" value="1"/>
											    	<c:set var="end" value="${pCart.tp }"/>
										    	</c:when>
										    	<c:otherwise>
										    	    <c:set var="begin" value="${pCart.pc-5 }"/>
										    	    <c:set var="end" value="${pCart.pc+4 }"/>
										    	    <c:if test="${begin<1 }">
										    	    	<c:set var="begin" value="1"/>
										    	    	<c:set var="end" value="10"/>
										    	    </c:if>
										    	    <c:if test="${end>pCart.tp }">
										    	        <c:set var="begin" value="${pCart.tp-9 }" />
										    	        <c:set var="end" value="${pCart.tp }" />
										    	    </c:if>
										    	</c:otherwise>
									    	</c:choose>
									    	<c:forEach var="i" begin="${begin }" end="${end }">
									    	    <c:if test="${pCart.pc!=i }">
									    	    	<a href="${pageContext.request.contextPath }/pageSelectCart.action?pc=${i }">${i }</a>
									    	    </c:if>
								    			<c:if test="${pCart.pc==i }">[${i }]</c:if>
									    	</c:forEach>
									    	<c:if test="${pCart.pc<pCart.tp }">
									    		<a href="${pageContext.request.contextPath }/pageSelectCart.action?pc=${pCart.pc+1 }">下一页</a>
									    	</c:if>
									    	<a href="${pageContext.request.contextPath }/pageSelectCart.action?pc=${pCart.tp }">尾页</a>
									 	 </td>
									 </tr>
								    
								</tbody>
							</table>
							<div class="cart-submit">
								<a href="${pageContext.request.contextPath }/selectSaleBook.action"><input id="cart-submit" type="button" value="查询我的订单" style="font-size: 16px;color: #669933;"></a>
								<input id="cart-submit" class="addorder" type="button" value="进入结算中心" style="font-size: 16px;color: #669933;"></a>
								<a href="${pageContext.request.contextPath }/selectAllBook.action"><input id="cart-submit" type="button" value="继续购物" style="font-size: 16px;color: #669933;"></a>
								<input id="cart-submit" class="deleAll" type="button" value="删除" style="font-size: 16px;color: #669933;">
								<!-- <p class="cart-submit-total">共有 <em>2</em> 件商品，共计：<strong></strong></p> -->
							</div>
						</form>
					</div>
					<!-- 购物车有商品情况 end -->
	        	</c:otherwise>
	        </c:choose>
			
	       
			
		</div>
		<!-- content end -->
		<!-- footer start -->
		<div id="footer">
			<p>
				图书商城&nbsp;|&nbsp; <a href="#">关于我们</a> &nbsp;|&nbsp; <a href="#">合作伙伴</a> &nbsp;|&nbsp; <a href="#">团队介绍</a> &nbsp;|&nbsp; <a href="#">友情链接</a> &nbsp;|&nbsp; Copyright @lvhuowang.com.All Rights Reserved &nbsp; 京ICP证 080047号 &nbsp;|&nbsp; 黑公网安备9999999999号
			</p>
		</div>
		
	
</body>
</html>