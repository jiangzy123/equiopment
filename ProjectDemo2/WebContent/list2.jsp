<%@page import="com.ifly.pojo.Addr"%>
<%@page import="com.ifly.contro.AddrInfo"%>
<%@page import="oracle.net.aso.i"%>
<%@page import="com.ifly.pojo.UserInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>办公地址管理</title>
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
			</ul>
		</div>
		<div class="search">
			<ul>
				<li><span>请输入办公地址：</span> <input id="d1" /></li>

				<li><span>请选择类别：</span> <input id="d2" /></li>

				<li><a id="search" class="btn" href="#">搜索</a></li>
			</ul>
		</div>
		<div id="list" class="list">
			<table id="tb">
				<tr>
					<th>办公地址</th>
					<th>负责人</th>
					<th>类别</th>
					<th>联系电话</th>
					<th>id</th>
					<th>操作选择</th>

				</tr>
				<tbody id="listTable">
					<%
						//循环显示数据
						List<Addr> newlist = (List) request.getAttribute("alists");

						if (newlist.size() != 0) {
							for (int i = 0; i < newlist.size(); i++) {
								// Addr aInfo=new Addr();
								//aInfo=newlist.get(i);
					%>
					<tr>
						<td><%=newlist.get(i).getAddress()%></td>
						<td><%=newlist.get(i).getMan()%></td>
						<td><%=newlist.get(i).getAtype()%></td>
						<td><%=newlist.get(i).getPhone()%></td>
						<td><%=newlist.get(i).getId()%></td>
						<td><a
							href="doAddrDeleteServlet?id=<%=newlist.get(i).getId()%>"
							class="btn1">删除</a>&nbsp;&nbsp;
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
					<c:forEach items="${pageIndexList2}" var="item">
						<li><a href="javascript:void(0)" r="1" class="foot_a"
							onclick="go(this)">${item}</a></li>
					</c:forEach>
					<li><a href="" class="foot_a next"></a></li>
				</ul>
			</div>
		</div>
	</div>
	<form action="doAddAddrServlet" method="post">
		<div class="addLog" id="addLog">
			<table cellpadding="0" border="0" cellspacing="2">
				<caption>新增</caption>
				<tr>
					<td><label>办公地址</label></td>
					<td><input type="text" id="id1" name="address" value="" /></td>
				</tr>
				<tr>
					<td><label>负责人</label></td>
					<td><input id="id2" type="text" name="man" value="" /></td>
				</tr>
				<tr>
					<td><label>类别</label></td>
					<td><input id="id3" type="text" name="atype" value="" /></td>
				</tr>
				<tr>
					<td><label>联系电话</label></td>
					<td><input id="id4" type="text" name="phone" value="" /></td>
				</tr>
				<tr>
					<td><label>id</label></td>
					<td><input id="id5" type="text" name="id" value="" /></td>
				</tr>

				<tr>
					<td colspan="2"><input type="submit" value="提交" /></td>
				</tr>
			</table>
		</div>
	</form>
	<div class="addLog" id="upset">
		<table cellpadding="0" border="0" cellspacing="2">
			<caption>修改</caption>
			<tr>
				<td><label>办公地址</label></td>
				<td><input id="d11" name="address" /></td>
			</tr>
			<tr>
				<td><label>负责人</label></td>
				<td><input id="d22" name="man" /></td>
			</tr>
			<tr>
				<td><label>类别</label></td>
				<td><input id="d33" name="atype" /></td>
			</tr>
			<tr>
				<td><label>电话</label></td>
				<td><input id="d44" name="phone" /></td>
			</tr>
			<tr>
				<td><label>id</label></td>
				<td><input id="d44" name="id" /></td>
			</tr>
			<tr>
				<td colspan="2"><a href="javascript:void(0)" class="btn1"
					onclick="upset()">确认修改</a></td>
			</tr>
		</table>
	</div>

	<div class="bg" id="bg"></div>
</body>
<script type="text/javascript">
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
	
	
	var _html = $(this).parent().parent().children();
	var arr = tableValue(_html);
	alert(arr[0])
	id1.val(arr[0]);
	id2.val(arr[1]);
	id3.val(arr[2]);
	id4.val(arr[3]);
	id5.val(arr[4]);
	
})
	function search(){
		var addr=$("#d1").val();
		var atype=$("#d2").val();
		
		window.location="doAddrQueryServlet?addr="+addr+"&atype="+atype;
	}
function upset(){
		$("#bg").hide();
		$("#upset").hide();
		var address=$("#d11").val();
		var man=$("#d22").val();
		var atype=$("#d33").val();
		var phone=$("#d44").val();
		var id=$("#d55").val();
		
		window.location="doAddrModifyServlet?address="+address+"&man="+man+"&atype="+atype+"&phone="+phone+"&id="+id;
	}

function go(obj){
	self.location.href="<%=basePath%>addrListServlet.action?currentPage="+ obj.innerText;
	}
	function showAddDialog() {
		document.getElementById("bg").style.display = 'block';
		document.getElementById("addLog").style.display = 'block';
	}
	function addLog() {
		var name = $("#id1").val();
		var type = $("#id2").val();
		var ftime = $("#id3").val();
		var qtime = $("#id4").val();
		var people = $("#id5").val();
		$("#bg").hide();
		$("#addLog").hide();
	}
	function showAddDialog() {
		document.getElementById("bg").style.display = 'block';
		document.getElementById("addLog").style.display = 'block';
	}
</script>
</html>