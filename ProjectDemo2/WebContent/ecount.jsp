<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>故障的分类统计</title>
<script src="js/echarts.js"></script>
</head>
<body>
 <div id="main" style="width: 600px;height:400px;">
    	<div>
			<select>
			<option selected="selected">2017年</option>
			<option>2016年</option>
			<option>2015年</option>
			<option>2014年</option>
		</select>
	  <button>搜索</button>
		</div>
    </div>
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));

        // 指定图表的配置项和数据
        var option = {
            title: {
                text: '2017年故障分类统计图'
            },
            tooltip: {},
            legend: {
                data:['故障']
            },
            xAxis: {
                data: ["电子教学","办公设备","公共设施","其他"]
            },
            yAxis: {},
            series: [{
                name: '故障',
                type: 'bar',
                data: [60, 25, 10, 5]
            }]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>
</body>
</html>