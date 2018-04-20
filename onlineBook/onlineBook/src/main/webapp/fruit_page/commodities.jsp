<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- saved from url=(0013)about:internet -->
	<title>具体产品名</title>
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
	<link rel="stylesheet" href="${pageContext.request.contextPath }/fruit_page_css/commodities.css">
	<script src="${pageContext.request.contextPath }/fruit_page_js/commodities.js"></script>
     <style type="text/css">
    	 #div01{
		    	display: none;
		    	position: absolute;
		    	top: 0px;
		    	left: 0px;
		    	width: 100%;
		    	height: 280%;
		    	background: #D0D0D0;
		    	z-index: 1001;
		    	-moz-opacity: 0.8; 
	            opacity:.80; 
	            filter: alpha(opacity=88); 
		    }
		    #div02{
		    	display: none; 
	            position: absolute; 
	            top: 150%; 
	            left: 25%; 
	            width: 30%; 
	            height: 40%; 
	            padding: 20px; 
	            border: 10px solid #CCCCCC; 
	            background-color: white; 
	            z-index:1002; 
	            overflow: auto; 
		    }
		    #gb{
		    	position: absolute;
		    	top: 85%;
		    	left: 85%;
		    }
		    table tr td{
	            border: 3px solid #CCCCCC;
	            text-align: center;
			}
			table tr th{
	            border: 3px solid #CCCCCC;
	            text-align: center;
			}
    </style>
</head>


