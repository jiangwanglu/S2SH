<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Highcharts tjt</title>
		<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
		<script type="text/javascript"  >
		var dataTmpA = "";
		var dataTmpB = "";
		$(function () {
    		GetseriesValue();  //获取数据源信息
		});
		
		function GetseriesValue(){
        	$.ajax({ 
            	type: "post",
            	dataType: "json",
            	url: "loadaction.do",
            	success: function (data) {
            		var msg = eval("("+data+")");
                	$.each(msg, function (i, field) {
                	//拼接json数据集字符串
                	if(i>0){
               	 	dataTmpA += field.date.date + ",";
               	 	dataTmpB += (field.electrity-msg[i-1].electrity) + ",";}
            		});
            		dataTmpB=dataTmpB.substring(0, dataTmpB.length - 1);
            		dataTmpA=dataTmpA.substring(0, dataTmpA.length - 1);
            		GetData();
            	}
        	});
		}
		
		function GetData() {
  		new Highcharts.Chart({
            chart: {
                renderTo: 'container',
                type: 'line',
                marginRight: 130,
                marginBottom: 25
            },
            title: {
                text: '月电量统计',
                x: -20 //center
            },
            subtitle: {
                text: 'Source: WorldClimate.com',
                x: -20
            },
            xAxis: {
                categories: eval("[" + dataTmpA + "]") 
            },
            yAxis: {
                title: {
                    text: 'Temperature (°C)'
                },
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            },
            tooltip: {
                formatter: function() {
                        return '<b>'+ this.series.name +'</b><br/>'+
                        this.x +': '+ this.y +'mA';
                }
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'top',
                x: -10,
                y: 100,
                borderWidth: 0
            },
            series: [{
                name: '用电量',
                data: eval("[" + dataTmpB + "]") 
            }]
        });
    };
	</script>
	</head>
	<body>
	<script src="<%=path%>/js/highcharts.js"></script>
	<script src="<%=path%>/js/modules/exporting.js"></script>
<div id="container" style="min-width: 90%; height: 400px; margin: 0 auto"></div>

	</body>
</html>
