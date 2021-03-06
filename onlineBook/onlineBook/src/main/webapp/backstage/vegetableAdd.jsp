<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<title>添加图书</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/backstage_css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/backstage_css/web.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/backstage_css/jquery-ui-1.10.4.custom.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/jquery-easyui-1.5/themes/material/easyui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/jquery-easyui-1.5/themes/icon.css">
<script src="${pageContext.request.contextPath }/backstage_js/jquery-1.11.0.js"></script>
<script src="${pageContext.request.contextPath }/backstage_js/jquery-ui-1.10.4.custom.js"></script>
<script src="${pageContext.request.contextPath}/jquery-easyui-1.5/jquery.min.js"></script>  
<script src="${pageContext.request.contextPath}/jquery-easyui-1.5/jquery.easyui.min.js"></script>
<script src="${pageContext.request.contextPath}/jquery-easyui-1.5/jquery.easyui.min.js"></script>
<script src="${pageContext.request.contextPath}/jquery-easyui-1.5/locale/easyui-lang-zh_CN.js"></script>
<script src="${pageContext.request.contextPath }/backstage_js/bootstrap.js"></script>
</head>

<body>
<div class="main">
    <table class="table table-bordered">
        <caption>
        <strong>填写图书基本信息</strong>
        </caption>
        <tr>
             <td><form action="${pageContext.request.contextPath}/adminAddBook.action" method="post" class="form-horizontal" onsubmit="return func()">
                    名称：
		     <input type="text" name="book_name" class="input-small" id="b_name" />
		                 &nbsp;&nbsp;&nbsp;&nbsp;    价格：
		     <input type="text" name="price" class="input-mini"  />
		                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    折扣价格：
             <input type="text" name="t_Price" class="input-mini" value="0.0"/>
		                &nbsp;&nbsp;    类别：      
		     <input type="text" name="book_type" class="input-small"  />      
		     <br/>   
		     出版日期：
    <input type="text" name="datetime" class="easyui-datebox"   />
  &nbsp;&nbsp; 
            <%--  是否推荐：
  
     是<input type="radio" name="vegetable.isRecommend"  data-value="<s:property value="vegetable.isRecommend"/>" value="1"/>
   否<input type="radio" name="vegetable.isRecommend"  value="0"/>          --%>
   &nbsp;&nbsp; 
   销量：
     &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<input type="text" name="sales" class="input-mini" />
  &nbsp;&nbsp;    
                    库存：
    <input type="text" name="stock" class="input-mini" />
  &nbsp;&nbsp;    
                    <br/>
                    <br/>
                    <!-- 关键字：
   <input type="text" name="vegetable.vegetableKeyWords" class="input-medium" value="" /> (以英文逗号隔开) &nbsp;&nbsp;          
       介绍信息：
  <textarea name="vegetable.vegetableInfo" class="textarea"><s:property value="vegetable.vegetableInfo"/></textarea> -->
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>
                  
                    <input type="submit" value="提交"  class="btn-primary">
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style="color: red;">${message }</font>
                </form></td>
        </tr>
        <tr><td id="mess" style="text-align: center;display: none;"></td></tr>
    </table>
    <table class="table table-bordered">
        <caption>
        <strong>附加图片页</strong>
        </caption>
        <tr>
            <td>商品图片</td>
            <td><form action="${pageContext.request.contextPath}/bookAddImage.action?book_id=${book_id}" method="post" enctype="multipart/form-data"> 
                    <%-- <input type="hidden" name="book_id" value="${book.book_id }"> --%>
                    <input type="file" name="potos"/>
                    <input type="submit" value="提交" class="btn-mini btn-primary">
                </form>
                <br/><font style="color: red;">${mes }</font>
                </td>
            <td></td>
        </tr>
    </table>
