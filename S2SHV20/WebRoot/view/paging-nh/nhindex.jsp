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
		<script type="text/javascript" src="<%=path%>/js/echarts.min.js"></script>
		<script type="text/javascript"  >  
		var tTmp = "";
		var dataTmp = "";
		var dataTmp1 = "";
		var d = new Date();
		var i=0;
		
		var date=new Date;
		var year=date.getFullYear(); 
		var month=date.getMonth()+1;
		month =(month<10 ? "0"+month:month); 
		var mydate = (year.toString()+"-"+month.toString());
		$(function () {
			$("#next").attr("disabled",true);
			Get();
		});
		function Get(){
			$.ajax({
				type:"post",
				dataType:"json",
				url: "surveynh1gk.do",
				data:{timeindex:i,type:"m",datetime:mydate},
				success: function (data) {
					var msg = eval("("+data+")");
					var myChart = echarts.init(document.getElementById('container1'));
					var option = {
					    title : {
					        text: "当前月份:"+msg[0].date.split("-")[0]+"-"+msg[0].date.split("-")[1],
					        subtext: msg[0].nh+msg[0].nhair,
					        x:'center'
					    },
					    tooltip : {
					        trigger: 'item',
					        formatter: "{a} <br/>{b} : {c} ({d}%)"
					    },
					    color:[	'#B0E0E6', '#00BFFF'],
					    legend: {
					        orient: 'vertical',
					        left: 'left',
					        data: [	'其他能耗','空调能耗']
					        
					    },
					    series : [
					        {
					            name: '能耗',
					            type: 'pie',
					            radius : '80%',
					            center: ['50%', '60%'],
					            data:[
					                {value: msg[0].nh, name:'其他能耗'},
					                {value: msg[0].nhair , name:'空调能耗'}
					            ],
					            itemStyle: {
					            		normal:{
					            		label:{
					            			show:true,
					            			formatter:'{b}:{c}\n({d}%)',
					            		},
					            		labelLine:{
					            			show:true,
					            		}
					            	},
					                emphasis: {
					                    shadowBlur: 10,
					                    shadowOffsetX: 0,
					                    shadowColor: 'rgba(0, 0, 0, 0.5)'
					                }
					            }
					        }
					    ]
					};
					myChart.setOption(option);
					GetseriesValue();  //获取数据源信息 
				}
			}); 
		}
		
		function GetseriesValue(){
			tTmp = "";
			dataTmp = "";
			dataTmp1 = "";
        	$.ajax({ 
            	type: "post",
            	dataType: "json",
            	url: "surveynhgk.do",
            	data:{timeindex:i,type:"m",datetime:mydate},
            	success: function (data) {
	            	var msg = eval("("+data+")");
	                $.each(msg, function (i, field) {
		               	tTmp += "'"+field.date.substring(5,field.date.length) + "',";
		               	dataTmp += field.nh + ",";
		               	dataTmp1 += field.nhair + ",";
	            	});
	            	tTmp=tTmp.substring(0, tTmp.length - 1);
	            	dataTmp=dataTmp.substring(0, dataTmp.length - 1);
	            	dataTmp1=dataTmp1.substring(0, dataTmp1.length - 1);
	            	
	            	GetData();
            	}
        	});
		}
		
		function GetData(){
		new Highcharts.Chart({
            
            chart: {
                renderTo: 'container',
                type: 'column'
            },
    
            title: {
                text: '每月能耗信息'
            },
            exporting: {
            enabled:false
			},
            credits: {
            enabled: false
            },
    
            xAxis: {
                categories: eval("[" + tTmp + "]")
            },
    
            yAxis: {
                allowDecimals: false,
                min: 0,
                title: {
                    text: '每日能耗'
                }
            },
    
            tooltip: {
                formatter: function() {
                    return '<b>'+ this.x +'</b><br/>'+
                        this.series.name +': '+ this.y +'<br/>'+
                        '单日总能耗: '+ this.point.stackTotal;
                }
            },
    
            plotOptions: {
                column: {
                    stacking: 'normal'
                }
            },
    
            series: [{
                name: '空调能耗',
                data: eval("[" + dataTmp1 + "]"),
                stack: 'male'
            },{
                name: '其他能耗',
                color:"#408080",
                data: eval("[" + dataTmp + "]"),
                stack: 'male'
            }]
        });
		};
		function redraw() {
    	$('#container').highcharts({
    	xAxis: {
                categories: eval("[" + tTmp + "]")
            },
        series: [{
                name: '空调能耗',
                data: eval("[" + dataTmp1 + "]"),
                stack: 'male'
            },{
                name: '其他能耗',
                color:"#408080",
                data: eval("[" + dataTmp + "]"),
                stack: 'male'
            }]
    	});
		}; 
		function button1(){
			i-=1;
			if(i<0){
			$("#next").attr("disabled",false);
			}
			GetseriesValue();
			Get();
			redraw();
		};
		function button2(){
			i+=1;
			if(i==0){
			$("#next").attr("disabled",true);
			}
			GetseriesValue();
			Get();
			redraw();
		};
	</script>
	</head>
	<body>
	<script src="<%=path%>/js/highcharts.js"></script>
	<script src="<%=path%>/js/modules/exporting.js"></script>
	<div float:left>
	<button type="button" id ="pro" onclick="button1()">上个月</button>
	<button type="button" id = "next" onclick="button2()">下个月</button></div>
	<div id="container1" style="min-width: 90%; height: 350px; margin: 0 auto"></div>
	<div id="container" style="min-width: 90%; height: 400px; margin: 0 auto"></div>

	</body>
</html>
