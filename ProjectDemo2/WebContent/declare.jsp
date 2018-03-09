<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>保修表</title>
<link rel="stylesheet" href="assets/css/zTreeStyle/zTreeStyle.css" type="text/css">

<style type="text/css">
	input,select,textarea{
		margin-top: 20px;
	}
	#content{
		width:280px;
		margin: 0 auto;
	}
	.menuContent{
		background:mediumseagreen;
	}
	#menuBtn{
		width: 100px;
	}
</style>
<script type="text/javascript" src="assets/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="assets/js/jquery.ztree.core.js"></script>
<SCRIPT type="text/javascript">
		var setting = {
			view: {
				dblClickExpand: false
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			async: {
				enable: true,
				url:"address.do",
			},
			callback: {
				beforeClick: beforeClick,
				onClick: onClick
			}
		};


		function beforeClick(treeId, treeNode) {
			var check = (treeNode && !treeNode.isParent);
			if (!check) alert("只能选择教室！");
			return check;
		}
		
		function onClick(e, treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
			nodes = zTree.getSelectedNodes(),
			v = "";
			nodes.sort(function compare(a,b){return a.id-b.id;});
			for (var i=0, l=nodes.length; i<l; i++) {
				v += nodes[i].name + ",";
			}
			if (v.length > 0 ) v = v.substring(0, v.length-1);
			var cityObj = $("#citySel");
			cityObj.attr("value", v);
		}

		function showMenu() {
			var cityObj = $("#citySel");
			var cityOffset = $("#citySel").offset();
			$("#menuContent").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");

			$("body").bind("mousedown", onBodyDown);
		}
		function hideMenu() {
			$("#menuContent").fadeOut("fast");
			$("body").unbind("mousedown", onBodyDown);
		}
		function onBodyDown(event) {
			if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
				hideMenu();
			}
		}
		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting);
		});

	</SCRIPT>
</head>
<body>
	<div id="content">
		<form action="#"   enctype="multipart/form-data" method="post">
			<!-- <input type="text" placeholder="请选择办公地址"><br> -->
			<input id="citySel" type="text" name="address" readonly  placeholder="请选择办公地址"/><button id="menuBtn" onclick="showMenu(); return false;">选择</button>
			<select style="width:175px" name="btype">
				<option value="">电脑</option>
				<option value="">办公桌</option>
				<option value="">空调</option>
			</select>
			<input type="text" name="phone" placeholder="请输入联系方式"><br>
			<input type="text" name="name" placeholder="请输入姓名"><br>
			<textarea rows="8" cols="50" name="disc"  placeholder="问题描述"></textarea>	
			<input type="file" name="files"><br>
			<input type="submit" value="提交">
		</form>
		<div id="menuContent" class="menuContent" style="display:none; position: absolute;">
			<ul id="treeDemo" class="ztree" style="margin-top:0; width:160px;"></ul>
		</div>
	</div>
	
	
</body>
</html>