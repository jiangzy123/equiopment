<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.ifly.pojo.Result"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html style="height: 100%">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>折线图</title>
</head>
<body style="height: 100%; margin: 0">
       <div id="container" style="height: 100%"></div>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts.min.js"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-gl/echarts-gl.min.js"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-stat/ecStat.min.js"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/dataTool.min.js"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/world.js"></script>
       <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=ZUONbpqGBsYGXNIYHicvbAbM"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/bmap.min.js"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/simplex.js"></script>
       <script type="text/javascript">
       window.onload = function(){
    	 //  window.location="doPicDateServlet";
       }
   
       //		List<Integer> list1=(List<Integer>)request.getAttribute("list1"); 
       
     
var dom = document.getElementById("container");
var myChart = echarts.init(dom);
var app = {};
option = null;
option = {
    title: {
        text: '折线图堆叠'
    },
    tooltip: {
        trigger: 'axis'
    },
    legend: {
        data:['电子设备','公共设备','教学设备','其他']
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    toolbox: {
        feature: {
            saveAsImage: {}
        }
    },
    xAxis: {
        type: 'category',
        boundaryGap: false,
        data: ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月']
    },
    yAxis: {
        type: 'value'
    },
    series: [
        {
            name:'电子设备',
            type:'line',
            stack: '总量',
            data:[123, 258, 536, 311, 425, 345, 477,224, 455, 536, 311, 425]
        },
        
        {
            name:'公共设备',
            type:'line',
            stack: '总量',
            data:[220, 182, 191, 234, 290, 330, 310,123,154,646,465,134,434,333]
        },
        {
            name:'教学设备',
            type:'line',
            stack: '总量',
            data:[150, 232, 201, 154, 190, 330, 410,433,577,267,167,158,142]
        },
        {
            name:'其他',
            type:'line',
            stack: '总量',
            data:[320, 332, 301, 334, 390, 330, 320,367,786,565,284,244]
        }
    ]
};
;
if (option && typeof option === "object") {
    myChart.setOption(option, true);
}
       </script>
   </body>
</html>