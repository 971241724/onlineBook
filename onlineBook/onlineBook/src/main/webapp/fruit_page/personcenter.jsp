<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- saved from url=(0013)about:internet -->
	<title>图书商城-个人中心</title>
	<c:if test="${sessionScope.user == null }">
		<script>
			window.location.href="${pageContext.request.contextPath }/selectBookNewTime.action";
		</script>
	</c:if>
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
	<link rel="stylesheet" href="${pageContext.request.contextPath }/fruit_page_css/personcenter.css">
	<script src="${pageContext.request.contextPath }/fruit_page_js/sea.js"></script>
	<style type="text/css">
    	 #div01{
		    	display: none;
		    	position: absolute;
		    	top: 0px;
		    	left: 0px;
		    	width: 100%;
		    	height: 128%;
		    	background: #D0D0D0;
		    	z-index: 1001;
		    	-moz-opacity: 0.8; 
	            opacity:.80; 
	            filter: alpha(opacity=88); 
		    }
		    #div02{
		    	display: none; 
	            position: absolute; 
	            top: 35%; 
	            left: 35%; 
	            width: 35%; 
	            height: 35%; 
	            padding: 20px; 
	            border: 10px solid #CCCCCC; 
	            background-color: white; 
	            z-index:1002; 
	            overflow: auto; 
		    }
		    #div03{
		    	display: none;
		    	position: absolute;
		    	top: 0px;
		    	left: 0px;
		    	width: 100%;
		    	height: 128%;
		    	background: #D0D0D0;
		    	z-index: 1001;
		    	-moz-opacity: 0.8; 
	            opacity:.80; 
	            filter: alpha(opacity=88); 
		    }
		    #div04{
		    	display: none; 
	            position: absolute; 
	            top: 35%; 
	            left: 35%; 
	            width: 35%; 
	            height: 35%; 
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
		    #subm{
		    	position: absolute;
		    	top: 85%;
		    	left: 20%;
		    }
		    #gbs{
		    	position: absolute;
		    	top: 85%;
		    	left: 85%;
		    }
    </style>
	<script>
		$(function(){
			seajs.use('personcenter.js');
		});
	</script>
