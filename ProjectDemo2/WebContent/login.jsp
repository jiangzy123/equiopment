<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>

	<head>
		<meta charset="UTF-8" />
		<title>设备管理系统</title>
		<script src="js/jquery-3.2.1.min.js"></script>
		<style>
			* {
				margin: 0;
				padding: 0;
				font-size: 0.2rem;
				color: white;
			}
			
			body {
				background-image: url(img/bbb.jpg);
				background-repeat: no-repeat;
				background-size: cover;
			}
			
			.login-form {
				min-height: 300px;
				width: 30%;
				margin: 0 auto;
				padding: 4rem 0;
				text-align: center;
			}
			
			.login-form span {
				margin: 0 auto;
			}
			
			.top-login {
				width: 130px;
				height: 130px;
				display: block;
				transform: rotate(45deg) translate3d(0, 0, 0);
				margin: 0 auto 4em;
				background: #fff;
				position: relative;
			}
			.top-login span{
				border: 2px solid #f36;
				width: 105px;
				height: 105px;
				display: block;
				margin: 0 auto;
				position: absolute;
				top: 11px;
				right: 11px;
			}
			.top-login span img{
				transform: rotate(-45deg) translate3d(0, 0, 0);
				position: absolute;
				left: 0.9rem;
				top: 0.9rem
			}
			.login-form h1{
				font-size:16rem;
				color: white;
				margin-bottom: 3rem;
				
			}
			.login-form{
				width: 460px;
				display: block;
				margin: 0 auto;
			}
			.login-ic {
			    background: rgba(255, 255, 255, 0.32);
			    margin-bottom: 1.5em;
			    padding: 8px;
			 }
			 
			 .login-ic i {
			    background: url(img/m.png)no-repeat 6px 6px;
			    width: 38px;
			    height: 38px;
			    float: left;
			    display: inline-block;
			}
			.login-ic input[type="text"], .login-ic input[type="password"] {
				    float: left;
				    background: none;
				    outline: none;
				    font-size: 15px;
				    font-weight: 400;
				    color: white;
				    padding: 10px 16px;
				    border: none;
				    border-left: 1px solid #fff;
				    width: 82%;
				    display: inline-block;
				    margin-left: 7px;
				}
				.login-ic span{
					line-height: 30px;
					font-size: 14px;
					color: white;
					position: relative;
					left: -4rem;
				}
				.clear {
   				 		clear: both;
				}
				.check{
					height: 55px;
					line-height: 55px;
					font-size: 18px;
				}
				.check input{
					width: 22px;
					height: 22px;
					vertical-align: middle;
					margin-right: 5px;
				}
			.submit{
				height: 3rem;
			}
			.submit input{
				width: 35%;
				height: 100%;
				margin: 1rem 2rem;
				border: none;
			}
			.box-content {
			 
			    color: rebeccapurple;
			}
			.text{
				    font-size: 64px;
				    font-weight: bold;
				    text-transform: uppercase;
				    fill: none;
				    stroke-width: 2px;
				    stroke-dasharray: 90 310;
				    animation: stroke 6s infinite linear;
				}
				.text-1{
				    stroke: #3498db;
				    text-shadow: 0 0 5px #3498db;
				    animation-delay: -1.5s;
				}
				.text-2{
				    stroke: #f39c12;
				    text-shadow: 0 0 5px #f39c12;
				    animation-delay: -3s;
				}
				.text-3{
				    stroke: #e74c3c;
				    text-shadow: 0 0 5px #e74c3c;
				    animation-delay: -4.5s;
				}
				.text-4{
				    stroke: #9b59b6;
				    text-shadow: 0 0 5px #9b59b6;
				    animation-delay: -6s;
				}
				
				@keyframes stroke {
				  100% {
				    stroke-dashoffset: -400;
				  }
				}
		</style>
	</head>

	<body>
		<div class="login-form">
			<div class="top-login">
				<span>
					<img src="img/group.png" />
				</span>
			
			</div>
		<svg width="100%" height="120">
		    <text text-anchor="middle" x="50%" y="50%" class="text text-1">
		   		     设备报修系统
		    </text>
		    <text text-anchor="middle" x="50%" y="50%" class="text text-2">
		           设备报修系统
		    </text>
		    <text text-anchor="middle" x="50%" y="50%" class="text text-3">
		           设备报修系统
		    </text>
		    <text text-anchor="middle" x="50%" y="50%" class="text text-4">
		           设备报修系统
		    </text>
		</svg>
		<%
			
				String username = "",password="";
				Cookie[] cookies = request.getCookies();
				if(cookies!=null){
					for(Cookie c : cookies){
						if("username".equals(c.getName())){
							username = c.getValue();
						}
						if("password".equals(c.getName())){
							password = c.getValue();
						}
					}
				}
			
			%>
			<div class="login-form" style="padding-top: 20px">
				<form action="CheckLogin.do" method="post">
					<div class="login-ic">
						<i></i>
						<input type="text" placeholder="UserName" name="username" value="<%=username%>"/>
						<div class="clear"></div>
					</div>
					<div class="login-ic">
						<i></i>
						<input type="password" placeholder="PassWord" name="password" value="<%=password%>"/>
						<div class="clear"></div>
					</div>
					<div class="login-ic">
						<span>请输入验证码</span>
						<input type="text" placeholder="验证码" name="checkCode" style="width: 30%;border: 1px solid black;"/>
						<img src="<%=basePath%>CheckCode.do" id="code" width="100px;" style="vertical-align: middle;" height="30px" alt="验证码" onclick="getCode()"/>
						<div class="clear"></div>
					</div>
					<div class="check">
						<input type="checkbox" name="accept" />7天内免登录
						
					</div>
					<div class="submit">
						
						<input type="submit" value="登录"  style="background: rgba(58,171,135,0.32);"/>
						<input type="submit" value="注册" style="background: rgba(230,161,161,0.32);"/>
					</div>
				</form>
			</div>
		</div>
		<script src="js/jquery-3.2.1.min.js"></script>
		<script src="js/plug-in.min.js"></script>
		<script type="text/javascript">
		function getCode(){
			document.getElementById("code").src="<%=basePath%>CheckCode.do?q="+Math.random();
		}
		window.onload = function(){
			var err = "${errMsg}";
			if(err!=""){
				$.Pop(err,{Animation:'slideFromTop',Title:'错误信息'})
			}
		}
		</script>
	</body>

</html>