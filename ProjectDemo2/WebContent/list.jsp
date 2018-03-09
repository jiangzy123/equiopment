<%@page import="oracle.net.aso.i"%>
<%@page import="com.ifly.pojo.UserInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
 <% 
    String path = request.getContextPath(); 
//获得本项目的地址(例如: http://localhost:8080/MyApp/)赋值给basePath 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
<link rel="stylesheet" type="text/css" href="css/list.css">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/plug-in.min.js"></script>
</head>
<body>
<div class="container">
			<div class="title">
				<span>设备报修系统</span>
			<ul>
				<li><img src="img/images/icon5.png" /> <span>首页</span></li>
				<li><img src="img/images/icon3.png" /> <span>设备信息管理</span></li>

			</ul>
			</div>
			<form>
			<div class="search">
				<ul>
					<li>
							<input id="d1" name="uname" placeholder="请输入用户名"/>
						</li>
						<li>
							<input id="d1" name="tname" placeholder="请输入真是姓名"/>
						</li>
					<li>
						<input type="radio" name="radio1" value="男">男
						<input type="radio" name="radio1" value="女">女
					</li>
					
					<li>
						<a id="search" class="btn1" href="doUserQueryServlet">搜索</a>
					</li>
				</ul>
			</div>
			</form>
			<div id="list" class="list">
				<table id="tb">
					<tr>
						<th>用户名</th>
		                  <th>真实姓名</th>
		                  <th>性别</th>
		                  <th>出生日期</th>
		                  <th>身份证号</th>
		                  <th>联系电话</th>
		                  <th>电子邮箱</th>
		                  <th>操作</th>
						
					</tr>
					<tbody id = "listTable">
					 <%
              //循环显示数据
              List<UserInfo> newlist=(List)request.getAttribute("newlist");
              
              if(newlist.size()!=0){
            	  for(int i=0;i<newlist.size();i++){
            		  UserInfo brand=new UserInfo();
            		 brand=newlist.get(i);	 
            
              %>
                <tr>
                  <td><%=newlist.get(i).getName() %></td>
                  <td><%=newlist.get(i).getTrue_name()%></td>   
                  <td><%=newlist.get(i).getSex()%></td>
                  <td><%=newlist.get(i).getBrithday()%></td>
                  <td><%=newlist.get(i).getSid()%></td>
                  <td><%=newlist.get(i).getPhone()%></td>
                  <td><%=newlist.get(i).getEmail()%></td>
                  <td><a href="doUserDeleteServlet?id=<%=newlist.get(i).getSid() %>" class="btn1">删除</a>&nbsp;&nbsp;
                  <a href="javascript:void(0)" class="btn">修改</a></td>
                </tr>
                <%
            	  }
              }
              %>
		            </tbody>
				</table>
			</div>
			<div class="footer">
				<div class="content">
					<a href="javascript:void(0)" class="btn1" onclick="showAddDialog()">新增</a>
					
					<ul>
						<li><a href="" class="foot_a prev"></a></li>
					<c:forEach items="${pageIndexList3}" var="item">
						<li><a href="javascript:void(0)" r="1" class="foot_a"
							onclick="go(this)">${item}</a></li>
					</c:forEach>

					<li><a href="javascript:void(0)" class="foot_a next"></a></li>
					</ul>
				</div>
			</div>
		</div>
		<form action="doUserAddServlet" method="post">
		<div class="addLog" id="addLog">
			<table cellpadding="0" border="0" cellspacing="2">
				<caption>新增</caption>
				<tr>
					<td><label>登录名</label></td>
					<td>
						<input type="text" id="id1" name="name" value=""/>
					</td>
				</tr>
				<tr>
					<td><label>真实姓名</label></td>
					<td>
						<input id="id2" type="text" name="t_name" value=""/>
					</td>
				</tr>
				<tr>
					<td><label>性别</label></td>
					<td><input id="id3" type="text" name="sex" value=""/></td>
				</tr>
				<tr>
					<td><label>出生日期</label></td>
					<td><input id="id4" type="text" name="brithday" value=""/></td>
				</tr>
				<tr>
					<td><label>用户id</label></td>
					<td><input id="id5" type="text" name="sid" value=""/></td>
				</tr>
				<tr>
					<td><label>联系电话</label></td>
					<td><input id="id6" type="text" name="phone" value=""/></td>
				</tr>
				<tr>
					<td><label>Email</label></td>
					<td><input id="id7" type="text" name="email" value=""/></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="提交"/></td>
				</tr>
			</table>
		</div>
		</form>
		<div class="addLog" id="upset">
			<table cellpadding="0" border="0" cellspacing="2">
				<caption>修改</caption>
				<tr>
					<td><label>登录名</label></td>
					<td>
						<input id="d11" name="name"/>
					</td>
				</tr>
				<tr>
					<td><label>真实姓名</label></td>
					<td>
						<input id="d22" name="t_name"/>
					</td>
				</tr>
				<tr>
					<td><label>性别</label></td>
					<td><input id="d33" name="sex"/></td>
				</tr>
				<tr>
					<td><label>出生日期</label></td>
					<td><input id="d44" name="brithday"/></td>
				</tr>
				<tr>
					<td><label>用户id</label></td>
					<td><input id="d55" name="sid"/></td>
				</tr>
				<tr>
					<td><label>联系电话</label></td>
					<td><input id="d66" name="phone"/></td>
				</tr>
				<tr>
					<td><label>Email</label></td>
					<td><input id="d77" name="email"/></td>
				</tr>
				<tr>
					<td colspan="2"><a href="javascript:void(0)" class="btn" onclick="upset()">确认修改</a></td>
				</tr>
			</table>
		</div>
				
		<div class="bg" id="bg"></div>
