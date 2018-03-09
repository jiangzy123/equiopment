<%@page import="com.ifly.pojo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<link rel="stylesheet" href="css/tree.css" />
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/treescroll.min.js"></script>
<style type="text/css">
 	.left{
 		width: 300px;
 		min-height: 660px;
 		}
 	
 	a{
 	text-decoration: none;
 	margin-left: 15px;
 	}
 	header{
 		width: 100%;
 		height: 60px;
 		background: #e4e4e4;
 	}
 	.login{
 		height: 100%;
 		width: 300px;
 	}
 	.title {
		line-height: 60px;
		font-size: 22px;
		color: #ca9c9c;
		font-weight:500;
		padding-left: 70px;
}
.login_info{
	position: absolute;
	right: 30px;
	top: 0;
	height: 60px;
	line-height: 60px;
}
.login_self{
	position: relative;
    
    right: 80px;
    font-size: 16px;
}


.header_menu{
	width: 140px;
	border:1px solid #ffeaea;
	border-top:none;
	border-right:none;
	position:absolute;
	right:0px;
	display: none;
	z-index:99;
}
.header_menu ul li{
	height:42px;
	text-align: center;
	background-color: #eff5f4;
	
}
.header_menu ul li a{
	height:42px;
	width:100%;
	line-height: 42px;
	color: black;
}
.header_menu ul li:hover{

	background-color: #bfb9b9;
}
.mask{
	width: 100%;
	height: 100%;
	background: black;
	opacity:0.3;
	position: absolute;
    left: 0;
    top: 0;
    display: none;
}
.update_pwd,.show_info{
	width: 500px;
	height: 350px;
	position: absolute;
	background: #af4a4a2e;
	border-radius:15px;
	font-size: 18px;
	display: none;
}
.update_header{
	height: 55px;
	width: 100%;
	background-color: #9a5959;
	font-size: 22px;
	line-height: 55px;
	border-radius:15px;
	border-bottom-right-radius:0px;
    border-bottom-left-radius: 0px;
	text-align: center;
}
.update_header span {
	font-size: 12px;
	position: absolute;
	right: 20px;

}
.update_pwd form,.show_info form {
	width: 80%;
	margin: 0 auto;
	padding: 0 15px;
}
.update_pwd form div,.show_info form div{
	width: 100%;
	height: 60px;
	line-height: 60px;
}

.update_pwd form div span,.show_info form div span{

}
.update_pwd form input,.show_info form input{
	width: 70%;
	height: 33px;
    border: none
}
.update_pwd .btn_group,.show_info .btn_group{
	margin-top:15px;
	text-align: center;
}
.update_pwd .btn_group input,.show_info .btn_group input {
	width: 40%;
	border-radius:15px;
	font-size: 16px;
	color: #7d3a6b;
	font-weight: bold;
	
}
.right {
				width:1000px;
				height:800px;
				position: absolute;
				top:80px;
				right:20px;
				padding:0 5px;
				
			}
			
			iframe {
				width:100%;
				height:100%;
				border:none;
			}
