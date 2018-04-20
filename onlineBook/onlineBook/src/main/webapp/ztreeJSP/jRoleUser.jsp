<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
	<title></title>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath }/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css" />

	<script type="text/javascript" src="${pageContext.request.contextPath }/zTree/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/zTree/js/jquery.ztree.core-3.5.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/zTree/js/jquery.ztree.excheck-3.5.min.js"></script>	

	<script type="text/javascript">
		var zTreeObj;
		var setting = {
			check : {
				enable : true,
				chkboxType : { "Y" : "", "N" : "" }	//两个空实现了选择和取消选择时是否级联选择
			},
			data : {
				simpleData : {
					enable : true
				}
			},
			callback: {
				onCheck: onCheck
			}
		};
		
		$(document).ready(function() {
			$.ajax( {
				url : "${pageContext.request.contextPath }/ztree.action",
				type : "get",
				dataType : "text",
				success : initZtree
			});
		});
		
		function initZtree(data) {
			var zNodes = eval("(" + data + ")");	//将一个字符串转换为javascript对象
			zTreeObj = $.fn.zTree.init($('#jkTree'), setting, zNodes);	//jkTree 树的id，支持多个树
			zTreeObj.expandAll(true);		//展开所有树节点
			
			//遍历，形成ids集合，否则就必须从后台带入选择过的值
			onCheck();
		}
		
		//获取所有选择的节点，提交时调用下面函数
		function onCheck() {
			var nodes = new Array();
			nodes = zTreeObj.getCheckedNodes(true);		//取得选中的结点
			var v = "";
			for (i = 0; i < nodes.length; i++) {
				v += nodes[i].id + ",";
			}
			if (v.length > 0 ) v = v.substring(0, v.length-1);
			$('#userIds').attr("value", v);		//将拼成串写入页面的userIds的隐藏域中
		}
	</script>
</head>

<body>
<form name="icform" method="post">
	<%-- <input type="hidden" name="id" value="${id}"/>
	<input type="text" id="userIds" name="userIds"/> --%>

<div id="menubar">
<div id="middleMenubar">
<div id="innerMenubar">
 <!--  <div id="navMenubar">
	<ul>
	<li id="save"><a href="#" onclick="formSubmit('roleAction_saveRoleUser','_self');this.blur();">保存</a></li>
	<li id="back"><a href="#" onclick="history.go(-1);return false;this.blur();">返回</a></li>
	</ul>
  </div> -->
</div>
</div>
</div>
   
  <div class="textbox-title">
	<!-- <img src="../../staticfile/skin/default/images/icon/currency_yen.png"/>
   设置用户 -->
  </div> 
  
<div>

<div>  
	<ul id="jkTree" class="ztree"></ul>  
</div>
 
</div>
 
 
</form>
</body>
</html>

 