</body>
<script type="text/javascript">
function go(obj){
	self.location.href="<%=basePath%>doUserListServletPage?currentPage="
				+ obj.innerText;
}
function tableValue(_html){
	var arr = new Array();
	for(var i = 0 ; i <_html.length;i++ ){
			arr.push(_html.eq(i).html());
	}
	return arr;
}

$(".btn").click(function(){
	$("#bg").show();
	$("#upset").show();
	var id1 = $("#d11");
	var id2 = $("#d22");
	var id3 = $("#d33");
	var id4 = $("#d44");
	var id5 = $("#d55");
	var id6 = $("#d66");
	var id7 = $("#d77");
	
	
	var _html = $(this).parent().parent().children();
	var arr = tableValue(_html);
	alert(arr[0])
	id1.val(arr[0]);
	id2.val(arr[1]);
	id3.val(arr[2]);
	id4.val(arr[3]);
	id5.val(arr[4]);
	id6.val(arr[5]);
	id7.val(arr[6]);
})
function upset(){
		$("#bg").hide();
		$("#upset").hide();
		var name=$("#d11").val();
		var t_name=$("#d22").val();
		var sex=$("#d33").val();
		var brithday=$("#d44").val();
		var sid=$("#d55").val();
		var phone=$("#d66").val();
		var email=$("#d77").val();
		window.location="doUserModifyServlet?name="+name+"&t_name="+t_name+"&sex="+sex+"&brithday="+brithday+"&sid="+sid+"&phone="+phone+"&email="+email;
	}
function search(){
	var addr=$("#d1").val();
	var atype=$("#d2").val();
	
	window.location="doAddrQueryServlet?addr="+addr+"&atype="+atype;
}
function showupsetDialog(){
	
}

function showAddDialog(){				
	document.getElementById("bg").style.display = 'block';
	document.getElementById("addLog").style.display = 'block';
	}
function addLog(){
	var name=$("#id1").val();
	var type=$("#id2").val();
	var ftime=$("#id3").val();
	var qtime=$("#id4").val();
	var people=$("#id5").val();	
	$("#bg").hide();
	$("#addLog").hide();
}
</script>
</html>