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
					<th>维修状态</th>
					<th>维修日期</th>
					<th>操作</th>

				</tr>
				<tbody id="listTable">
					<%
						//循环显示数据
						List<ErrBs> newlist = (List) request.getAttribute("elists");
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
						<td><%=newlist.get(i).getBdate()%></td>
						<td><%=newlist.get(i).getEtatic()%></td>
						<td><%=newlist.get(i).getEdate()%></td>
						<td>
							 <a href="javascript:void(0)" class="btn">维修单查看</a></td>
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
	
	<form action="doErrBrAddServlet" method="post">
		<div class="addLog" id="addLog">
			<table cellpadding="0" border="0" cellspacing="2">
				<caption>故障申报</caption>
				<tr>
					<td><label>故障单号</label></td>
					<td><input type="text" id="id1" name="id" value="" /></td>
				</tr>
				<tr>
					<td><label>设备编号</label></td>
					<td><input id="id2" type="text" name="bId" value="" /></td>
				</tr>
				<tr>
					<td><label>设备故障描述</label></td>
					<td><input id="id3" type="text" name="direction" value="" /></td>
				</tr>
				<tr>
					<td><label>故障申报日期</label></td>
					<td><input id="id4" type="text" name="edate" value="" /></td>
				</tr>
				
				<tr>
					<td colspan="2"><input type="submit" value="提交" /></td>
				</tr>
			</table>
		</div>
	</form>
	
	<div class="addLog" id="upset">
		<table cellpadding="0" border="0" cellspacing="2">
			<caption>查看维修单</caption>
			<tr>
				<td><label>故障单号</label></td>
				<td><input id="d11" name="id" /></td>
			</tr>
			<tr>
				<td><label>设备型号</label></td>
				<td><input id="d22" name="bnumber" /></td>
			</tr>
			<tr>
				<td><label>设备编号</label></td>
				<td><input id="d33" name="bid" /></td>
			</tr>
			<tr>
				<td><label>设备品牌</label></td>
				<td><input id="d44" name="bname" /></td>
			</tr>
			<tr>
				<td><label>设备分类</label></td>
				<td><input id="d55" name="btype" /></td>
			</tr>
			<tr>
				<td><label>申报日期</label></td>
				<td><input id="d66" name="bdate" /></td>
			</tr>
			<tr>
				<td><label>维修状态</label></td>
				<td><input id="d77" name="etatic" /></td>
			</tr>
			<tr>
				<td><label>维修日期</label></td>
				<td><input id="d88" name="edate" /></td>
			</tr>
			<tr>
				<td colspan="2"><a href="doErrBrListServlet" class="btn1"
					>返回</a></td>
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
	var id6 = $("#d66");
	var id7 = $("#d77");
	var id8 = $("#d88");
	
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
	id8.val(arr[7]);
	
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
		var bnumber=$("#d22").val();
		var bid=$("#d33").val();
		var bname=$("#d44").val();
		var btype=$("#d55").val();
		var bdate=$("#d66").val();
		var etatic=$("#d77").val();
		var edate=$("#d88").val();
		
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