<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html lang="zh">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>首页</title>
<link rel="stylesheet" href="https://necolas.github.io/normalize.css/3.0.2/normalize.css" />
		<link rel="stylesheet" href="css/main.css" />
		<script type="text/javascript">
           
	  var initializationTime=(new Date()).getTime();
	function showLeftTime()
	{
	var now=new Date();
	var year=now.getFullYear();
	var month=now.getMonth();
	var day=now.getDate();
	var hours=now.getHours();
	var minutes=now.getMinutes();
	var seconds=now.getSeconds();
	document.all.show.innerHTML=""+year+"年"+(month+1)+"月"+day+"日 "+hours+":"+minutes+":"+seconds+"";
	//一秒刷新一次显示时间
	var timeID=setTimeout(showLeftTime,1000);
	}
  </script>
		
</head>
<body onload="showLeftTime()">
<div class="main-wrapper">
			<header><!--描述：页头开始 -->
				<nav>
					<div class="logo"><a href="#">设备保修系统</a></div>
					<label id="show"></label>
					<ul>
						
						<li><a href="#" class="active">首页</a></li>
						<li><a href="#">链接</a></li>
						<li><a href="#">联系我们</a></li>
						<li><a href="#">了解更多</a></li>
						
					</ul>
				</nav>
				<div id="banner">
					<div class="inner">
						<h1>Welcome</h1>
						<p class="sub-heading">设备管理系统是非常通用的管理信息系统，使用它可以有效地管理设备资源、维护设备的正常运转，从而提高工作效率</p>
						<button class="main-btn">了解我们</button>
						<div class="more">
							更多
						</div>
					</div>
				</div>
			</header><!--描述：页头结束 -->
			
			<div class="content"><!--描述：内容开始 -->
				<section class="green-section">
					<div class="wrapper">
						<div>
							<h2>详情</h2>
							<div class="hr"></div>
							<p class="sub-heading">设备管理系统是非常通用的管理信息系统，使用它可以有效地管理设备资源、维护设备的正常运转，从而提高工作效率</p>
						</div>
						<div class="icon-group">
							<span class="icon">item1</span>
							<span class="icon">item2</span>
							<span class="icon">item3</span>
						</div>
					</div>
				</section>
				<section class="gray-section">
					
					
					<div class="article-preview">					
						<div class="text-section">
							<h2>简介</h2>
							<div class="sub-heading">详细介绍</div>
							<p>随着计算机技术的迅猛发展以及Internet进入商业和社会应用阶段，设备管理异常重要</p>
							
						</div>
						<div class="img-sextion">
							<img src="img/pic02.jpg" alt=""/>
						</div>
					</div>
					
					<div class="article-preview">
						<div class="img-sextion">
							<img src="img/pic03.jpg" alt=""/>
						</div>
						<div class="text-section">
							<h2>涵盖功能</h2>
							<div class="sub-heading">详细功能介绍</div>
							<p>设备资产及技术管理：建立设备信息库，实现设备前期的选型、采购、安装测试、转固</p>
						</div>					
					</div>
					
				</section>
				
				<section class="purple-section">
					<div class="wrapper">
						<div class="heading-wrapper">
						<h2>标题一</h2>
						<div class="hr"></div>
						<div class="sub-heading">设备资产及技术管理：建立设备信息库，实现设备前期的选型、采购、安装测试、转固；设备转固后的移装、封存、启封、闲置、租赁、转让、报废，设备运行过程中的技术状态、维护、保养、润滑情况记录</div>
						</div>
						<div class="card-group clearfix">
						<div class="card">
							<h3>标题三</h3>
							<p>设备资产及技术管理：建立设备信息库，实现设备前期的选型、采购、安装测试、转固；设备转固后的移装、封存、启封、闲置、租赁、转让、报废，设备运行过程中的技术状态、维护、保养、润滑情况记录</p>
						</div>
						<div class="card">
							<h3>标题三</h3>
							<p>设备资产及技术管理：建立设备信息库，实现设备前期的选型、采购、安装测试、转固；设备转固后的移装、封存、启封、闲置、租赁、转让、报废，设备运行过程中的技术状态、维护、保养、润滑情况记录</p>
						</div>
						<div class="card">
							<h3>标题三</h3>
							<p>设备资产及技术管理：建立设备信息库，实现设备前期的选型、采购、安装测试、转固；设备转固后的移装、封存、启封、闲置、租赁、转让、报废，设备运行过程中的技术状态、维护、保养、润滑情况记录</p>
						</div>
						<div class="card">
							<h3>标题三</h3>
							<p>设备资产及技术管理：建立设备信息库，实现设备前期的选型、采购、安装测试、转固；设备转固后的移装、封存、启封、闲置、租赁、转让、报废，设备运行过程中的技术状态、维护、保养、润滑情况记录</p>
						</div>
						<div class="card">
							<h3>标题三</h3>
							<p>设备资产及技术管理：建立设备信息库，实现设备前期的选型、采购、安装测试、转固；设备转固后的移装、封存、启封、闲置、租赁、转让、报废，设备运行过程中的技术状态、维护、保养、润滑情况记录</p>
						</div>
						<div class="card">
							<h3>标题三</h3>
							<p>设备资产及技术管理：建立设备信息库，实现设备前期的选型、采购、安装测试、转固；设备转固后的移装、封存、启封、闲置、租赁、转让、报废，设备运行过程中的技术状态、维护、保养、润滑情况记录</p>
						</div>
						</div>
					</div>
					
				</section>
			</div><!--描述：内容结束 -->
			
			<footer><!--描述：页脚开始 -->
				<ul class="share-group">
					<li>item1</li>
					<li>item2</li>
					<li>item3</li>
					<li>item4</li>
					<li>item5</li>
				</ul>
				<div class="copy">
					&copy jiang --2018-03-05
				</div>
			</footer><!--描述：页脚结束 -->
		</div>

</body>
</html>