<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
    <link rel="stylesheet" href="css/changPwd.css" type="text/css"></link>
	<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"></link>
	<link rel="stylesheet" href="css/style.css" type="text/css"></link>
	<link rel="stylesheet" href="css/styles.css" type="text/css"></link>
	<script type="text/javascript" src="js/jquery-1.8.2.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
</head>
<body>
 	    <div class="upUser">
 	    <h1 style="color: #52668c">修改密码</h1>
    	<form action="updatePwd.action" method="post">
	    	<table class="table">
 	    	<tr align="center" class="active">
 	    		<td><i class="icon-user" style="font-size: 35px;"></i></td>
 	    		<td><input name="user_no" type="text" class="form-control" placeholder="账号"></td>
 	    	</tr>
 	    	
 	    	<tr align="center" class="active">
 	    		<td><i class="icon-lock" style="font-size: 35px;"></i></td>
 	    		<td><input name="user_pwd" type="mail" class="form-control" placeholder="密码"></td>
 	    	</tr>
 	    	<tr align="center" class="active">
 	    		<td><i class="icon-checkbox-checked" style="font-size: 35px;"></i></td>
 	    		<td><input name="cfpassword" type="text" class="form-control" placeholder="密码确认"></td>
 	    	</tr>
 	    	<tr align="center" class="active">
		  	    		<td colspan="2">
		  	    			<input type="submit" id="suer" class="btn btn-default" value="确定" style="width: 150px">
		  	    		</td>
		  	</tr>
 	    	<c:if test="${requestScope.message!=null }">
	  	    	<tr align="center" class="active">
	  	    		<td colspan="2"><font style="color: red;" id="mess">${requestScope.message }</font></td>
	  	    	</tr>
  	        </c:if>
	    	</table>
    	</form>
    </div>
 	    
	<div class="slideshow">
		<div class="slideshow-image" style="background-image: url('images/1.jpg')"></div>
		<div class="slideshow-image" style="background-image: url('images/2.jpg')"></div>
		<div class="slideshow-image" style="background-image: url('images/3.jpg')"></div>
		<div class="slideshow-image" style="background-image: url('images/4.jpg')"></div>
	</div>
		
  </body>
  
  <script type="text/javascript">
        $(".upUser").css("display","block");
  		/* $(".upUser").css("display","block");
  		var  user_no = $("input[name='user_no']");
  		var  user_pwd = $("input[name='user_pwd']")
  		var  cfpassword = $("input[name='cfpassword']")
  		$("#suer").click(function(){
  			$.ajax({
  				url:"updatePwd.action",
  				data:{'user_no':user_no,'user_pwd':user_pwd,'cfpassword':cfpassword},
  				type:"post",
  				success:function(mes){
  					
  				}
  			})
  		}) */
  </script>
</html>