<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="pragma" content="no-chche">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="o">
<title>fruit管理中心</title>

<link rel="stylesheet" href="${pageContext.request.contextPath }/css/styleWeat.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/backstage_css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/backstage_css/web.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/backstage_css/jquery-ui-1.10.4.custom.css">
<script src="${pageContext.request.contextPath }/js/jquery-1.9.1.js"></script>
<script src="${pageContext.request.contextPath }/backstage_js/jquery-1.11.0.js"></script>
<script src="${pageContext.request.contextPath }/backstage_js/jquery-ui-1.10.4.custom.js"></script>
<script src="${pageContext.request.contextPath }/backstage_js/bootstrap.js"></script>
	<script >
		function custom_close(){
		if 
		(confirm("您确定要关闭本页吗？")){
		window.opener=null;
		window.open('','_self');
		window.close();
		}
		else{}
		}
	</script>
	<style type="text/css">
    	 #div01{
		    	display: none;
		    	position: absolute;
		    	top: 0px;
		    	left: 0px;
		    	width: 100%;
		    	height: 100%;
		    	background: #D0D0D0;
		    	z-index: 1001;
		    	-moz-opacity: 0.8; 
	            opacity:.80; 
	            filter: alpha(opacity=88); 
		    }
		    #div02{
		    	display: none; 
	            position: absolute; 
	            top: 25%; 
	            left: 30%; 
	            width: 50%; 
	            height: 60%; 
	            padding: 20px; 
	            border: 10px solid #CCCCCC; 
	            background-color: white; 
	            z-index:1002; 
	            overflow: auto; 
		    }
		    #gb{
		    	position: absolute;
		    	top: 145%;
		    	left: 90%;
		    }
		    #div02 div{
		        width: 90%; 
	            height: 17%; 
	            padding: 20px; 
	            border: 1px solid #E2E2E2; 
	            background-color: white;  
		    }
		    #open{
		        position: relative;
		        cursor:pointer;
		        top:0px;
		        right:45px;
		    	background: #32CAFC;
		    	width: 150px;
		    	height: 50px;
		    	float: right;
		    	border-radius:12px;
		    	-moz-border-radius:12px;
		    	-webkit-border-radius:12px;
		    	box-shadow:3px 3px 5px rgba(0,0,0,0.5);
		    	-moz-box-shadow:3px 3px 5px rgba(0,0,0,0.5);
		    	-webkit-box-shadow:3px 3px 5px rgba(0,0,0,0.5);
		    }
    </style>



</head>

<body>
<div class="navbar navbar-fixed-top">
<div class="navbar-inner">
<div class="container">
<a class="brand" href="javascript:void(0);"><img src="img/logo.png">fruit管理系统</a>
<div class="nav-collapse">
<ul class="nav">
<li ><a href="${pageContext.request.contextPath }/backstage/index_manager.jsp"><i class="icon-black icon-home"></i>首页</a></li>
<li><a href="backstage.jsp?id=1"><i class="icon-flag"></i> 操作说明</a></li>
<li><a href="backstage.jsp?id=2"><i class="icon-ok"></i>登陆</a></li>
<li><a href="#" onClick="custom_close()"><i class="icon-off"></i>退出</a></li>
<li><a href="javascript:alert('由于权限问题，你不能完成该操作');"><i class="icon-cog"></i>皮肤</a></li>
</ul>

<form class="navbar-search pull-left" action="">
          <input type="hidden" value="${weat }" id="weat">
          <input type="text" class="search-query span2" placeholder="Search">
          </form>
          <ul class="nav pull-right">
            <li><a href="fruit_page/index.jsp"  target="_blank">绿活购物</a></li>
            <li class="divider-vertical"></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">友情链接<b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="http://www.taobao.com/">淘宝购物</a></li>
                <li><a href="http://www.baidu.com/">百度搜索</a></li>
                <li><a href="http://www.sina.com.cn/">新浪首页</a></li>
                <li class="divider"></li>
                <li><a href="http://www.chineseteacher.ru/shasha/index.html">莎莎语言培训</a></li>
                <li><a href="http://nihaoma.herokuapp.com/">blog系统</a></li>
              </ul>
            </li>
          </ul>
</div>