</head>
<body>
	<!-- progress start -->
	<div id="progress">
		<div id="progress-num">0% Loaded</div>
		<div class="progress-bar">
			<div class="progress-now"></div>
		</div>
	</div>
	<div id="div01">
	</div>
	<div id="div02">
	   <center>
	      <span style="color: #2C2255;"><label class="label">图书评论的详细信息</label></span>
	   </center><br/>
	   <div>
	   		<font id="evalMess"></font>
	   </div>
	   <input type="button" value="关闭" id="gb">
	</div>
	
	<div id="div03">
	</div>
	<div id="div04">
	   <!-- 评论框 -->
		<form method="post" action="">
			<input type="hidden" id="evalCoent" name="bookId"/>
			<input type="hidden" id="orderID" name="orderId"/>
			<div class="comment-content-wrapper">
				<textarea name="evalCent" id="comment-content" placeholder="请输入你对此商品的评价！"></textarea>
			</div>
			<p class="comment-font-num">您最多可以输入<strong>400</strong>个字！</p>
			<p id="comment-box-error"></p>
			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp评价分数:&nbsp&nbsp&nbsp<input type="text" id="score_eval" name="score"/>
			<input type="submit" id="subm" value="提交">
		</form>
	   <input type="button" value="关闭" id="gbs">
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
								<a href="#"><strong>&nbsp;购物车<span>&nbsp;&nbsp;&nbsp;&nbsp;</span></a>
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
			<div class="p-center-nav">
				<h2>个人中心</h2>
				<ul>
					<li><a data-hash="myinfo" href="javascript:void(0)"><span>&#xe08a;</span>我的信息</a></li>
					<li><a data-hash="myorder" href="javascript:void(0)"><span>&#xe058;</span>我的订单</a></li>
					<li><a data-hash="mycomment" href="javascript:void(0)"><span>&#xe065;</span>我的评价</a></li>
					<!-- <li><a data-hash="mypass" href="javascript:void(0)"><span>&#xe06e;</span>修改密码</a></li> -->
				</ul>
			</div>
			<div class="p-center-item">
				<!-- myinfo start -->
				<div id="myinfo">
					<span class="jiantou"></span>
					<h2><span>&#xe08a;</span>我的信息</h2>
					<div class="item-content">
						<p class="info-saysomething">
							提示：亲爱的<em><s:property value="#findUserInfoById.user.userName"/></em>，请完善您的信息，最好填写真实信息哦！
						</p>
						<p>
							<em class="info-label">用户名:</em>
							<strong>${requestScope.user.user_no }</strong>
						</p>
						<p>
							<em class="info-label">密码:</em>
							<strong>●●●●●●●●●</strong>
							<a href="${pageContext.request.contextPath }/project/forget.jsp" data-hash="mypass" class="info-alter-pass">修改密码</a>
						</p>
						<p>
							<em class="info-label">email:</em>
							<strong id="now-user-email">${requestScope.user.user_mail }</strong>
							<a href="javascript:void(0)" class="info-alter-email">修改邮箱地址</a>
						</p>
						<p>
							<em class="info-label">姓名:</em>
							<strong>${requestScope.user.user_name }</strong>
						</p>
						<p>
							<em class="info-label">电话:</em>
							<strong id="now-user-tel">${requestScope.user.user_phone }</strong>
							<a href="javascript:void(0)" class="info-alter-tel">设置默认联系电话</a>
						</p>
						<p>
							<em class="info-label">地址:</em>
							<strong id="now-user-addr">${requestScope.user.user_site }</strong>
							<a href="javascript:void(0)" class="info-alter-address">设置默认联系地址</a>
						</p>
					</div>
				</div>
				<!-- myinfo end -->
				<!-- myorder start -->
				<div id="myorder">
					<span class="jiantou"></span>
					<h2><span>&#xe058;</span>我的订单</h2>
					<!-- 没有查到相应商品 start -->
					 <div class="order-is-empty">
						<img src="${pageContext.request.contextPath }/fruit_page_img/logo.png" alt="logo"><em>对不起，您还没有订单！</em>
					</div>
					<!-- 没有查到相应商品 end -->
					<div class="item-content order-not-empty">
						<%-- <ul class="status">
							<strong>状态：</strong>
							<li class="selected"><a href="${pageContext.request.contextPath }/selectUsergetId.action" >全部</a></li>
							<li><a href="javascript:changeStatus(1)">未付款</a></li>
							<li><a href="javascript:changeStatus(2)">未确认</a></li>
							<li><a href="javascript:changeStatus(3)">未评价</a></li>
							<li><a href="javascript:changeStatus(4)">已完成</a></li>
						</ul> --%>
						
						<table class="user-order" summary="用户订单">
							<thead>
							<tr style="text-align: center;">
								<th width="200">商品</th>
								<th width="70">数量</th>
								<th width="130">总价</th>
								<th width="100">状态</th>
								<th width="100">评价状态</th>
								<th width="300">操作</th>
							</tr>
						</thead>
						<tbody id="order-tbody">
							<c:forEach items="${ou.beanlist }" var="ou">
								<tr style="text-align: center;">
								    <td style="display: none;">${ou.order_book_id }</td>
								    <td style="display: none;">${ou.order_id }</td>
									<td>${ou.order_book_name }</td>
									<td>${ou.order_number}</td>
									<td>${ou.amount }</td>
									<c:choose>
										<c:when test="${ou.order_state==1 }">
											<td>已付款</td>
										</c:when>
										<c:otherwise>
											<td>未付款</td>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${ou.access==1 }">
											<td>已评价</td>
										</c:when>
										<c:otherwise>
											<td>未评价</td>
										</c:otherwise>
									</c:choose>
									<td>
										<a href="${pageContext.request.contextPath }/deleteOrderMessage.action?order_id=${ou.order_id }"><button>删除</button></a>
										<c:if test="${ou.access==0 }">
											<button onclick="addeval(this)">评价</button>
										</c:if>
										<c:if test="${ou.order_state==0 }">
										<a href="${pageContext.request.contextPath }/alipayOrder.action?order_id=${ou.order_id }"><button>支付</button></a>
										</c:if>
									</td>
								</tr>
							</c:forEach>
							
							<tr style="text-align: center">
						 	    <td colspan="5" >
				                                第${ou.pc }页/共${ou.tp }页
						    	<a href="${pageContext.request.contextPath }/selectUsergetId.action?pcs=${1 }">首页</a>
						    	<c:if test="${ou.pc>1 }">
						    		<a href="${pageContext.request.contextPath }/selectUsergetId.action?pcs=${ou.pc-1 }">上一页</a>
						    	</c:if>
						    	
						    	<c:choose>
							    	<c:when test="${ou.tp<10 }">
								    	<c:set var="begin" value="1"/>
								    	<c:set var="end" value="${ou.tp }"/>
							    	</c:when>
							    	<c:otherwise>
							    	    <c:set var="begin" value="${ou.pc-5 }"/>
							    	    <c:set var="end" value="${ou.pc+4 }"/>
							    	    <c:if test="${begin<1 }">
							    	    	<c:set var="begin" value="1"/>
							    	    	<c:set var="end" value="10"/>
							    	    </c:if>
							    	    <c:if test="${end>ou.tp }">
							    	        <c:set var="begin" value="${ou.tp-9 }" />
							    	        <c:set var="end" value="${ou.tp }" />
							    	    </c:if>
							    	</c:otherwise>
						    	</c:choose>
						    	<c:forEach var="i" begin="${begin }" end="${end }">
						    	    <c:if test="${ou.pc!=i }">
						    	    	<a href="${pageContext.request.contextPath }/selectUsergetId.action?pcs=${i }">${i }</a>
						    	    </c:if>
					    			<c:if test="${ou.pc==i }">[${i }]</c:if>
						    	</c:forEach>
						    	<c:if test="${ou.pc<ou.tp }">
						    		<a href="${pageContext.request.contextPath }/selectUsergetId.action?pcs=${ou.pc+1 }">下一页</a>
						    	</c:if>
						    	<a href="${pageContext.request.contextPath }/selectUsergetId.action?pcs=${ou.tp }">尾页</a>
						 	 </td>
						 </tr>
						 
						</tbody>
						</table>
						<ol class="pagination">
						</ol>
					</div>
				</div>
				<!-- myorder end -->

				<div id="mycomment">
					<span class="jiantou"></span>
					<h2><span>&#xe065;</span>我的评价</h2>
					
					<c:choose>
						<c:when test="${size == 0 }">
						    <!-- 没有查到相应商品 start -->
							<div class="comment-is-empty">
								<img src="${pageContext.request.contextPath }/fruit_page_img/logo.png" alt="logo"><em>对不起，没有相关评价！</em>
							</div>
							<!-- 没有查到相应商品 end -->
						</c:when>
						<c:otherwise>
							<div class="comment-not-empty">
							<div class="item-content">
								<ul class="comment-wrapper">
								</ul>
								<table class="user-order" summary="用户订单">
									<thead>
										<tr>
											<th width="260">商品名称</th>
											<th width="300">评价内容</th>
											<th width="170">评价时间</th>
											<th width="70">评价分数</th>
											<th width="150">操作</th>
										</tr>
								    </thead>
								    <tbody id="order-tbody">
								    	<c:forEach items="${page.beanlist }" var="bl">
								    		<tr style="text-align: center">
								    		    <td style="display: none;"><input type="hidden" value="${bl.eval_content }"></td>
								    			<td>${bl.book.book_name }</td>
								    			<c:choose>
													<c:when test="${fn:length(bl.eval_content)>6}">
														<td>${fn:substring(bl.eval_content, 0, 6)}...</td>
									                </c:when>
													<c:otherwise><td>${bl.eval_content}</td></c:otherwise>
												</c:choose>
								    			<%-- <td>${bl.eval_content }</td> --%>
								    			<td><fmt:formatDate value="${bl.eval_time }" pattern="yyyy/MM/dd  HH:mm:ss" /></td>
								    			<td>${bl.eval_score }</td>
								    			<td><a href="${pageContext.request.contextPath }/deleteEvalID.action?eval_id=${bl.eval_id}">删除</a><button onclick="fun(this)">评价详细信息</button></td>
								    		</tr>
								    	</c:forEach>
								    	<tr style="text-align: center">
										 	    <td colspan="5">
								                                第${page.pc }页/共${page.tp }页
										    	<a href="${pageContext.request.contextPath }/selectUsergetId.action?pc=${1 }">首页</a>
										    	<c:if test="${page.pc>1 }">
										    		<a href="${pageContext.request.contextPath }/selectUsergetId.action?pc=${page.pc-1 }">上一页</a>
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
										    	    	<a href="${pageContext.request.contextPath }/selectUsergetId.action?pc=${i }">${i }</a>
										    	    </c:if>
									    			<c:if test="${page.pc==i }">[${i }]</c:if>
										    	</c:forEach>
										    	<c:if test="${page.pc<page.tp }">
										    		<a href="${pageContext.request.contextPath }/selectUsergetId.action?pc=${page.pc+1 }">下一页</a>
										    	</c:if>
										    	<a href="${pageContext.request.contextPath }/selectUsergetId.action?pc=${page.tp }">尾页</a>
										 	 </td>
										 </tr>
									</tbody>
								</table>
								<ol class="pagination">
								</ol>
							</div>
						</div>
						</c:otherwise>
					</c:choose>
					</div>
					
					
					

				<!-- mypass start -->
				<div id="mypass">
					<span class="jiantou"></span>
					<h2><span>&#xe06e;</span>修改密码</h2>
					<div class="item-content">
						<form id="alter-pass" action="" method="post">
							<input type="hidden" name="user.userId" value="<s:property value="#session.userId"/>"/>
							<ol class="alter-error"></ol>
							<div>
								<label for="alter-pre-pass">密&nbsp;&nbsp;&nbsp;码：&nbsp;&nbsp;</label><input type="password" class="alter-pass-text" id="alter-pre-pass" name="prepass" title="请输入原始密码！"/>&nbsp;&nbsp;<span></span>
							</div>
							<div>
								<label for="alter-new-pass">新密码：&nbsp;&nbsp;</label><input type="password" class="alter-pass-text" id="alter-new-pass" name="user.userPassword" title="请输入新密码，字数不得少于6位！"/>&nbsp;&nbsp;<span></span>
							</div>
							<div>
								<label for="alter-pass-con">确&nbsp;&nbsp;&nbsp;认：&nbsp;&nbsp;</label><input type="password" class="alter-pass-text" id="alter-pass-con" name="pass-con" title="请确认您所填写的密码！"/>&nbsp;&nbsp;<span></span>
							</div>
							<div>
								<input id="alter-pass-submit" type="submit" value="确认修改"/>
							</div>
						</form>
					</div>
				</div>
				<!-- mypass end -->
			</div>
		</div>
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
		<!-- 修改框 -->
		<form id="info-alter-box" method="post" action="${pageContext.request.contextPath }/updateMail.action">
			<label for="alter-input"></label>
			<input type="text" autocomplete="off" id="alter-input" name="">
			<p id="info-alter-error"></p>
		</form>

		
		<div class="loading"></div>
		<!-- dialog end -->
		<div class="screen" id="screen1"></div>
		<div class="screen" id="screen2"></div>
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
	     
	   function addeval(obj){
		   $("#div03").css("display","block");
		   $("#div04").css("display","block");
		   var o = $(obj).parent().parent();
		   var str = o.children(":eq(0)").text();
		   $("#evalCoent").val(str);
		   var strs = o.children(":eq(1)").text();
		   $("#orderID").val(strs);
		  /*  alert(strs);
		   alert($("#orderID").val()); */
		   /* alert(content); */
		  /*  $.ajax({
			   url:'addEval.action',
			   data:{'book_id':str,},
		   }); */
	   };
	   
	   $("#subm").click(function(){
		   var content = $("textarea[name='evalCent']").val();
		   var book_id = $("#evalCoent").val();
		   var score = $("input[name='score']").val();
		   var order_id = $("#orderID").val();
		  /*  alert(order_id); */
		   var zz = '[1-9]|10';
		   if(score.match(zz)){
			   $.ajax({
				   url:'addEval.action',
				   data:{'book_id':book_id,'eval_content':content,'eval_score':score,'order_id':order_id},
				   dataType:'text',
				   type:'post',
				   success:function(mes){
					   alert(mes);
					   location.href="selectUsergetId.action?pc=1&pcs=1"
				   }
			   });
		   }else{
			   alert("评分应在0--10之间！");
		   }
	   })
	   
	   $("#gbs").click(function(){
			$("#div03").css("display","none");
			$("#div04").css("display","none");
	   });
	</script>
</html>

							    			