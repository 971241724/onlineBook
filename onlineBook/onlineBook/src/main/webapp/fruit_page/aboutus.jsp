<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- saved from url=(0013)about:internet -->
	<title>图书商城-关于我们</title>

	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath }/fruit_page_img/favicon.ico" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/fruit_page_css/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/fruit_page_css/jquery-ui-1.10.4.custom.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/fruit_page_css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/fruit_page_css/aboutus.css">
	<script src="${pageContext.request.contextPath }/fruit_page_js/modernizr.js"></script>
	<script src="${pageContext.request.contextPath }/fruit_page_js/jquery-1.11.0.js"></script>
	<script src="${pageContext.request.contextPath }/fruit_page_js/jquery-ui-1.10.4.custom.js"></script>
	<script src="${pageContext.request.contextPath }/fruit_page_js/jquery.validate.js"></script>
	<script src="${pageContext.request.contextPath }/fruit_page_js/jquery.form.js"></script>
	<script src="${pageContext.request.contextPath }/fruit_page_js/common.js"></script>
	<!-- 本页面加载文件 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/fruit_page_css/personcenter.css">
	
</head>
<body>
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
       
		<div class="p-center-nav">
				<h2>关于我们</h2>
				<ul>
					<li><a  href="#intro"><span>&nbsp;</span>公司简介</a></li>
					<li><a href="#cultr"><span>&nbsp;</span>公司文化</a></li>
					<li><a href="#serv"><span>&nbsp;</span>服务宗旨</a></li>
					<li><a  href="#contr"><span>&nbsp;</span>联系地址</a></li>
				</ul>
			</div>
			<div class="p-center-item">
                <div id="myinfo" style="display: block;opacity: 1;filter:alpha(opacity=100);position: static;">
					
                    <span   class="jiantou"></span>
					<h2 name="intro" id="intro"><span>&#xe056;</span>公司简介</h2>	
              <div class="aboutus_content">
              
              新饶网站筹划股份无限公司成立于2007年，注册资金80湖南长沙一家专业的网站筹划公司。公司次要效劳于中小企业，提供网站筹划，网站设计制造建立，网络推行营销于一体的专业效劳。司以“专注网站，用心效劳”为中心价值，
希望经过我们的专业程和不懈努力，重塑中小企业网络抽象，为企业产品推行，文明建立传达提供效劳指点。
</div>
  <div class="aboutus_content">
三年来，新饶网站筹划不断秉承以用户需求为中心，在专注长沙本地市场开辟的同时，
为超越一百家中小企业提供网站筹划效劳，优质、用心的效劳博得了众多企业的信任和好评，在长沙地域逐步树立 
       </div>
                    
           
            <span  class="jiantou"></span>
					<h2 name="cultr" id="cultr"><span>&#xe086;</span>公司文化</h2>	
              <div class="aboutus_content">
              
              新饶网站筹划股份无限公司成立于2007年，注册资金80湖南长沙一家专业的网站筹划公司。公司次要效劳于中小企业，提供网站筹划，网站设计制造建立，网络推行营销于一体的专业效劳。司以“专注网站，用心效劳”为中心价值，
希望经过我们的专业程和不懈努力，重塑中小企业网络抽象，为企业产品推行，文明建立传达提供效劳指点。
</div>
  <div class="aboutus_content">
三年来，新饶网站筹划不断秉承以用户需求为中心，在专注长沙本地市场开辟的同时，
为超越一百家中小企业提供网站筹划效劳，优质、用心的效劳博得了众多企业的信任和好评，在长沙地域逐步树立 
       </div>
                
                
                
                
                 <span name="serv" class="jiantou"></span>
					<h2  name="serv" id="serv" ><span>&#xe078;</span>服务宗旨</h2>	
              <div class="aboutus_content">
              
              新饶网站筹划股份无限公司成立于2007年，注册资金80湖南长沙一家专业的网站筹划公司。公司次要效劳于中小企业，提供网站筹划，网站设计制造建立，网络推行营销于一体的专业效劳。司以“专注网站，用心效劳”为中心价值，
希望经过我们的专业程和不懈努力，重塑中小企业网络抽象，为企业产品推行，文明建立传达提供效劳指点。
</div>
  <div class="aboutus_content">
三年来，新饶网站筹划不断秉承以用户需求为中心，在专注长沙本地市场开辟的同时，
为超越一百家中小企业提供网站筹划效劳，优质、用心的效劳博得了众多企业的信任和好评，在长沙地域逐步树立 
       </div>
                    
                    
                    
                     <span  class="jiantou"></span>
					<h2 name="contr" id="contr"><span>&#xe081;</span>联系地址</h2>	
              <div class="aboutus_content">
              
              公司名称：fruit有限责任公司<br/>
              &nbsp;&nbsp;&nbsp;&nbsp;公司地址：安徽省**市**县**街**号<br/>
              &nbsp;&nbsp;&nbsp;&nbsp;联系电话：0000-00000000000
              </div>
 
                    
                    
                    
                                 
				</div>
			</div>
		</div>
        
        
		<!-- content end -->
		<!-- footer start -->
		<div id="footer">
			<p>
				绿活果蔬&nbsp;|&nbsp; <a href="#">关于我们</a> &nbsp;|&nbsp; <a href="#">合作伙伴</a> &nbsp;|&nbsp; <a href="#">团队介绍</a> &nbsp;|&nbsp; <a href="#">友情链接</a> &nbsp;|&nbsp; Copyright @lvhuowang.com.All Rights Reserved &nbsp; 京ICP证 080047号 &nbsp;|&nbsp; 黑公网安备9999999999号
			</p>
		</div>
		<!-- footer end -->
		<div id="back-to-top" title="返回顶部">返回顶部</div>
		
</body>
</html>