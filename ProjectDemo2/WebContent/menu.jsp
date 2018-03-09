<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ztree-menu</title>
<link href="css/zTreeStyle/zTreeStyle.css" rel="stylesheet" />
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/plug-in.min.js"></script>
<script type="text/javascript" src="js/jquery.ztree.core.min.js"></script>
</head>
<body>
		<div class="left">
			<ul id="treeDemo" class="ztree"></ul>
		</div>
		<div class="right">
			<iframe src="brandList.do" name="main" id="main" class="main"
				onload="initFrameHeight()"></iframe>
		</div>
</body>
<script type="text/javascript">
function initFrameHeight(){
	
	var main = document.getElementById("main");
	var frameHeight = frames['main'].document.body.scrollHeight;
	main.style.height = frameHeight +"px";
}
		var setting={
			data:{
				simpleData:{
					enable:true
				}
			}
		};
		var zNodes =[
			{ id:1, pId:0, name:"Home", open:true},
			{ id:11, pId:1, name:"未登录首页", url : "login.jsp"},
			{ id:12, pId:1, name:"故障申报", url : "declare"},
			{ id:13, pId:1, name:"用户管理", url : "list.action"},
			{ id:2, pId:0, name:"角色管理",url : "partList.jsp"},
			{ id:21, pId:2, name:"角色管理新增和修改", url : "list.action"},
			{ id:3, pId:0, name:"菜单管理"},
			{ id:31, pId:3, name:"菜单的新增和修改页面", url : "list.action"},
			{ id:4, pId:0, name:"分类管理"},
			{ id:5, pId:0, name:"品牌管理", url : "cardList.jsp"},
			{ id:6, pId:0, name:"设备信息管理", url : "brandList.do"},
			{ id:7, pId:0, name:"办公地址管理"},		
			{ id:8, pId:0, name:"故障单处理"},
			{ id:81, pId:8, name:"维修单填写", url : "list.action"},
			{ id:82, pId:8, name:"故障单查询", url : "list.action"},
			{ id:83, pId:8, name:"故障申报", url : "gzsb.jsp"},
			{ id:9, pId:0, name:"统计分析"},	
			{ id:91, pId:9, name:"故障的分类统计", url : "ecount.jsp"},
			{ id:92, pId:9, name:"维修成本趋势图", url : "list.action"},
			{ id:93, pId:9, name:"维修费用月度统计", url : "list.action"},
		];
		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"),setting,zNodes);
		});
	</script>
</html>