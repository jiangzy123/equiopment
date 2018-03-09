<%@page import="com.ifly.pojo.Brand"%>
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
<title>设备列表页面</title>
<link rel="stylesheet" type="text/css" href="css/list.css">
<script src="js/jquery-3.2.1.min.js"></script>
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
				<li><span>请选择品牌：</span> <select>
						<option>联想</option>
						<option>华硕</option>
						<option>苹果</option>
						<option>弘基</option>
						<option>戴尔</option>
				</select></li>
				<li><span>请选择分类：</span> <select>
						<option>分类1</option>
						<option>分类2</option>
						<option>分类3</option>
				</select></li>
				<li><span>输入编号：</span> <input id="d1" /></li>
				<li><a id="search" class="btn1" href="javascript:void(0)">查询</a></li>
			</ul>
		</div>
		<div id="list" class="list">
			<table id="tb">
				<tr>
					<th>设备型号</th>
					<th>设备编号</th>
					<th>设备品牌</th>
					<th>设备分类</th>
					<th>安放地址</th>
					<th>购买日期</th>
					<th>状态</th>
					<th>操作</th>

				</tr>
				
				<tbody id="listTable">
			 <%
              //循环显示数据
              List<Brand> newlist=(List<Brand>)request.getAttribute("lists"); 
			 System.out.println(newlist.size());
              if(newlist.size()!=0){
            	  for(int i=0;i<newlist.size();i++){
            		 Brand brand=new Brand();
            		 brand=newlist.get(i);	 
            
              %>
                <tr>
                  <td><%=newlist.get(i).getbNumber() %></td>
                  <td><%=newlist.get(i).getbId()%></td>   
                  <td><%=newlist.get(i).getbName()%></td>
                  <td><%=newlist.get(i).getBtype()%></td>
                  <td><%=newlist.get(i).getbAddress()%></td>
                  <td><%=newlist.get(i).getbDate()%></td>
                  <td><%=newlist.get(i).getBstatic()%></td>
                  <td><a href="deleteBrandServlet.do?id=<%=newlist.get(i).getbId() %>" class="btn1">删除</a>&nbsp;&nbsp;
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
					<c:forEach items="${pageIndexList }" var="item">
						<li><a href="javascript:void(0)" r="1" class="foot_a"
							onclick="go(this)">${item}</a></li>
					</c:forEach>

					<li><a href="javascript:void(0)" class="foot_a next"></a></li>
				</ul>
			</div>
		</div>
	</div>
	<form action="addBrandServlet.do" method="post">
		<div class="addLog" id="addLog">
			<table cellpadding="0" border="0" cellspacing="2">
				<caption>新增</caption>
				<tr>
					<td><label>设备型号</label></td>
					<td><input type="text" id="id1" name="bNumber" value="" /></td>
				</tr>
				<tr>
					<td><label>设备编号</label></td>
					<td><input id="id2" type="text" name="bId" value="" /></td>
				</tr>
				<tr>
					<td><label>设备品牌</label></td>
					<td><input id="id3" type="text" name="bName" value="" /></td>
				</tr>
				<tr>
					<td><label>设备分类</label></td>
					<td><input id="id4" type="text" name="btype" value="" /></td>
				</tr>
				<tr>
					<td><label>安放地址</label></td>
					<td><input id="id5" type="text" name="bAddress" value="" /></td>
				</tr>
				<tr>
					<td><label>购买日期</label></td>
					<td><input id="id6" type="text" name="bDate" value="" /></td>
				</tr>
				<tr>
					<td><label>状态</label></td>
					<td><input id="id7" type="text" name="bstatic" value="" /></td>
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
				<td><label>设备型号</label></td>
				<td><input id="d11" /></td>
			</tr>
			<tr>
				<td><label>设备编号</label></td>
				<td><input id="d22" readonly="readonly"/></td>
			</tr>
			<tr>
				<td><label>设备品牌</label></td>
				<td><input id="d33" /></td>
			</tr>
			<tr>
				<td><label>设备分类</label></td>
				<td><input id="d44" /></td>
			</tr>
			<tr>
				<td><label>安放地址</label></td>
				<td><input id="d55" /></td>
			</tr>
			<tr>
				<td><label>购买日期</label></td>
				<td><input id="d66" /></td>
			</tr>
			<tr>
				<td><label>状态</label></td>
				<td><input id="d77" /></td>
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
	function go(obj){
		self.location.href="<%=basePath%>logListServlet.action?currentPage="
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
	
	function showupsetDialog(){
		
	}

	$("#search").click(function(){
		var bid=$("#d1").val();
		alert(bid);
		window.location="doQueryBrandServlet?bid="+bid;
	})
	
	function upset(){
		$("#bg").hide();
		$("#upset").hide();
		var bNumber=$("#d11").val();
		var id=$("#d22").val();
		var bName=$("#d33").val();
		var btype=$("#d44").val();
		var bAddress=$("#d55").val();
		var bDate=$("#d66").val();
		var bstatic=$("#d77").val();
		
        //alert(id);
		
		window.location="doModifyBrandServlet?bNumber="+bNumber+"&id="+id+"&bName="+bName+"&btype="+btype+"&bAddress="+bAddress+"&bDate="+bDate+"&bstatic="+bstatic;
	}
	function showAddDialog() {
		document.getElementById("bg").style.display = 'block';
		document.getElementById("addLog").style.display = 'block';
	}
	function addLog() {		
		$("#bg").hide();
		$("#addLog").hide();
	}
</script>
</html>