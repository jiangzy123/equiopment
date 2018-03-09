<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色管理</title>
<link rel="stylesheet" type="text/css" href="css/list.css">
<script src="js/jquery-3.2.1.min.js"></script>
</head>
<body>
<div class="container">
			
			<div class="search">
				<ul>
					
					<li>
						<span>输入品牌名：</span>
						<input id="d1" />						
					</li>
					<li>
						<a id="search" class="btn" href="#">搜索</a>
					</li>
					
				</ul>
			</div>
			<div id="list" class="list" style="height: auto;">
				<table id="tb">
					
					<tr>
						
						<th>角色名称</th>
		                 <th>描述</th>
		        	      <th>分配权限</th>
					</tr>
					<tbody id = "listTable">
						<tr>
							
							<td>管理员</td>
							<td>管理系统的权限</td>
							<td><button>分配权限</button></td>
						</tr>
						<tr>
							
							<td>设备管理员</td>
							<td>管理设备</td>
							<td><button>分配权限</button></td>
						</tr>
						<tr>
							
							<td>维修人员</td>
							<td>故障处理</td>
							<td><button>分配权限</button></td>
						</tr>
		            </tbody>
				</table>
			</div>
			<div class="footer">
				<div class="content">
					<a href="javascript:void(0)" class="btn" onclick="showAddDialog()">新增</a>
					<a href="javascript:void(0)" class="btn" onclick="showupsetDialog()">分配权限</a>
					<ul>
						<li>
							<a href="" class="foot_a prev"></a>
						</li>
						<li><a href="" class="foot_a">1</a></li>
						<li><a href="" class="foot_a">2</a></li>
						<li><a href="" class="foot_a">3</a></li>
						<li><a href="" class="foot_a">4</a></li>						
						<li>
							<a href="" class="foot_a next"></a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="addLog" id="addLog">
			<table cellpadding="0" border="0" cellspacing="2">
				<caption>新增</caption>
				<tr>
					<td><label>角色名称</label></td>
					<td>
						<input id="id1" />
					</td>
				</tr>
				<tr>
					<td><label>描述</label></td>
					<td>
						<input id="id2" />
					</td>
				</tr>
				<tr>
					<td><label>分配权限</label></td>
					<td><input id="id3" /></td>
				</tr>				
				<tr>
					<td colspan="2"><a href="javascript:void(0)" class="btn" onclick="addLog()">新增</a></td>
				</tr>
			</table>
		</div>
			
		<div class="bg" id="bg"></div>
</body>
<script type="text/javascript">
		function showAddDialog(){				
			document.getElementById("bg").style.display = 'block';
			document.getElementById("addLog").style.display = 'block';
			}
		function addLog(){}
		</script>
</html>