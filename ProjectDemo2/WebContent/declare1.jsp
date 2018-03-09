<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>菜单的新增和修改</title>
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/plug-in.min.js"></script>
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
</head>
<body>
	<div id="content">
		<form action="#"  id="signform" enctype="multipart/form-data" method="post">			
			<input type="text" placeholder="请选择办公地址"><br> 
			<input id="citySel" type="text" name="address" readonly  placeholder="功能菜单"/>
			<button id="menuBtn" onclick="showMenu(); return false;">上级菜单</button>
			
			<label>名称：</label>
			<input type="text" name="name" placeholder="请输入名称"><br>
			<label>链接：</label>
			<input type="text" name="hr" placeholder="请输入链接"><br>
			<label>目标：</label>
			<input type="text" name="targe" placeholder="请输入姓名"><br>
			<label>图标：</label>
			<select style="width:175px" name="btype">
				<option value="">电脑</option>
				<option value="">办公桌</option>
				<option value="">空调</option>
			</select><br>
			<label>排序：</label>
			<input type="text" name="paixu" placeholder="930"><br>
			<label>可见：</label>
			<input type="radio" name="radio1" value="显示">显示
			<input type="radio" name="radio1" value="显示">隐藏<br>
			<label>权限标识：</label>
			<input type="text" name="bsf" placeholder="930"><br>
			<label>备注：</label>
			<textarea rows="8" cols="50" name="disc"  placeholder="备注"></textarea>	
			<input type="submit" value="保存">
		</form>
		<div id="menuContent" class="menuContent" style="display:none; position: absolute;">
			<ul id="treeDemo" class="ztree" style="margin-top:0; width:160px;"></ul>
		</div>
	</div>
</body>
<script type="text/javascript">
$().ready(function(){
	$("#signform").validate({
		rules:{
			 name: {
			        required: true,
			        
			      },
			      hr: {
			        required: true,
			        minlength: 6
			      },
			      targe: {
				        required: true,
				     
				        
				      },
			      paixu: {
				        required: true,
				        
				      },
				      radio1: {
				        required: true,
				        minlength: 6
				      },
				      bsf: {
					        required: true,				     
					        
					      }
		},
		messages:{
			name: {
		        required: "请输入名称"
		       
		      },
		     hr: {
		        required: "点击菜单跳转的页面"
		       
		      },
		      targe: {
		        required: "链接地址打开的目标窗口，默认：mainFrame"
		      	        
		      },
		      paixu: {
			        required: "排列顺序，升序"
			       
			      },
			     radio1: {
			        required: "该菜单或操作是否显示到系统页面上"
			       
			      },
			      bsf: {
			        required: "控制器定义的权限标识"
			      	        
			      }
		}
		
	});
	   
});
</script>
</html>