</div>
</div>
</div>

	<div class="container" style="margin-top:50px;">

		<div id="control_bar">
			<br />
			<!--下拉菜单-->
			<!-- 折叠菜单 -->
			<div id="accordion">
				<h3>管理员信息管理模块</h3>
				<div>
					<ul>
						<li><a href="${pageContext.request.contextPath }/selectAdmin.action" target="view_show">
								管理员列表</a></li>
						<li><a href="<%=basePath%>backstage/alterpassword.jsp"
							target="view_show">修改密码</a></li>
					</ul>
				</div>
				<!-- <h3>广告管理大厅</h3>
				<div>
					<ul>
						<li><a href="getAllAd" target="view_show">查看所有广告</a></li>
					</ul>
				</div> -->

				<h3>图书管理大厅</h3>
				<div>
					<ul>
						<li><a href="${pageContext.request.contextPath }/adminSelectBook.action" target="view_show">所有图书</a></li>
						<li><a href="${pageContext.request.contextPath }/backstage/vegetableAdd.jsp" target="view_show">添加图书</a></li>
					</ul>
				</div>
				<h3>用户管理中心</h3>
				<div>
					<ul>
						<li><a href="${pageContext.request.contextPath }/adminSelectUser.action" target="view_show">查询所有顾客</a></li>
					    <li><a href="${pageContext.request.contextPath }/adminSelectSysOperateLog.action" target="view_show">日志管理</a></li>
					</ul>
				</div>

				<h3>订单信息库</h3>
				<div>
					<ul>
						<li><a href="${pageContext.request.contextPath }/findUnDealOrder.action" target="view_show">待处理订单</a></li>
						<li><a href="${pageContext.request.contextPath }/findDealedOrder.action" target="view_show">已处理订单</a></li>
						
					</ul>
				</div>
				<h3>信息交互</h3>
				<div>
					<ul>
						<li><a href="${pageContext.request.contextPath }/htfindbyallNotice.action" target="view_show">公告中心</a></li>
						<li><a href="${pageContext.request.contextPath }/htfindbyallMessage.action" target="view_show">留言中心</a></li>

					</ul>
				</div>
				<h3>amflush统计报表</h3>
				<div>
					<ul>
						<li><a href="${pageContext.request.contextPath }/bookStatement.action" target="view_show">饼状图书报表</a></li>
						<li><a href="${pageContext.request.contextPath }/bookStatementLine.action" target="view_show">线性图书报表</a></li>
						<li><a href="${pageContext.request.contextPath }/bookStatementColumnar.action" target="view_show">柱状图书报表</a></li>
					</ul>
				</div>
				<h3>echarts统计报表</h3>
				<div>
					<ul>
						<li><a href="${pageContext.request.contextPath }/echartsbookStatementPie.action" target="view_show">饼状图书报表</a></li>
						<li><a href="${pageContext.request.contextPath }/echartsbookStatementLine.action" target="view_show">线性图书报表</a></li>
						<li><a href="${pageContext.request.contextPath }/echartsbookStatementColumnar.action" target="view_show">柱状图书报表</a></li>
					</ul>
				</div>
				<h3>highcharts统计报表</h3>
				<div>
					<ul>
						<li><a href="${pageContext.request.contextPath }/highchartsbookStatement.action" target="view_show">饼状图书报表</a></li>
						<li><a href="${pageContext.request.contextPath }/highchartsbookStatementLine.action" target="view_show">线性图书报表</a></li>
						<li><a href="${pageContext.request.contextPath }/highchartsbookStatementColumnar.action" target="view_show">柱状图书报表</a></li>
					</ul>
				</div>
				<h3>Ztree树</h3>
				<div>
					<ul>
						<li><a href="${pageContext.request.contextPath }/ztreeJSP/jRoleUser.jsp" target="view_show">管理员权限</a></li>
					</ul>
				</div>
			</div>

		</div>


		<div id="view_block">
		   <div id="open">
		                &nbsp;&nbsp;
				         <c:choose>
					    	<c:when test="${weat.type eq '晴' }">
					    		<i class="icon-sun" style="font-size: 30px;color: #EC2C2C;"></i>
					    	</c:when>
					    	<c:when test="${weat.type eq '阴' }">
					    		<i class="icon-cloud" style="font-size: 30px;color: #EC2C2C;"></i>
					    	</c:when>
					    	<c:when test="${weat.type eq '多云' }">
					    		<i class="icon-cloudy3" style="font-size: 30px;color: #EC2C2C;"></i>
					    	</c:when>
					    	<c:when test="${weat.type eq '小雨' }">
					    		<i class="icon-rainy4" style="font-size: 30px;color: #EC2C2C;"></i>
					    	</c:when>
					    	<c:when test="${weat.type eq '中雨' }">
					    		<i class="icon-weather2" style="font-size: 30px;color: #EC2C2C;"></i>
					    	</c:when>
					    	<c:when test="${weat.type eq '大雨' }">
					    		<i class="icon-rainy3" style="font-size: 30px;color: #EC2C2C;"></i>
					    	</c:when>
					    	<c:when test="${weat.type eq '雨夹雪' }">
					    		<i class="icon-snowy" style="font-size: 30px;color: #EC2C2C;"></i>
					    	</c:when>
					    	<c:when test="${weat.type eq '阵雨' }">
					    		<i class="icon-rainy" style="font-size: 30px;color: #EC2C2C;"></i>
					    	</c:when>
					    	<c:when test="${weat.type eq '雷阵雨' }">
					    		<i class="icon-cloud2" style="font-size: 30px;color: #EC2C2C;"></i>
					    	</c:when>
					    	<c:otherwise>
					    		
					    	</c:otherwise>
				        </c:choose>
					    <font style="color: #FFFFFF;">
					    	${weat.type }&nbsp;&nbsp;&nbsp;
					    	${weats.city }&nbsp;&nbsp;&nbsp;
					    	${weat.high }&nbsp;&nbsp;&nbsp;
					    	${weat.low }&nbsp;&nbsp;&nbsp;
					    </font>
			</div>
			<div class="alert-block" style="border-bottom: 1px #CCCCCC solid">
				    <i class="icon-th-list"></i><strong>提示栏</strong>&nbsp;&nbsp;&nbsp;待处理订单<span
					class="badge badge-warning">4</span>&nbsp;&nbsp;顾客总数<span
					class="badge badge-success">2</span>&nbsp;&nbsp;访问量<span
					class="badge badge-info">8</span>&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="label label-important">more>></span>&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
			
			<div id="div01">
					         	
			</div>
			<div id="div02" >
			   <center>
			      <label class="label">${weats.city }天气预报</label>
			   </center>
			   <c:forEach items="${weats.data.forecast }" var="we">
			   		<div>
			   		    <table style="width: 100%;height: 100%;">
			   		        <center>
			   		    	<tr>
			   		    		<td style="width: 15%;">
			   				        ${we.date }
			   		    		</td>
			   		    		<td style="width: 10%;">
			   		    			<c:choose>
								    	<c:when test="${we.type eq '晴' }">
								    		<i class="icon-sun" style="font-size: 40px;color: #F8A21B;"></i>
								    	</c:when>
								    	<c:when test="${we.type eq '阴' }">
								    		<i class="icon-cloud" style="font-size: 40px;color: #F8A21B;"></i>
								    	</c:when>
								    	<c:when test="${we.type eq '多云' }">
								    		<i class="icon-cloudy3" style="font-size: 40px;color: #F8A21B;"></i>
								    	</c:when>
								    	<c:when test="${we.type eq '小雨' }">
								    		<i class="icon-rainy4" style="font-size: 40px;color: #F8A21B;"></i>
								    	</c:when>
								    	<c:when test="${we.type eq '中雨' }">
								    		<i class="icon-weather2" style="font-size: 40px;color: #F8A21B;"></i>
								    	</c:when>
								    	<c:when test="${we.type eq '大雨' }">
								    		<i class="icon-rainy3" style="font-size: 40px;color: #F8A21B;"></i>
								    	</c:when>
								    	<c:when test="${we.type eq '雨夹雪' }">
								    		<i class="icon-snowy" style="font-size: 40px;color: #F8A21B;"></i>
								    	</c:when>
								    	<c:when test="${we.type eq '阵雨' }">
								    		<i class="icon-rainy" style="font-size: 40px;color: #F8A21B;"></i>
								    	</c:when>
								    	<c:when test="${we.type eq '雷阵雨' }">
								    		<i class="icon-cloud2" style="font-size: 40px;color: #F8A21B;"></i>
								    	</c:when>
								    	<c:otherwise>
								    		
								    	</c:otherwise>
							        </c:choose>
			   		    		</td>
			   		    		<td style="width: 20%;">
			   		    			白天/黑夜:&nbsp;${we.type }
			   		    		</td>
			   		    		<td style="width: 30%;">
			   		    			温度:&nbsp;${we.high }&nbsp;${we.low }
			   		    		</td>
			   		    	</tr>
			   		    	<tr>
			   		    		<td colspan="4" align="center">
			   		    			<font style="color: #4693EC;">
			   		    			    风力:&nbsp;${we.fl };&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			   		    				空气质量指数:&nbsp;${we.aqi };&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			   		    				通知:&nbsp;${we.notice }
			   		    			</font>
			   		    		</td>
			   		    	</tr>
			   		    	</center>
			   		    </table>
			   		</div>
			   </c:forEach>
			   <input type="button" value="关闭" id="gb">
			</div>
			<iframe name="view_show" src="${pageContext.request.contextPath }/bookimages/gh.png"/>
		    </iframe>





		</div>
	</div>
	<!-- all-content end -->
	<script>
		$('#accordion').accordion();
	</script>
</body>
    <script type="text/javascript">
	    $("#open").click(function(){
	   	 	 $("#div01").css("display","block");
			 $("#div02").css("display","block")
	    });
	    $("#gb").click(function(){
			$("#div01").css("display","none");
			$("#div02").css("display","none");
		 });
    </script>
</html>
