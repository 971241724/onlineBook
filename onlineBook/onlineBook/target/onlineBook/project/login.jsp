<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/login.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/reg.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/forget.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/styles.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css"></link>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.js"></script>
</head>
<body>
    <div class="log">
  	    	<h1 style="color: #52668c">用户登录</h1>
  	    	<form action="${pageContext.request.contextPath }/selectUser.action" method="post">
	  	    	<table class="table">
		  	    	<tr align="center" class="active">
		  	    		<td><i class="icon-user" style="font-size: 35px;"></i></td>
		  	    		<td><input name="user_no" type="text" class="form-control" placeholder="账号"></td>
		  	    	</tr>
		  	    	<tr align="center" class="active">
		  	    		<td><i class="icon-lock" style="font-size: 35px;"></i></td>
		  	    		<td><input name="user_pwd" type="password" class="form-control" placeholder="密码"></td>
		  	    	</tr>
		  	    	<tr align="center" class="active">
		  	    		<td><i class="icon-shield" style="font-size: 35px;"></i></td>
		  	    		<td><input name="user_code" type="text" class="form-control" placeholder="验证码"></td>
		  	    	</tr>
		  	    	<tr align="center" class="active">
		  	    		<td colspan="2">
		  	    			<input type="submit" class="btn btn-default" value="登录" style="width: 150px">
		  	    		 	<span id="u11"><img src="${pageContext.request.contextPath }/code.action" id="code" onmouseover="changex(this)" onclick="changeCode(this)" alt="获取验证码" title="点击更换" /></span>
		  	    		</td>
		  	    	</tr>
		  	    	<c:if test="${requestScope.message!=null }">
			  	    	<tr align="center" class="active">
			  	    		<td colspan="2" align="center"><font style="color: red;">${requestScope.message }</font></td>
			  	    	</tr>
			  	    </c:if>
	  	    	</table>
  	    	</form>
  	    	<a href="${pageContext.request.contextPath }/project/forget.jsp" id="forget">忘记密码|</a>
  	    	<a href="${pageContext.request.contextPath }/project/register.jsp" onclick="register()"  id="reg">|注册</a><!--   -->
  	    </div>
  	    
  	    <%-- <div class="reg">
  	    	<h1 style="color: #52668c">用户注册</h1>
  	    	<form action="insertUser.action" method="post" onsubmit="return fun()">
	  	    	<table class="table">
		  	    	<tr align="center" class="active">
		  	    		<td><i class="icon-user" style="font-size: 35px;"></i></td>
		  	    		<td><input name="user_nol" id="u_no" type="text" class="form-control" placeholder="账号"></td>
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
		  	    	<c:if test="${requestScope.message!=null }">
		  	    	<tr align="center" class="active">
		  	    		<td colspan="2"><font style="color: red;" id="loginNo"></font></td>
		  	    	</tr>
			  	    </c:if>
	  	    	</table>
  	    	</form>
  	    	<a href="#" id="login">登录</a>
  	 </div> --%>
  	    
  	    <%-- <div class="forget">
  	    	<h1 style="color: #52668c">忘记密码</h1>
  	    	<form action="forgetpwd.action" method="post">
	  	    	<table class="table">
		  	    	<tr align="center" class="active">
		  	    		<td><i class="icon-user" style="font-size: 35px;"></i></td>
		  	    		<td><input name="user_no" type="text" class="form-control" placeholder="账号"></td>
		  	    	</tr>
		  	    	<tr align="center" class="active">
		  	    		<td><i class="icon-mobile" style="font-size: 35px;"></i></td>
		  	    		<td><input name="user_phone" type="phone" class="form-control" placeholder="手机号"></td>
		  	    	</tr>
		  	    	<!-- <tr align="center" class="active">
		  	    		<td><i class="icon-envelop" style="font-size: 35px;"></i></td>
		  	    		<td><input name="user_mail" type="mail" class="form-control" placeholder="邮箱"></td>
		  	    	</tr> -->
		  	    	<tr align="center" class="active">
		  	    		<td><i class="icon-shield" style="font-size: 35px;"></i></td>
		  	    		<td><input name="phone_code" type="text" class="form-control" placeholder="验证码"></td>
		  	    	</tr>
		  	    	<tr align="center" class="active">
		  	    		<td colspan="2">
		  	    			<input type="submit" class="btn btn-default" value="确定" style="width: 150px">
		  	    			&nbsp&nbsp&nbsp&nbsp
		  	    		 	<span id="u11"><a id="getPhone">获取手机验证码</a></span>
		  	    		</td>
		  	    	</tr>
		  	    	<c:if test="${requestScope.message!=null }">
			  	    	<tr align="center" class="active">
			  	    	    <td></td>
			  	    		<td><font style="color: red;" id="mess">${requestScope.message }</font></td>
			  	    	</tr>
			  	    </c:if>
	  	    	</table>
  	    	</form>
  	    	<a href="#" id="logins">登录</a>
  	    </div> --%>
  	    
		<div class="slideshow">
			<div class="slideshow-image" style="background-image: url('${pageContext.request.contextPath }/images/1.jpg')"></div>
			<div class="slideshow-image" style="background-image: url('${pageContext.request.contextPath }/images/2.jpg')"></div>
			<div class="slideshow-image" style="background-image: url('${pageContext.request.contextPath }/images/3.jpg')"></div>
			<div class="slideshow-image" style="background-image: url('${pageContext.request.contextPath }/images/4.jpg')"></div>
		</div>
		
  </body>
  
  <script type="text/javascript">
	    $(function(){ 
	    	$(".log").css("display","block");
		}); 
  		/* $("#reg").click(function(){
  			$(".log").css("display","none");
  			$(".forget").css("display","none");
  			$(".reg").css("display","block");
  		}); */
  		/* $("#login").click(function(){
  			$(".log").css("display","block");
  			$(".reg").css("display","none");
  			$(".forget").css("display","none");
  		});
  		$("#forget").click(function(){
  			$(".log").css("display","none");
  			$(".reg").css("display","none");
  			$(".forget").css("display","block");
  		});
  		$("#logins").click(function(){
  			$(".log").css("display","block");
  			$(".reg").css("display","none");
  			$(".forget").css("display","none");
  		});
  		
  		$("#getPhone").click(function(){
  			var str = $("input[name='user_phone']").val();
  			$.ajax({
  				url:"phoneCodes.action",
  				data:{"user_phone":str},
  				type:"post",
  				success:function(mes){
  					$(".log").css("display","none");
  		  			$(".reg").css("display","none");
  		  			$(".forget").css("display","block");
  		  			alert(mes);
  		  			 var s = "<font>"+mes+"</font>";
  		  			$("#mess").html(mes); 
  				}
  			})
  		}); */
  	
  		/* $("#u_no").blur(function(){
  			var u_nol = $("input[name='user_nol']").val();
  			$.ajax({
  				url:"loginNo.action",
  				data:{"user_no":u_nol},
  				type:"post",
  				success:function(mes){
  					$(".log").css("display","none");
  		  			$(".reg").css("display","block");
  		  			$(".forget").css("display","none");
  		  			$("#loginNo").html(mes);
  				}
  			})
  		}); */
  		
  		/* function fun(){
  	      var b=true;
  	      var no=document.getElementById("u_no").value;
  	      alert(no);
  		  var pwd=document.getElementById("u_pwd").value;
  		  var cpwd=document.getElementById("u_cpwd").value;
  		  var phone=document.getElementById("u_phone").value;
  		  var mail=document.getElementById("u_mail").value;
  		  var code=document.getElementById("codel").value;
  		  if(no==""){
  		     b=false;
  		     var str="<font style='color:red;font-size:10px;'>账号不能为空!</font>";
  		     document.getElementById("loginNo").innerHTML=str;
  		  }
  		  if(pwd==""){
  		     b=false;
  		     var str="<font style='color:red;font-size:10px;'>密码不能为空!</font>";
  		     document.getElementById("loginNo").innerHTML=str;
  		  }
          if(cpwd==""){
  		     b=false;
  		     var str="<font style='color:red;font-size:10px;'>确认密码不能为空!</font>";
  		     document.getElementById("loginNo").innerHTML=str;
  		  }
          if(phone==""){
   		     b=false;
   		     var str="<font style='color:red;font-size:10px;'>确认密码不能为空!</font>";
   		     document.getElementById("loginNo").innerHTML=str;
   		  }
          if(mail==""){
   		     b=false;
   		     var str="<font style='color:red;font-size:10px;'>确认密码不能为空!</font>";
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
  		  return b;
  		} */
  		
  		
  		/* function fun(){
  			var b = true;
  			var no = $("input[name='user_nol']").val();
  			var pwd = $("input[name='user_pwdl']").val();
  			var cpwd = $("input[name='cfpasswordl']").val();
  			var phone = $("input[name='user_phonell']").val();
  			var mail = $("input[name='user_maill']").val();
  			alert(no);
  			if(no==""){
  				$(".log").css("display","none");
	  			$(".reg").css("display","block");
	  			$(".forget").css("display","none");
  				b = false;
  				var str = "<font style='color:red;font-size:10px;'>账号不能为空</font>"
  				$("#loginNo").html(mes);
  			}
  			return b;
  		} */
  		
  		function changeCode(obj){
			obj.src="${pageContext.request.contextPath }/code.action?id="+Math.random();
		}
		function changex(obj){
			obj.style.cursor="pointer";
		}
		
  </script>
</html>