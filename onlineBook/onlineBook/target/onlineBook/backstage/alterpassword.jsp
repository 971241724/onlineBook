<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<title>管理员修改密码</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/backstage_css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/backstage_css/web.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/backstage_css/jquery-ui-1.10.4.custom.css">
<script src="${pageContext.request.contextPath }/backstage_js/jquery-1.11.0.js"></script>
<script src="${pageContext.request.contextPath }/backstage_js/jquery-ui-1.10.4.custom.js"></script>
<script src="${pageContext.request.contextPath }/backstage_js/bootstrap.js"></script>
</head>

<body>
<div>
<form class="form" method="post" action="${pageContext.request.contextPath }/updateAdminPwd.action"  onsubmit="return fun()"> 
 <fieldset><legend>修改密码</legend>
 <table align="center">
 <thead><tr><td>原始密码：</td><td id="pwds"><input type="password" name="admin_pwd" class="input-xlarge" ></td></tr>
 </thead>
 <tr><td>新密码：</td><td id="n_pwd"><input type="password" name="new_pwd" name="adminPassword" class="input-xlarge"></td></tr>
 <tr><td >确认密码：</td><td id="a_pwd"><input type="password" name="affirm_pwd" class="input-xlarge"></td></tr>
 <tr><td colspan="2" style="text-align: center;">${message }</td></tr>
 <tr>
     <td colspan="2"><br/> &nbsp;
        &nbsp;
         &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  <input type="submit" class="btn btn-primary" value="提交">
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
         <input type="reset" class="btn" value="取&nbsp;&nbsp;消">
      </td>
 </tr>
 
 </table>
    </fieldset>
  
    </form>
</div>
</body>
	 <script type="text/javascript">
	 
	 	$(".input-xlarge").blur(function(){
	 		var pwd  = $("input[name='admin_pwd']").val();
	 		$.ajax({
	 			url:'selectAdminPwd.action',
	 			data:{'admin_pwd':pwd},
	 			dataType:'text',
	 			type:'post',
	 			success:function(mes){
	 				var str = "<font id='message' style='color:red;'>&nbsp&nbsp&nbsp&nbsp"+mes+"</font>";
	 				$("#message").remove();
	 				$("#pwds").append(str);
	 			}
	 		});
	 	});
	 	
	 	function fun(){
	 		var b = true;
	 		var new_pwd = $("input[name='new_pwd']").val();
	 		var affirm_pwd = $("input[name='affirm_pwd']").val();
	 		if(new_pwd==""){
	 			var str = "<font id='new_pwd' style='color:red;'>&nbsp&nbsp&nbsp&nbsp*&nbsp新密码不能为空!</font>";
 				$("#new_pwd").remove();
 				$("#n_pwd").append(str);
	 			b = false;
	 		}if(affirm_pwd==""){
	 			var str = "<font id='aff_pwd' style='color:red;'>&nbsp&nbsp&nbsp&nbsp*&nbsp确认密码不能为空!</font>";
 				$("#aff_pwd").remove();
 				$("#a_pwd").append(str);
	 			b = false;
	 		}if(new_pwd!=affirm_pwd){
	 			var str = "<font id='new_pwd' style='color:red;'>&nbsp&nbsp&nbsp&nbsp*&nbsp两次密码输入不一致!</font>";
 				$("#new_pwd").remove();
 				$("#n_pwd").append(str);
	 			b = false;
	 		}
	 		return b;
	 	}
	 	
	 	
	 </script>
</html>
 