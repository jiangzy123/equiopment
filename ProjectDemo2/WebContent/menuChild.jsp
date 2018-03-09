<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>权限规定菜单</title>
<link href="css/zTreeStyle/zTreeStyle.css" rel="stylesheet" />
<link href="css/menuChild.css" rel="stylesheet" />
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/plug-in.min.js"></script>
<script type="text/javascript" src="js/jquery.ztree.core.min.js"></script>
</head>
<body>
	<%
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
				+ path + "/";
	%>
	<div class="header">
		<div class="logo">
			<h2>设备保修系统</h2>
			</div>
	</div>
	
		<div class="content">
			<div class="left">
			<ul id="treeDemo" class="ztree"></ul>
		</div>
		<div class="right">
			<iframe src="brandList.do" name="main" id="main" class="main"
				onload="initFrameHeight()"></iframe>
				
			</div>
	</div>

</body>
<script type="text/javascript">
	var setting = {
		data : {
			simpleData : {
				enable : true
			}
		}
	};
	var zNodes = [ {
		id : 1,
		pId : 0,
		name : "用户管理",
		open : true
	}, {
		id : 11,
		pId : 1,
		name : "用户管理",
		url : "list.action"
	}, {
		id : 12,
		pId : 1,
		name : "角色管理",
		url : "list.action"
	}, {
		id : 13,
		pId : 1,
		name : "菜单管理",
		url : "list.action"
	},

	{
		id : 2,
		pId : 0,
		name : "设备管理"
	}, {
		id : 21,
		pId : 2,
		name : "设备分类管理",
		url : "list.action"
	}, {
		id : 22,
		pId : 2,
		name : "设备品牌管理",
		url : "list.action"
	}, {
		id : 23,
		pId : 2,
		name : "设备信息管理",
		url : "list.action"
	}, {
		id : 24,
		pId : 2,
		name : "办公地址管理",
		url : "list.action"
	}, {
		id : 24,
		pId : 2,
		name : "设备分配",
		url : "list.action"
	}, {
		id : 3,
		pId : 0,
		name : "故障单管理"
	}, {
		id : 31,
		pId : 3,
		name : "故障申报",
		url : "list.action"
	}, {
		id : 32,
		pId : 3,
		name : "故障单查询",
		url : "list.action"
	}, {
		id : 33,
		pId : 3,
		name : "故障单处理",
		url : "list.action"
	}, {
		id : 4,
		pId : 0,
		name : "统计功能"
	}, {
		id : 41,
		pId : 4,
		name : "故障分类统计",
		url : "list.action"
	}, {
		id : 42,
		pId : 4,
		name : "维修成本趋势图",
		url : "list.action"
	}, {
		id : 43,
		pId : 4,
		name : "维修费用月度统计",
		url : "list.action"
	}, ];
	$(document).ready(function() {
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
	});
	
	function initFrameHeight(){
		
		var main = document.getElementById("main");
		var frameHeight = frames['main'].document.body.scrollHeight;
		main.style.height = frameHeight +"px";
	}

</script>
</html>