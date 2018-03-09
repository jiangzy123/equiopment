<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色管理新增和修改</title>
<link href="css/zTreeStyle/zTreeStyle.css" rel="stylesheet" />
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/plug-in.min.js"></script>
<script type="text/javascript" src="js/jquery.ztree.core.min.js"></script>
<script type="text/javascript" src="js/jquery.ztree.excheck.js"></script>
<SCRIPT type="text/javascript">
		
		var setting = {
			check: {
				enable: true
			},
			data: {
				simpleData: {
					enable: true
				}
			}
		};

		var zNodes =[
			{ id:1, pId:0, name:"用户管理", open:true},
		{ id:11, pId:1, name:"用户管理", open:true},
		{ id:111, pId:11, name:"新增"},
		{ id:112, pId:11, name:"修改"},
		{ id:113, pId:11, name:"删除"},
		{ id:12, pId:1, name:"角色管理", open:true},
		{ id:13, pId:1, name:"菜单管理", open:true},
		{ id:2, pId:0, name:"设备管理", checked:true, open:true},
		{ id:21, pId:2, name:"设备分类管理"},
		{ id:22, pId:2, name:"设备品牌管理"},
		{ id:23, pId:2, name:"设备信息管理"},
		{ id:24, pId:2, name:"办公地址管理"},
		{ id:25, pId:2, name:"设备分配"},
		{ id:3, pId:0, name:"故障单管理", checked:true, open:true},
		{ id:31, pId:3, name:"故障申报"},
		{ id:32, pId:3, name:"故障单查询"},
		{ id:33, pId:3, name:"故障单处理"},
		{ id:4, pId:0, name:"统计功能", checked:true, open:true},
		{ id:41, pId:4, name:"故障分类统计"},
		{ id:42, pId:4, name:"维修成本趋势图"},
		{ id:43, pId:4, name:"维修费用月度统计"}
		];
		
		var code;
		
		function setCheck() {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
			py = $("#py").attr("checked")? "p":"",
			sy = $("#sy").attr("checked")? "s":"",
			pn = $("#pn").attr("checked")? "p":"",
			sn = $("#sn").attr("checked")? "s":"",
			type = { "Y":py + sy, "N":pn + sn};
			zTree.setting.check.chkboxType = type;
			showCode('setting.check.chkboxType = { "Y" : "' + type.Y + '", "N" : "' + type.N + '" };');
		}
		function showCode(str) {
			if (!code) code = $("#code");
			code.empty();
			code.append("<li>"+str+"</li>");
		}
		
		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
			setCheck();
			$("#py").bind("change", setCheck);
			$("#sy").bind("change", setCheck);
			$("#pn").bind("change", setCheck);
			$("#sn").bind("change", setCheck);
		});
		
	</SCRIPT>
</head>
<body>
<div class="content_wrap" style="margin: 0 auto;">
		<form action="#"   enctype="multipart/form-data" method="post">
			
			<div style="margin-top: 20px;">
			<input id="citySel" type="text" name="address" readonly  placeholder="请输入角色名称"/><br /><br />
		
			<textarea rows="8" cols="50" name="disc"  placeholder="角色描述"></textarea>	
			</div>
			<div class="zTreeDemoBackground ">
		<ul id="treeDemo" class="ztree"></ul>
	</div>
			<input type="submit" value="保存">
		</form>
	
	
	
</div>
</body>
</html>