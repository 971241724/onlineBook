<%@ page language="java" contentType="text/html; charset="
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/forget.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/styles.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css"></link>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.js"></script>
</head>
<body>
	<div class="forget">
  	    	<h1 style="color: #52668c">忘记密码</h1>
  	    	<form action="${pageContext.request.contextPath }/forgetpwd.action" method="post" onsubmit="return func()">
	  	    	<table class="table">
		  	    	<tr align="center" class="active">
		  	    		<td><i class="icon-user" style="font-size: 35px;"></i></td>
		  	    		<td><input name="user_no" id="user_no" type="text" class="form-control" placeholder="账号"></td>
		  	    	</tr>
		  	    	<tr align="center" class="active">
		  	    		<td><i class="icon-mobile" style="font-size: 35px;"></i></td>
		  	    		<td><input name="user_phone" id="user_phone" type="phone" class="form-control" placeholder="手机号"></td>
		  	    	</tr>
		  	    	<!-- <tr align="center" class="active">
		  	    		<td><i class="icon-envelop" style="font-size: 35px;"></i></td>
		  	    		<td><input name="user_mail" type="mail" class="form-control" placeholder="邮箱"></td>
		  	    	</tr> -->
		  	    	<tr align="center" class="active">
		  	    		<td><i class="icon-shield" style="font-size: 35px;"></i></td>
		  	    		<td><input name="phone_code" id="phone_code" type="text" class="form-control" placeholder="验证码"></td>
		  	    	</tr>
		  	    	<tr align="center" class="active">
		  	    		<td colspan="2">
		  	    			<input type="submit" class="btn btn-default" value="确定" style="width: 150px">
		  	    			&nbsp&nbsp&nbsp&nbsp
		  	    		 	<span id="u11"><a id="getPhone">获取手机验证码</a></span>
		  	    		</td>
		  	    	</tr>
		  	    	<%-- <c:if test="${requestScope.message!=null }"> --%>
		  	    	<tr align="center" class="active">
		  	    		<td colspan="2"><font id="mess" style="color: red;">${requestScope.message }</font></td>
		  	    	</tr>
			  	    <%-- </c:if> --%>
	  	    	</table>
  	    	</form>
  	    	<a href="${pageContext.request.contextPath }/project/login.jsp" id="logins">登录</a>
  	    </div>
  	    
		<div class="slideshow">
			<div class="slideshow-image" style="background-image: url('${pageContext.request.contextPath }/images/1.jpg')"></div>
			<div class="slideshow-image" style="background-image: url('${pageContext.request.contextPath }/images/2.jpg')"></div>
			<div class="slideshow-image" style="background-image: url('${pageContext.request.contextPath }/images/3.jpg')"></div>
			<div class="slideshow-image" style="background-image: url('${pageContext.request.contextPath }/images/4.jpg')"></div>
		</div>
 </body>
 <script type="text/javascript">
    
     function func(){
	      var b=true;
	      var user_no=document.getElementById("user_no").value;
		  var user_phone=document.getElementById("user_phone").value;
		  var phone_code=document.getElementById("phone_code").value;
		  if(user_no==""){
		     b=false;
		     var str="<font style='color:red;font-size:10px;'>账号不能为空!</font>";
		     document.getElementById("mess").innerHTML=str;
		  }
		  if(user_phone==""){
		     b=false;
		     var str="<font style='color:red;font-size:10px;'>手机号不能为空!</font>";
		     document.getElementById("mess").innerHTML=str;
		  }
	      if(phone_code==""){
		     b=false;
		     var str="<font style='color:red;font-size:10px;'>验证码不能为空!</font>";
		     document.getElementById("mess").innerHTML=str;
		  }
		  return b;
    } 
 
    $("#getPhone").click(function(){
		var str = $("input[name='user_phone']").val();
		$.ajax({
			url:"${pageContext.request.contextPath }/phoneCodes.action",
			data:{"user_phone":str},
			type:"post",
			success:function(mes){
				$(".log").css("display","none");
	  			$(".reg").css("display","none");
	  			$(".forget").css("display","block");
	  			alert(mes);
	  			/* var s = "<font>"+mes+"</font>";
	  			$("#mess").html(mes); */
			}
		})
	 });
 
 
 </script>
</html>