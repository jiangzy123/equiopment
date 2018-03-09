<%@page import="java.util.List"%>
<%@page import="com.ifly.pojo.ErrBs"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>故障单查询</title>
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
					<th>故障单号</th>
					<th>设备型号</th>
					<th>设备编号</th>
					<th>设备品牌</th>
					<th>设备分类</th>
					<th>申报日期</th>
					<th>操作</th>

				</tr>
				<tbody id="listTable">
					<%
						//循环显示数据
						List<ErrBs> newlist = (List) request.getAttribute("flists");
						if (newlist.size() != 0) {
							for (int i = 0; i < newlist.size(); i++) {
								// Addr aInfo=new Addr();
								//aInfo=newlist.get(i);
					%>
					<tr>
						<td><%=newlist.get(i).getId()%></td>
						<td><%=newlist.get(i).getBnumber()%></td>
						<td><%=newlist.get(i).getBid() %></td>
						<td><%=newlist.get(i).getBname()%></td>
						<td><%=newlist.get(i).getBtype()%></td>
						
						<td><%=newlist.get(i).getEdate()%></td>
						<td><a href="javascript:void(0)" class="btn">维修单填写</a></td>
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
					<li><a href="" class="foot_a next"></a></li>
				</ul>
			</div>
		</div>
	</div>


	<div class="addLog" id="upset">
		<table cellpadding="0" border="0" cellspacing="2">
			<caption>维修单填写</caption>
			<tr>
				<td><label>故障单号</label></td>
				<td><input id="d11" name="id" /></td>
			</tr>
			<tr>
				<td><label>申报日期</label></td>
				<td><input id="d66" name="bdate" /></td>
			</tr>
			<tr>
				<td><label>维修状态</label></td>
				<td><select>
						<option value="">已维修</option>
						<option value="">已报废</option>
						
				</select>
				</td>
			</tr>

			<tr>
				<td><label>问题描述</label></td>
				<td><input id="d" type="text" /></td>
			</tr>
			<tr>
				<td><label>金额</label></td>
				<td><input type="text" /></td>
			</tr>
			<tr>
				<td><label>发票单据</label></td>
				<td><input type="text" /></td>
			</tr>
			<tr>
				<td colspan="2"><a href="doErrfixListServlet" class="btn1">返回</a></td>
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
	
	var id6 = $("#d66");
	
	
	var _html = $(this).parent().parent().children();
	var arr = tableValue(_html);
	alert(arr[0])
	id1.val(arr[0]);
	
	id6.val(arr[5]);

	
})
	function search(){
		var addr=$("#d1").val();
		var atype=$("#d2").val();
		
		window.location="doAddrQueryServlet?addr="+addr+"&atype="+atype;
	}
function upset(){
		$("#bg").hide();
		$("#upset").hide();
		var id=$("#d11").val();
		
		var bdate=$("#d66").val();
		
		
		//window.location="doAddrModifyServlet?id="+id+"&bnumber="+bnumber+"&bid="+bid+"&bname="+bname+"&btype="+btype+"&bdate="+bdate+"&etatic="+etatic+"&edate="+edate;
	}

function go(obj){
	self.location.href="<%=basePath%>doErrBrListServlet?currentPage="+ obj.innerText;
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