</div>
</div>
</body>
	<script type="text/javascript">
		function func(){
	 		var b = true;
	 		var book_name = $("#b_name").val();
	 		var price = $("input[name='price']").val();
	 		var book_type = $("input[name='book_type']").val();
	 		var datetime = $("input[name='datetime']").val();
	 		var sales = $("input[name='sales']").val();
	 		var stock = $("input[name='stock']").val();
	 		var t_Price = $("input[name='t_Price']").val();
	 		if(book_name==""){
	 			var str = "<font id='mes' style='color:red;'>&nbsp&nbsp&nbsp&nbsp*&nbsp图书名称不能为空!</font>";
				$("#mess").css("display","block");
	 			$("#mes").remove();
				$("#mess").append(str);
	 			b = false;
	 		}if(price==""){
	 			var str = "<font id='mes' style='color:red;'>&nbsp&nbsp&nbsp&nbsp*&nbsp价格不能为空!</font>";
	 			$("#mess").css("display","block");
	 			$("#mes").remove();
				$("#mess").append(str);
	 			b = false;
	 		}if(!/^\d+(\.\d{1,2})?$/.test(price)){
	    		var str = "<font id='mes' style='color:red;'>&nbsp&nbsp&nbsp&nbsp*&nbsp图书价格必须为数字!</font>";
	 			$("#mess").css("display","block");
	 			$("#mes").remove();
				$("#mess").append(str);
	 			b = false;
    	    }if(book_type==""){
	 			var str = "<font id='mes' style='color:red;'>&nbsp&nbsp&nbsp&nbsp*&nbsp图书类别不能为空!</font>";
	 			$("#mess").css("display","block");
	 			$("#mes").remove();
				$("#mess").append(str);
	 			b = false;
	 		}if(datetime==""){
	 			var str = "<font id='mes' style='color:red;'>&nbsp&nbsp&nbsp&nbsp*&nbsp出版日期不能为空!</font>";
	 			$("#mess").css("display","block");
	 			$("#mes").remove();
				$("#mess").append(str);
 			    b = false;                                     
 		    }if(!/^\d{4}-(((0(1|3|5|7|8))|(1(0|2)))(-((0[1-9])|([1-2][0-9])|(3[0-1])))?)|(((0(2|4|6|9))|(11))(-((0[1-9])|([1-2][0-9])|(30)))?)|((02)(-((0[1-9])|([1-2][0-9])))?)$/.test(datetime)){
	    		var str = "<font id='mes' style='color:red;'>&nbsp&nbsp&nbsp&nbsp*&nbsp日期格式不正确!</font>";
	 			$("#mess").css("display","block");
	 			$("#mes").remove();
				$("#mess").append(str);
	 			b = false;
    	    }if(sales==""){
	 			var str = "<font id='mes' style='color:red;'>&nbsp&nbsp&nbsp&nbsp*&nbsp销量不能为空!</font>";
	 			$("#mess").css("display","block");
	 			$("#mes").remove();
				$("#mess").append(str);
 				b = false;
 			}if(!/^\d+$/.test(sales)){
	    		var str = "<font id='mes' style='color:red;'>&nbsp&nbsp&nbsp&nbsp*&nbsp销量必须为数字!</font>";
	 			$("#mess").css("display","block");
	 			$("#mes").remove();
				$("#mess").append(str);
	 			b = false;
    	    }if(stock==""){
	 			var str = "<font id='mes' style='color:red;'>&nbsp&nbsp&nbsp&nbsp*&nbsp库存量不能为空!</font>";
	 			$("#mess").css("display","block");
	 			$("#mes").remove();
				$("#mess").append(str);
 				b = false;
 	        }if(!/^\d+$/.test(stock)){
	    		var str = "<font id='mes' style='color:red;'>&nbsp&nbsp&nbsp&nbsp*&nbsp库存量必须为数字!</font>";
	 			$("#mess").css("display","block");
	 			$("#mes").remove();
				$("#mess").append(str);
	 			b = false;
    	    }
 			if(t_Price==""){
	 			var str = "<font id='mes' style='color:red;'>&nbsp&nbsp&nbsp&nbsp*&nbsp如果没有折扣价格折扣价为0.0!</font>";
	 			$("#mess").css("display","block");
	 			$("#mes").remove();
				$("#mess").append(str);
 				b = false;
 	        }if(!/^\d+(\.\d{1,2})?$/.test(t_Price)){
	    		var str = "<font id='mes' style='color:red;'>&nbsp&nbsp&nbsp&nbsp*&nbsp图书折扣价格必须为数字!</font>";
	 			$("#mess").css("display","block");
	 			$("#mes").remove();
				$("#mess").append(str);
	 			b = false;
    	    }
	 		return b;
	 	}
	</script>
</html>