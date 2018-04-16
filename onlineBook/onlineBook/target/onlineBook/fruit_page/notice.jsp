<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%--  <%@ taglib prefix="s" uri="/struts-tags" %>  --%> 
       <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- saved from url=(0013)about:internet -->
	<title>公告栏</title>
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath }/fruit_page_img/favicon.ico" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/fruit_page_css/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/fruit_page_css/jquery-ui-1.10.4.custom.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/fruit_page_css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/fruit_page_css/notice.css">
    <script src="${pageContext.request.contextPath }/fruit_page_js/jquery-1.11.0.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/fruit_page/jsp_include/layer/layer.js"></script>
    <script src="${pageContext.request.contextPath }/fruit_page_js/showcontent.js"></script>
	<script src="${pageContext.request.contextPath }/fruit_page_js/modernizr.js"></script>
	<script src="${pageContext.request.contextPath }/fruit_page_js/jquery-ui-1.10.4.custom.js"></script>
	<script src="${pageContext.request.contextPath }/fruit_page_js/jquery.validate.js"></script>
	<script src="${pageContext.request.contextPath }/fruit_page_js/jquery.form.js"></script>
	<script src="${pageContext.request.contextPath }/fruit_page_js/common.js"></script>
	<style type="text/css">
		tr td {
	    overflow: hidden;
	    width:200px;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	    width: 220px;
		}
	</style>
	<!-- 本页面加载文件 -->
    <script>
     window.onload=function(){
         var box=document.getElementById('box');
          var input=box.getElementsByTagName('input');
          var div=box.getElementsByTagName('div');
        for(var i=0;i<input.length;i++){               
		 input[i].index=i; //input[0].index=0 index是自定义属性
          input[i].onclick=function(){
              for(var i=0;i<input.length;i++){  //循环历遍去掉button样式和把div隐藏
                 input[i].className='';  
				 div[i].style.display='none';    
				  };             
			this.className='active';  //当前按钮添加样式
              div[this.index].style.display='block';  //div显示 this.index是当前div 即div[0]之类的          
			    };
         };
       };
 </script> 
</head>
<body>
<%
	Object userId=request.getSession().getAttribute("userId");
%>
		<!-- header start -->
			<jsp:include page="/fruit_page/jsp_include/head.jsp"></jsp:include>
		<!-- header end -->
		<!-- content start -->
		 
        <div id="content" class="wrapper1">
              <!--  <button id="test1">小小提示层</button> -->
        <div> 
                <div align="center"><span id="noticeBar">最新公告栏</span></div>
                <br/>
                <div id="contentList" style="width:860px; height:500px; margin:0 auto;">
                <table id="noticelist" width="800px;" align="center">
                    <tr>
                        <td width="200px">排序</td>
                        <td width="200px">标题</td>
                        <td width="200px">内容</td>
                        <td width="200px">日期</td> 
                    </tr>
                     <tr>
                        <td colspan="4"><hr color="#ededed" size="3px"></td>
                    </tr>
                    <c:forEach items="${list.beanlist}" var="notice" varStatus="varnot">
	                    <tr >
	                        <td>${varnot.count}</td>
	                        <!--href="${pageContext.request.contextPath}/findbyidNotice.action?id=${notice.notice_id}"  -->
	                        	<td id="title" width="220px"><a class="noticetitle" ondblclick="show()">${notice.notice_title}
	                            <%-- <div class="noticeCont">
	                            	${notice.notice_content}
	                            </div> --%>
	                            </a></td>
	                        <td style="display:none">${notice.notice_id} </td>
	                        <td>${notice.notice_content} </td>
	                        <td>${notice.notice_date} </td>
	                    </tr>
                    </c:forEach>
                       
                        <tr>
										<td colspan="7">
							                                                                     第${list.pc }页/共${list.tp }页
									    	<a href="${pageContext.request.contextPath }/findbyallNotice.action?pc=${1 }">首页</a>
									    	<c:if test="${list.pc>1 }">
									    		<a href="${pageContext.request.contextPath }/findbyallNotice.action?pc=${list.pc-1 }">上一页</a>
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
									    	    	<a href="${pageContext.request.contextPath }/findbyallNotice.action?pc=${i }">${i }</a>
									    	    </c:if>
								    			<c:if test="${list.pc==i }">[${i }]</c:if>
									    	</c:forEach>
									    	<c:if test="${list.pc<list.tp }">
									    		<a href="${pageContext.request.contextPath }/findbyallNotice.action?pc=${list.pc+1 }">下一页</a>
									    	</c:if>
									    	<a href="${pageContext.request.contextPath }/findbyallNotice.action?pc=${list.tp }">尾页</a>
									 	 </td>
                    </tr>
                    </table>
            </div>
            </div>
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
                <label for="dialog-login-user">账 号:&nbsp;&nbsp;</label>
                <input name="dialog-login-user" type="text" id="dialog-login-user"/>
            </div>
        <div>
                <label for="dialog-login-pass">密 码:&nbsp;&nbsp;</label>
                <input name="dialog-login-pass" id="dialog-login-pass" type="password"/>
            </div>
    </form>
        <div class="loading"></div>
        <!-- dialog end -->
        <div class="screen" id="screen1"></div>
        <div class="screen" id="screen2"></div>
        

</body>
<script>
 $('#noticelist tr').on('click',function(){
    var id = $(this).find('td').eq(2).text();
	did=id
	}) 
function show() {
	var url = "${pageContext.request.contextPath }/findbyidNotice.action?id="+did
			layer.open({
			  type: 2,
			  area: ['600px', '400px'],
			  title: ['公告详细内容'],
			  resize : false,
			  anim: 3,
			  zIndex: layer.zIndex, //重点1
			  content: [url,'no'],
			});    
}
</script>
</html>