</style>
</head>
    
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String password = (String)request.getSession().getAttribute("password");
%>
<body>
	<header>
		<div class="login">
			<label class="title">设备报修系统</lable>
		</div>
		<div class="login_info">
			<span class="login_self">Welcome<a style="color:#88bdb4;font-size: 18px"><%=request.getSession().getAttribute("username") %></a></span>
			
			<input type="file" id="img_input" style="opacity:0; filter:alpha(opacity=0); height: 60px; width: 60px; position: absolute; top: 0; right: 20px; z-index: 9;">
		
			<img alt="头像" src="img/self.jpg" style="height: 60px;width: 60px;border-radius:50%;position: absolute;top: 0; right: 20px;" id="pic">
			<img alt="" src="img/pic1.png" onclick="show()">
		</div>
		<div class="header_menu">
			<ul>
				<li><a href="javascript:void(0)" onclick="showInfo()">个人信息</a></li>
				<li><a href="javascript:void(0)" onclick="updatePwd()">修改密码</a></li>
				<li><a href="login.jsp">退出登录</a></li>
			</ul>
		</div>
	</header>
	<div class="container">
		<div class="left">
			<div class="centent" style="width: 260px">
		<div class="treebox scrollXY">
			<div class="tree">
				<ul>
					<!--一级菜单栏-->
				<li>
						<div class="close_menu"><span></span><a title="一级菜单">Home</a></div>
						<ul>
							<li id="li1"><a href="#" target="main">首页</a></li>
							
							<li id="li3"><a href="doBussinessServlet?action=userInfo" target="main">用户管理</a></li>
							<li id="li4">
								<div class="close_menu"><span></span><a title="二级菜单" href="doBussinessServlet?action=partList" target="main">角色管理</a></div>
								<ul>
									<li><a href="doBussinessServlet?action=user" target="main">角色管理新增与修改</a></li>
								</ul>
							</li>
							<li>
								<div class="close_menu"><span></span><a title="二级菜单">菜单管理</a></div>
								<ul>
									<li><a href="doBussinessServlet?action=declare1" target="main">菜单的新增和修改界面</a></li>
								</ul>
							</li>
							<li><a href="#">分类管理</a></li>
							<li><a href="doBussinessServlet?action=cardList" target="main">品牌管理</a></li>
							<li><a href="doBussinessServlet?action=logList" target="main">设备信息管理</a></li>
							<li><a href="doBussinessServlet?action=addrListServlet" target="main">办公地址管理</a></li>
							<li>
								<div class="close_menu"><span></span><a title="二级菜单">故障单管理</a></div>
								<ul>
							<li><a href="doLogListServlet1?action=haserr" target="main">故障申报</a></li>
							<li><a href="doBussinessServlet?action=errblist" target="main">故障单查询</a></li>
							<li><a href="doBussinessServlet?action=fixerr" target="main">维修单填写</a></li>
								</ul>
							</li>
							<li>
								<div class="close_menu"><span></span><a title="二级菜单">统计分析</a></div>
								<ul>
									<li><a href="doBussinessServlet?action=pic1" target="main">故障的分类统计</a></li>
									<li><a href="doBussinessServlet?action=pic2" target="main">维修成本趋势图</a></li>
									<li><a href="doBussinessServlet?action=pic3" target="main">修费用月度统计</a></li>
								</ul>
							</li>
						</ul>
					</li>
					<!--一级菜单栏end-->
				</ul>
				
			</div>
		</div>
		</div>
		</div>
		
		<div class="right">
		<iframe src="log1.jsp" name="main" id="main" class="main"></iframe>
		</div>	
		
	</div>
	<div class="mask">
		
	</div>
	<div class="update_pwd">
		<div class="update_header">修改密码<span onclick="hideUp()">X</span></div>
		<form action="" method="post">
			<div><span>原始密码：</span><input type="password" name="pwd" id="pwd" value="<%=((User)request.getSession().getAttribute("user")).getPass()%>"/></div>
			<div><span>修改密码：</span><input type="password" id="uppwd" name="uppwd"/></div>
			<div><span>确认密码：</span><input type="password" id="rupwsd" name="ruppwd"/></div>
			<div class="btn_group">
				<input type="button" value="提交" onclick="refer()">
				<input type="button" value="取消" onclick="hideUp()">
			</div>
		</form>
	</div>
	<div class="show_info">
		<div class="update_header">个人信息<span onclick="hideSh()">X</span></div>
		<form action="changeInfo.do" method="post">
			<div><span>用户名：</span><%=((User)request.getSession().getAttribute("user")).getName() %></div>
			<div><span>电话：</span><%=((User)request.getSession().getAttribute("user")).getTel() %></div>
			<div><span>住址：</span><%=((User)request.getSession().getAttribute("user")).getAddress() %></div>
			<div class="btn_group">
			
				<input type="button" value="返回" onclick="hideSh()">
			</div>
		</form>
	</div>
	<script type="text/javascript">
	window.onload = function(){
		//$(".update_pwd").css("left",document.body.c)
		console.log(document.body.clientHeight);
		var hei = document.body.clientHeight;
		var wid = document.body.clientWidth;
		$(".update_pwd").css("position","absolute");
		$(".update_pwd").css("left",(wid-500)/2);
		$(".update_pwd").css("top",(hei-350)/2);
		$(".show_info").css("position","absolute");
		$(".show_info").css("left",(wid-500)/2)
		$(".show_info").css("top",(hei-350)/2)
	}
	$("#img_input").on("change", function(e) {
		  var file = e.target.files[0]; //获取图片资源
		  // 只选择图片文件
		  if (!file.type.match('image.*')) {
		    return false;
		  }
		  var reader = new FileReader();

		  reader.readAsDataURL(file); // 读取文件
		  // 渲染文件
		  reader.onload = function(arg) {
			  $("#pic").attr("src",arg.target.result)
		    
		  }
		});
	function show(){
		$(".header_menu").fadeToggle("slow");
	}
	
	function showInfo(){
		$(".mask").show()
		$(".header_menu").fadeOut("slow");
		$(".show_info").show();
	}
	
	
	function updatePwd(){
		$(".mask").show()
		$(".header_menu").fadeOut("slow");
		$(".update_pwd").show();
	}
	function hideUp(){
		$(".mask").fadeOut("slow")
		
		$(".update_pwd").fadeOut("slow");
	}
	function hideSh(){
		$(".mask").fadeOut("slow")
		
		$(".show_info").fadeOut("slow");
	}
	function refer(form){
		if(document.getElementById("pwd").value==''){
			alert("请输入原始密码!");
			return;
		}
		if(document.getElementById("uppwd").value==''){
			alert("请输入修改密码!");
			return;
		}
		if(document.getElementById("rupwsd").value==''){
			alert("请输入确认密码!");
			return;
		}
		if(document.getElementById("uppwd").value!=document.getElementById("rupwsd").value){
			alert("两次密码不一致");
			return;
		}
		
		if(document.getElementById("pwd").value!="<%=((User)request.getSession().getAttribute("user")).getPass()%>"){
			alert("原始密码不正确");
		}else{
			alert(document.getElementById("rupwsd").value)
			window.location="updatePass.do?pass="+document.getElementById("rupwsd").value;
		}
		
		
	}
	</script>
</body>
</html>