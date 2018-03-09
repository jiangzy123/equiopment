<%@page import="com.ifly.pojo.Brand"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>品牌管理</title>
<link rel="stylesheet" type="text/css" href="css/list.css">
<script src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
			function checkAll(){
				var checkAll = document.getElementById("checkAll");
				// getAttribute 获取的属性是死的，不能够变化。
				var flag = checkAll.checked;
				var checkboxArr = document.getElementsByClassName("checkbox");
				for (var p = 0, size = checkboxArr.length; p < size; p++){
					checkboxArr[p].checked = flag;
				}
			}
		</script>
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
			<div id="list" class="list">
				<table id="tb">
					
					<tr>
						<th style="width:20px;"><input type="checkbox" id="checkAll" v="" onclick="checkAll()" /> </th>
						<th>品牌名称</th>
		                  <th>供货电话</th>
		                  <th>生产厂商</th>
		                 
		         	
					</tr>
					<tbody id = "listTable">
			
		            </tbody>
				</table>
			</div>
			<div class="footer">
				<div class="content">
					<a href="javascript:void(0)" class="btn" onclick="showAddDialog()">新增</a>
					<a href="javascript:void(0)" class="btn" onclick="delRow()">删除</a>
					<a href="javascript:void(0)" class="btn" onclick="showupsetDialog()">修改</a>
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
				<caption>新增日志</caption>
				<tr>
					<td><label>品牌名称</label></td>
					<td>
						<input id="id1" />
					</td>
				</tr>
				<tr>
					<td><label>供货电话</label></td>
					<td>
						<input id="id2" />
					</td>
				</tr>
				<tr>
					<td><label>生产厂商</label></td>
					<td><input id="id3" /></td>
				</tr>				
				<tr>
					<td colspan="2"><a href="javascript:void(0)" class="btn" onclick="addLog()">新增</a></td>
				</tr>
			</table>
		</div>
		<div class="addLog" id="upset">
			<table cellpadding="0" border="0" cellspacing="2">
				<caption>修改日志</caption>
				<tr>
					<td><label>品牌名称</label></td>
					<td>
						<input id="d11" />
					</td>
				</tr>
				<tr>
					<td><label>供货电话</label></td>
					<td>
						<input id="d22" />
					</td>
				</tr>
				<tr>
					<td><label>生产厂商</label></td>
					<td><input id="d33" /></td>
				</tr>				
				<tr>
					<td colspan="2"><a href="javascript:void(0)" class="btn" onclick="upset()">确认修改</a></td>
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
</body>
<script type="text/javascript">
		//将json的文件解析出来
			function loadJQueryXMLDoc(jsonurl){
				var dd;
				$.ajax({
					url:jsonurl,
					async:false,
					type:"get",
					dateType:"json",
					success:function(data){
						dd=data;					
					}
				});
				return dd;
			}
								

					var jsd=loadJQueryXMLDoc("data.json");
		//查询
		$("#search").click(function(){
			
					var jsond=jsd;
					//console.log(jsond);
					var d1=$("#d1").val();
					
					//console.log(d1+"+++"+d2);
					
					var arrss=new Array();				
					for(var i=0;i<jsond.length;i++){
						if(d1==jsond[i].name){
							//console.log(jsond[i].ftime+"+==+"+jsond[i].qtime);
							arrss.push(jsond[i]);							
						}
					}
					console.log(arrss);
					//$("#listTable").html("");
					
					$("#listTable").children().remove();
					init(arrss);
				});	
							
		function init(jsonHTML) {
			var html ="";
			var jsonArr = jsonHTML;
			//console.log(jsonArr);
			for (var p = 0; p <jsonArr.length; p++){
				var _html = '<tr>'+
	            '<td><input tabindex="10" type="checkbox" class="checkbox" /> </td>'+
	                '<td>'+jsonArr[p].name+'</td>'+
	                '<td>'+jsonArr[p].phone+'</td>'+
	                '<td>'+jsonArr[p].maker+'</td>'+	                	               
	            '</tr>';	            	            	            	            	           	          	               
		         html+=_html;
			}
			$("#listTable").append(html);	
		}
		init(jsd);
		
		
		function showAddDialog(){				
			document.getElementById("bg").style.display = 'block';
			document.getElementById("addLog").style.display = 'block';
			}
		//增加
		function addLog(){
			var name=$("#id1").val();
			var phone=$("#id2").val();
			var maker=$("#id3").val();
		
			$("#bg").hide();
			$("#addLog").hide(); 
			//在第一位置上插入
  			jsd.splice(0,0,{name,phone,maker})			
			$("#listTable").children().remove();
					init(jsd);
		}
		
		// 删除功能
			function delRow(){
				
				
				var checkboxArr = $(".checkbox");
				var len = checkboxArr.length;				
				var a;
				for (var p = 1; p < len; p++){					
					if(checkboxArr[p].checked){						
						a=p;
					}
				}
			   jsd.splice(a,1);
			   
			   $("#listTable").children().remove();
					init(jsd);	
			   		
			}
			
			//检索被选中元素的位置
			function findindex(){
				var checkboxArr = $(".checkbox");
				var len = checkboxArr.length;
				var a=-1;								
				for (var p = 1; p < len; p++){									
					if(checkboxArr[p].checked){						
						a=p;
						break;
					}
				}
				return a;
			}
			
			//修改，将被选中的元素信息显示到修改框中
			function showupsetDialog(){				
				
				var a=findindex();								
												
				if(a==-1){
					alert("每次只能修改一条记录");
				}else{					
					
				var id1=document.getElementById("d11");
				var id2=document.getElementById("d22");
				var id3=document.getElementById("d33");
				
				
				id1.value=jsd[a].name;
				id2.value=jsd[a].phone;
				id3.value=jsd[a].maker;
				
					
					$("#bg").show();
				    $("#upset").show();
					
					
				}
					
	         	
			}
			//将修改好的记录替换到也面显示
			function upset(){				
				var a=findindex();	
				
				var name=$("#d11").val();
				var phone=$("#d22").val();
				var maker=$("#d33").val();
								
				
			    document.getElementById("bg").style.display = 'none';
				document.getElementById("upset").style.display = 'none';	
			    jsd.splice(a,0,{name , phone , maker})			
			    $("#listTable").children().remove();
					init(jsd);
			}
			
			
			
	</script>
</html>