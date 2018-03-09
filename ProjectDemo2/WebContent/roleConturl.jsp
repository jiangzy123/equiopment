<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>布局</title>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div>
<div class="sidebar-nav">
        <ul>
            <li id="li-one" class="active nav-header collapsed" data-toggle="collapse">首页</li>
           
            <li data-target=".premium-menu" data-toggle="collapse" class="nav-header collapsed">列表一</li>
                <li>
                    <ul class="premium-menu nav nav-list collapse">
                        <li id="li-two">    子列表-</li>
                        <li id="li-three">  子列表二</li>
                        <li id="li-four">   子列表三</li>
                        <li id="li-five">   子列表四</li>
                        <li id="li-six">    子列表五</li>
                        <li id="li-seven">  子列表六</li>
                    </ul>
                </li>
            <li id="li-eight" class="nav-header collapsed" data-toggle="collapse">列表二</li>
            <li id="li-nine" class="nav-header collapsed" data-toggle="collapse">列表三</li>
            <li id="li-ten" class="nav-header collapsed" data-toggle="collapse">列表四</li>
            <li id="li-eleven" class="nav-header collapsed" data-toggle="collapse">列表五</li>
        </ul>
    </div>
    <div class="content">
        <div id="matter1" >
            
            <jsp:include page="1.jsp"/>
        </div>

        <div id="matter2" style="display: none">
            <jsp:include page="declare.jsp"/>
        </div>
         <div id="matter3" style="display: none">
            <jsp:include page="partList.jsp"/>
        </div>

        
    </div>
</div>
</body>
<script>
$(document).ready(function() {
    var temp = "none";

    $("#li-one").click(function () {
        openMatter(1);
    });
    $("#li-two").click(function () {
        openMatter(2);
    });
    $("#li-three").click(function () {
        openMatter(3);
    });
    $("#li-four").click(function () {
        openMatter(4);
    });
    $("#li-five").click(function () {
        openMatter(5);
    });
    $("#li-six").click(function () {
        openMatter(6);
    });
    $("#li-seven").click(function () {
        openMatter(7);
    });
    $("#li-eight").click(function () {
        openMatter(8);
    });
    $("#li-nine").click(function () {
        openMatter(9);
    });
    $("#li-ten").click(function () {
        openMatter(10);
    });
    $("#li-eleven").click(function () {
        openMatter(11);
    });
    function openMatter(obj) {
        for (var i = 1; i < 12; i++) {
            if (i == obj) {
                temp = "block";
            } else {
                temp = "none";
            }
            document.getElementById("matter" + i).style.display = temp;

        }
    }
});
</script>
</html>