<body>
     
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
								<a href="#"><strong></strong>&nbsp;购物车<span>&nbsp;&nbsp;&nbsp;&nbsp;</span></a>
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
	<!-- header end -->
	<!-- content start -->
	<!-- <s:action name="findVegetablesByCat" id="listOfCat">
		<s:param value="vegetable.vegetableCatagory" name="vegetableCatagory"></s:param>
	
	</s:action> -->
	<c:choose>
		<c:when test="${book != null }">
				<div id="content" class="wrapper1">
				<!-- 上部分 start -->
				<div class="product-info-top">
					<!-- 同类商品 start -->
					<div class="same-product-aside">
						<h3><span></span><em>&nbsp;&nbsp;&nbsp;&nbsp;同类商品&nbsp;&nbsp;&nbsp;&nbsp;</em></h3>
						<!-- 只有三个 -->
						<!-- <s:iterator value="#listOfCat.listOfCat" id="listOfCat">
						<a class="same-product-one">
							<div class="same-product-name">
								<s:property value="#listOfCat.vegetableName"/>
							</div>
							<div class="same-product-price">￥<s:text name="global.format.number"> <s:param value="#listOfCat.vegetablePrice*#listOfCat.vegetableDiscount/10"></s:param></s:text></div>
							<div class="same-product-discuont"><s:property value="#listOfCat.vegetableDiscount"/>折</div>
							<div class="same-product-hassaled">
								销量：<strong><s:property value="#listOfCat.vegetableSaleCount"/></strong>
							</div>
						</a>
						</s:iterator> -->
						<c:forEach items="${bLB }" var="blb">
							<a class="same-product-one">
							<div class="same-product-name">
								${blb.book_name }
							</div>
							<div class="same-product-price">￥${blb.price }</div>
							<!-- <div class="same-product-discuont"><s:property value="#listOfCat.listOfCat.get(1).vegetableDiscount"/>折</div> -->
							<div class="same-product-hassaled">
								销量：<strong>${blb.sales }</strong>
							</div>
						</a>	
						</c:forEach>
						<!-- <a class="same-product-one">
							<div class="same-product-name">
								<s:property value="#listOfCat.listOfCat.get(1).vegetableName"/>
							</div>
							<div class="same-product-price">￥100</div>
							<div class="same-product-discuont"><s:property value="#listOfCat.listOfCat.get(1).vegetableDiscount"/>折</div>
							<div class="same-product-hassaled">
								销量：<strong>1000</strong>
							</div>
						</a>	
						<a class="same-product-one">
							<div class="same-product-name">
								<s:property value="#listOfCat.listOfCat.get(2).vegetableName"/>
							</div>
							<div class="same-product-price">￥<s:property value="#listOfCat.listOfCat.get(2).vegetablePrice"/></div>
							<div class="same-product-discuont"><s:property value="#listOfCat.listOfCat.get(2).vegetableDiscount"/>折</div>
							<div class="same-product-hassaled">
								销量：<strong><s:property value="#listOfCat.listOfCat.get(2).vegetableSaleCount"/></strong>
							</div>
						</a> -->
					</div>
					<!-- 同类商品 end -->
					<!-- 简介 start -->
					<div class="product-info">
						<!-- 照片 start -->
						<div class="product-info-photos">
							<div id="slider-show">
								<ul class="slider">
		
									<li style="display:block; "><img src="${pageContext.request.contextPath }/${book.url}" alt="ad1"></li>
									<li><img src="${pageContext.request.contextPath }/${book.url}" alt="ad2"></li>
									<%-- <li><img src="${pageContext.request.contextPath }/fruit_page_img/products03.jpg" alt="ad3"></li>
									<li><img src="${pageContext.request.contextPath }/fruit_page_img/products04.jpg" alt="ad4"></li> --%>
		
									<div class="move-cross"><img  alt=""></div>
								</ul>
								<ul class="control">
									
									
									<li class="control-selected first-control"><img src="${pageContext.request.contextPath }/${book.url}"/>" alt=""></li>
									
									<c:forEach items="${bLB }" var="blb">
										<li class="control-selected first-control"><img src="${pageContext.request.contextPath }/${blb.url}"/>" alt=""></li>
									</c:forEach>
									
									<%-- <s:iterator value="vegetable.vegetablePicAddr" begin="3" end="5" id="st" >
									<li><img src="<s:property value="st"/>" alt=""></li>
									
									
									</s:iterator> --%>
									
									<%-- <li><img src="/fruit<s:property value="vegetable.vegetablePicAddr.get(3).toString()"/>" alt=""></li>
									<li><img src="/fruit<s:property value="vegetable.vegetablePicAddr.get(4).toString()"/>" alt=""></li>
									<li><img src="/fruit<s:property value="vegetable.vegetablePicAddr.get(5).toString()"/>" alt=""></li> --%>
								</ul>
								<div class="product-info-photos-big">
									<img  alt="big">
								</div>
							</div>
						</div>
						<!-- 照片 end -->
						<!-- 购买框 start -->
						<div class="product-info-price">
							<h2><s:property value="vegetable.vegetableName"/></h2>
							<div class="product-info-price-num">
							    <c:choose>
							    	<c:when test="${book.down_sale==1 }">
							    		<p class="present-price">
											<span class="label" style="color: black;">现价：</span>
											<strong style="color: black;">${book.t_Price } 元</strong>
											<!-- <span class="discount"><s:property value="vegetable.vegetableDiscount"/>折</span> -->
										</p>
							    	</c:when>
							    	<c:otherwise>
							    		<p class="present-price">
											<span class="label" style="color: black;">现价：</span>
											<strong style="color: black;">${book.price } 元</strong>
											<!-- <span class="discount"><s:property value="vegetable.vegetableDiscount"/>折</span> -->
										</p>
							    	</c:otherwise>
							    </c:choose>
								
								<c:if test="${book.down_sale==1 }">
									<p class="pre-price">
									<span class="label" style="color: black;">原价：</span>
									<strong style="color: black;">￥${book.price } 元</strong>
									</p>
								</c:if>
							</div>
							<div class="product-counte">
								<div class="product-hassaled">
									<div class="product-counte-num">${book.sales }&nbsp本</div>
									<div class="product-label">销量</div>
								</div>
								<!-- <div class="product-comment">
									<div class="product-counte-num"><s:property value="vegetable.vegetableCommentCount"/></div>
									<div class="product-label">评价</div>
								</div> -->
								<div class="product-state">
									<div class="product-counte-num" id="book_stock">${book.stock }&nbsp</div>
									<div class="product-label">库存</div>
								</div>
							</div>
							<form action="addShopCart.action" name="product-buy" method="post" id="product-buy" onsubmit="return shopBook()">
								
								<input type="hidden" value="${book.book_id }" name="book_id" id="vegetable-id">
								<div>
									<label for="product-buy-num">购买数量：</label><input id="product-buy-num" class="score" name="amount" min='1' value='1' />
								</div>
								<div>
								    <c:choose>
								    	<c:when test="${user == null }">
								    		<a href="${pageContext.request.contextPath }/project/login.jsp">请先登录</a>
								    	</c:when>
								    	<c:otherwise><!-- class="add-cart" -->
								    		<input type="submit" value="加入购物车">
								    	</c:otherwise>
								    </c:choose>
								</div>
							</form>
						</div>
						<!-- 购买框 end -->
					</div>
					<!-- 简介 end -->
					<div class="clear-both"></div>
				</div>
			<!-- 上部分 end -->
			<!-- 底部 start -->
					
				<div class="product-info-bottom">
						<div class="hot-product-aside">
							<h3>热销人气商品<a href="#">more +</a></h3>
							<div class="hot-product-aside-wrapper">
								<%-- <s:iterator value="#listOfSale.listOfSale" id="listOfSale">
								<a class="hot-product-one">
									<img src="<s:property value="#listOfSale.vegetablePicAddr.get(2)"/>" alt="" title="<s:property value="#listOfSale.vegetableName"/>">
									<div class="hot-product-one-info">
										<em>￥<s:text name="global.format.number"> <s:param value="#listOfSale.vegetablePrice*#listOfSale.vegetableDiscount/10"></s:param></s:text></em>
										<strong>销量：<s:property value="#listOfSale.vegetableSaleCount"/></strong>
									</div>
								</a>
								<br/>
								</s:iterator> --%>
								
								<c:forEach items="${bLB }" var="blb">
									<a class="same-product-one">
									    <a href="${pageContext.request.contextPath }/getBook_id.action?book_id=${blb.book_id}">
									    	<img src="${pageContext.request.contextPath }/${blb.url }" alt="${blb.book_name }" title="${blb.book_name }">
									    </a>
									    <div class="hot-product-one-info">
										<em>￥${blb.price }元</em>
										<strong>销量：${blb.sales }</strong>
									    </div>
									
										<%-- <div class="same-product-name">
											${blb.book_name }
										</div>
										<div class="same-product-price">￥${blb.price }</div>
										<!-- <div class="same-product-discuont"><s:property value="#listOfCat.listOfCat.get(1).vegetableDiscount"/>折</div> -->
										<div class="same-product-hassaled">
											销量：<strong>${blb.sales }</strong>
										</div> --%>
									</a>	
								</c:forEach>
								
								<%-- <a class="hot-product-one">
									<img src="/fruit<s:property value="#listOfSale.listOfSale.get(0).vegetablePicAddr"/>" alt="" title="<s:property value="#listOfSale.listOfSale.get(0).vegetableName"/>">
									<div class="hot-product-one-info">
										<em>￥<s:property value="#listOfSale.listOfSale.get(0).vegetablePrice"/></em>
										<strong>销量：<s:property value="#listOfSale.listOfSale.get(0).vegetableSaleCount"/></strong>
									</div>
								</a>
								<a class="hot-product-one">
									<img src="/fruit<s:property value="#listOfSale.listOfSale.get(1).vegetablePicAddr"/>" alt="" title="<s:property value="#listOfSale.listOfSale.get(1).vegetableName"/>">
									<div class="hot-product-one-info">
										<em>￥<s:property value="#listOfSale.listOfSale.get(1).vegetablePrice"/></em>
										<strong>销量：<s:property value="#listOfSale.listOfSale.get(1).vegetableSaleCount"/></strong>
									</div>
								</a>
								<a class="hot-product-one">
									<img src="/fruit<s:property value="#listOfSale.listOfSale.get(2).vegetablePicAddr"/>" alt="" title="<s:property value="#listOfSale.listOfSale.get(2).vegetableName"/>">
									<div class="hot-product-one-info">
										<em>￥<s:property value="#listOfSale.listOfSale.get(2).vegetablePrice"/></em>
										<strong>销量：<s:property value="#listOfSale.listOfSale.get(2).vegetableSaleCount"/></strong>
									</div>
								</a>
								<a class="hot-product-one">
									<img src="img/same3.jpg" alt="" title="产品名称">
									<div class="hot-product-one-info">
										<em>￥165</em>
										<strong>销量：45</strong>
									</div>
								</a>
								<a class="hot-product-one">
									<img src="img/same01.jpg" alt="" title="产品名称">
									<div class="hot-product-one-info">
										<em>￥165</em>
										<strong>销量：45</strong>
									</div>
								</a> --%>
							</div>
						</div>
			            <!-- 详情和评论  start-->
						<div id="detail-and-comment">
							<ul>
								<li><a href="#product-detail">商品详情</a></li>
								<li><a href="#product-comment">买家评价</a></li>
							</ul>
						<!-- 详情 start -->
							<div id="product-detail"><!-- ${pageContext.request.contextPath }/${book.url} -->
								<img src="${pageContext.request.contextPath }/fruit_page_img/delay850.gif" _src="${pageContext.request.contextPath }/${book.url}"/>
							</div>
						<!-- 详情 end -->
						<!-- 评论 start-->
							<div id="product-comment">
								 <c:choose>
										 	<c:when test="${!page.beanlist.isEmpty() }">
										 		<div class="comment-not-empty">
												<h3>评价</h3>
												<div class="product-comment-wrapper">
													<ul>
													</ul>
													<ol class="pagination">
												 	</ol>
												 	<table style="">
														<thead>
															<tr>
															    <th width="100">用户名</th>
																<th width="200">商品名称</th>
																<th width="200">评价内容</th>
																<th width="170">评价时间</th>
																<th width="70">评价分数</th>
																<th width="150">操作</th>
															</tr>
													    </thead>
													    <tbody id="order-tbody">
													    	<c:forEach items="${page.beanlist }" var="bl">
													    		<tr>
													    		    <td style="display: none;"><input type="hidden" value="${bl.eval_content }"></td>
													    		    <td>${bl.user.user_no }</td>
													    			<td>${bl.book.book_name }</td>
													    			<c:choose>
																		<c:when test="${fn:length(bl.eval_content)>6}">
																			<td>${fn:substring(bl.eval_content, 0, 6)}...</td>
														                </c:when>
																		<c:otherwise><td>${bl.eval_content}</td></c:otherwise>
																	</c:choose>
													    			<td><fmt:formatDate value="${bl.eval_time }" pattern="yyyy/MM/dd  HH:mm:ss" /></td>
													    			<td>${bl.eval_score }</td>
													    			<td><button onclick="fun(this)">显示详细评价</button></td>
													    		</tr>
													    	</c:forEach>
													    	<tr style="text-align: center">
															 	    <td colspan="6">
													                                第${page.pc }页/共${page.tp }页
															    	<a href="${pageContext.request.contextPath }/getBook_id.action?book_id=${book.book_id }&pc=${1 }">首页</a>
															    	<c:if test="${page.pc>1 }">
															    		<a href="${pageContext.request.contextPath }/getBook_id.action?book_id=${book.book_id }&pc=${page.pc-1 }">上一页</a>
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
															    	    	<a href="${pageContext.request.contextPath }/getBook_id.action?book_id=${book.book_id }&pc=${i }">${i }</a>
															    	    </c:if>
														    			<c:if test="${page.pc==i }">[${i }]</c:if>
															    	</c:forEach>
															    	<c:if test="${page.pc<page.tp }">
															    		<a href="${pageContext.request.contextPath }/getBook_id.action?book_id=${book.book_id }&pc=${page.pc+1 }">下一页</a>
															    	</c:if>
															    	<a href="${pageContext.request.contextPath }/getBook_id.action?book_id=${book.book_id }&pc=${page.tp }">尾页</a>
															 	 </td>
															 </tr>
														</tbody>
													</table>
												</div>
										</div>
								 	</c:when>
								 	<c:otherwise>
								 	<!-- 没有查到相应商品 start -->
							 			<div class="comment-not-empty">
											<img src="${pageContext.request.contextPath }/bookimages/nonentity.jpg">
									    </div>
								    <!-- 没有查到相应商品 end -->
								 	</c:otherwise>
								 </c:choose>
							</div>
						<!-- 评论 end-->
						</div>
			<!-- 详情和评论 end -->
				</div>
			<!-- 底部 end -->
			</div>
		</c:when>
		<c:otherwise>
		    <div class="products-list-wrapper">
				<!-- 产品列表 start -->
				<div class="products-list">
					<div id="veg-is-empty">
							<img src="${pageContext.request.contextPath }/bookimages/myBook.gif" alt="logo"><em>对不起，没有搜索到你想要的书籍！</em>
					</div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
	<!-- content end -->
	<!-- footer start -->
	<div id="footer">
		<p>
			图书商城&nbsp;|&nbsp; <a href="#">关于我们</a> &nbsp;|&nbsp; <a href="#">合作伙伴</a> &nbsp;|&nbsp; <a href="#">团队介绍</a> &nbsp;|&nbsp; <a href="#">友情链接</a> &nbsp;|&nbsp; Copyright @lvhuowang.com.All Rights Reserved &nbsp; 京ICP证 080047号 &nbsp;|&nbsp; 黑公网安备9999999999号
		</p>
	</div>
	<!-- footer end -->
	<div id="back-to-top" title="返回顶部">返回顶部</div>
	<!-- dialog start -->
	<div class="loading"></div>
	<!-- dialog end -->
	<div class="screen" id="screen1"></div>
	<div class="screen" id="screen2"></div>
	
	<div id="div01">
	</div>
	<div id="div02">
	   <center>
	      <label class="label">图书评论的详细信息</label>
	   </center>
	   <div>
	   		<font id="evalMess"></font>
	   </div>
	   <input type="button" value="关闭" id="gb">
	</div>
	
</body>
	<script type="text/javascript">
         function fun(obj){
        	 $("#div01").css("display","block");
 			 $("#div02").css("display","block");
 			 var o = $(obj).parent().parent();
 			 var str = o.children(":eq(0)").children().val();
 			 $("#evalMess").html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+str);
         }
         $("#gb").click(function(){
 			$("#div01").css("display","none");
 			$("#div02").css("display","none");
 		 });
         
         function shopBook(){
        	 var b = true;
        	 var str = $("input[name='amount']").val()
        	 if(!/^\d+$/.test(str)){
        		 alert("销量不是整数！");
        		 b = false;
        		 return b;
        	 }else{
        		 var st = $("#book_stock").text();
        		 if(parseInt(str)>parseInt(st)){
        			 b = false;
        			 alert("库存量仅为"+st+"本图书！");
        			 return b;
        		 }
        	 }
        	
         }
         
    </script>
</html>