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
<title>故障申报</title>
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
				<a href="declare.jsp" class="btn1">故障单填写</a>
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
	
	

	<div class="bg" id="bg"></div>
</body>
<script type="text/javascript">
	function go(obj){
		self.location.href="<%=basePath%>logListServlet.action?currentPage="
					+ obj.innerText;
	}
	
	
	function showupsetDialog(){
		
	}

	$("#search").click(function(){
		var bid=$("#d1").val();
		alert(bid);
		window.location="doQueryBrandServlet?bid="+bid;
	})
	
	
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