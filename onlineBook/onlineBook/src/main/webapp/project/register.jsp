<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/reg.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/styles.css" type="text/css"></link>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.js"></script>
</head>
<body>
	<div class="reg">
  	    	<h1 style="color: #52668c">用户注册</h1>
  	    	<form action="${pageContext.request.contextPath }/insertUser.action" method="post" onsubmit="return fun()">
	  	    	<table class="table">
		  	    	<tr align="center" class="active">
		  	    		<td><i class="icon-user" style="font-size: 35px;"></i></td>
		  	    		<td><input name="user_nol" id="u_nos" type="text" class="form-control" placeholder="账号"></td>
		  	    	</tr>
		  	    	<tr align="center" class="active">
		  	    		<td><i class="icon-user" style="font-size: 35px;"></i></td>
		  	    		<td><input name="name" id="name" type="text" class="form-control" placeholder="姓名"></td>
		  	    	</tr>
		  	    	<tr align="center" class="active">
		  	    		<td><i class="icon-lock" style="font-size: 35px;"></i></td>
		  	    		<td><input name="user_pwdl" id="u_pwd" type="password" class="form-control" placeholder="密码"></td>
		  	    	</tr>
		  	    	<tr align="center" class="active">
		  	    		<td><i class="icon-checkbox-checked" style="font-size: 35px;"></i></td>
		  	    		<td><input name="cfpasswordl"  id="u_cpwd" type="password" class="form-control" placeholder="确认密码"></td>
		  	    	</tr>
		  	    	<tr align="center" class="active">
		  	    		<td><i class="icon-mobile" style="font-size: 35px;"></i></td>
		  	    		<td><input name="user_phonell" id="u_phone" type="text" class="form-control" placeholder="电话号码"></td>
		  	    	</tr>
		  	    	<tr align="center" class="active">
		  	    		<td><i class="icon-envelop" style="font-size: 35px;"></i></td>
		  	    		<td><input name="user_maill" id="u_mail" type="text" class="form-control" placeholder="邮箱"></td>
		  	    	</tr>
		  	    	<tr align="center" class="active">
		  	    		<td><i class="icon-shield" style="font-size: 35px;"></i></td>
		  	    		<td><input name="codel" id="codel" type="text" class="form-control" placeholder="验证码"></td>
		  	    	</tr>
		  	    	<tr align="center" class="active">
		  	    		<td colspan="2">
		  	    			<input type="submit" class="btn btn-default" value="注册" style="width: 150px">
		  	    		 	<span id="u11"><img src="${pageContext.request.contextPath }/code.action" id="code" onmouseover="changex(this)" onclick="changeCode(this)" alt="获取验证码" title="点击更换" /></span>
		  	    		</td>
		  	    	</tr>
		  	    	<c:if test="${requestScope.rmessage!=null }">
			  	    	<tr align="center" class="active">
			  	    		<td colspan="2">${requestScope.rmessage }<font style="color: red;" id="loginNo"></font></td>
			  	    	</tr>
			  	    </c:if>
	  	    	</table>
  	    	</form>
  	    	<a href="${pageContext.request.contextPath }/project/login.jsp" id="login">登录</a>
  	 </div>
  	 <div class="slideshow">
			<div class="slideshow-image" style="background-image: url('${pageContext.request.contextPath }/images/1.jpg')"></div>
			<div class="slideshow-image" style="background-image: url('${pageContext.request.contextPath }/images/2.jpg')"></div>
			<div class="slideshow-image" style="background-image: url('${pageContext.request.contextPath }/images/3.jpg')"></div>
			<div class="slideshow-image" style="background-image: url('${pageContext.request.contextPath }/images/4.jpg')"></div>
	 </div>
</body>
     <script type="text/javascript">
        
  		$("#u_nos").blur(function(){
  			var u_nol = $("input[name='user_nol']").val();
  			/* alert(u_nol); */
  			$.ajax({
  				url:"${pageContext.request.contextPath }/loginNo.action",
  				data:{"user_no":u_nol},
  				type:"post",
  				success:function(mes){
  					$(".log").css("display","none");
  		  			$(".reg").css("display","block");
  		  			$(".forget").css("display","none");
  		  			$("#loginNo").html(mes);
  				}
  			})
  		});
  		
  		function fun(){
    	      var b=true;
    	      var no=document.getElementById("u_nos").value;
    	      /* alert(no); */
    		  var pwd=document.getElementById("u_pwd").value;
    		  var cpwd=document.getElementById("u_cpwd").value;
    		  var phone=document.getElementById("u_phone").value;
    		  var mail=document.getElementById("u_mail").value;
    		  var code=document.getElementById("codel").value;
    		  var name=document.getElementById("name").value;
    		  if(no==""){
    		     b=false;
    		     var str="<font style='color:red;font-size:10px;'>账号不能为空!</font>";
    		     document.getElementById("loginNo").innerHTML=str;
    		  }
    		  if(!/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,10}$/.test(no)){
     			 b=false;
      		     var str="<font style='color:red;font-size:10px;'>账号必须由6-12位的字符和数字组成!</font>";
      		     document.getElementById("loginNo").innerHTML=str;
     		  }
    		  if(pwd==""){
    		     b=false;
    		     var str="<font style='color:red;font-size:10px;'>密码不能为空!</font>";
    		     document.getElementById("loginNo").innerHTML=str;
    		  }
    		  if(!/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,10}$/.test(pwd)){
    			 b=false;
     		     var str="<font style='color:red;font-size:10px;'>密码必须由6-12位的字符和数字组成!</font>";
     		     document.getElementById("loginNo").innerHTML=str;
    		  }
            if(cpwd==""){
    		     b=false;
    		     var str="<font style='color:red;font-size:10px;'>确认密码不能为空!</font>";
    		     document.getElementById("loginNo").innerHTML=str;
    		  }
            if(phone==""){
     		     b=false;
     		     var str="<font style='color:red;font-size:10px;'>手机号不能为空!</font>";
     		     document.getElementById("loginNo").innerHTML=str;
     		  }
            if(!/^1[3|4|5|7|8][0-9]{9}$/.test(phone)){
   			 	 b=false;
    		     var str="<font style='color:red;font-size:10px;'>手机号格式不正确!</font>";
    		     document.getElementById("loginNo").innerHTML=str;
   		    }
            if(mail==""){
     		     b=false;
     		     var str="<font style='color:red;font-size:10px;'>邮箱不能为空!</font>";
     		     document.getElementById("loginNo").innerHTML=str;
     		}
            if(!/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/.test(mail)){
  			 	 b=false;
	   		     var str="<font style='color:red;font-size:10px;'>邮箱格式不正确!</font>";
	   		     document.getElementById("loginNo").innerHTML=str;
  		    }
            if(code==""){
      		     b=false;
      		     var str="<font style='color:red;font-size:10px;'>验证码不能为空!</font>";
      		     document.getElementById("loginNo").innerHTML=str;
      	  }
            if(pwd!=cpwd){
          	  b=false;
     		     var str="<font style='color:red;font-size:10px;'>两次密码输入不一致!</font>";
     		     document.getElementById("loginNo").innerHTML=str;
            }
            if(name==""){
            	  b=false;
       		     var str="<font style='color:red;font-size:10px;'>姓名不能为空!</font>";
       		     document.getElementById("loginNo").innerHTML=str;
             }
    		  return b;
    	} 
  		
  		function changeCode(obj){
			obj.src="${pageContext.request.contextPath }/code.action?id="+Math.random();
		}
		function changex(obj){
			obj.style.cursor="pointer";
		}
		
    </script>
</html>