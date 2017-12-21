<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'arch.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="<%=path%>/js/echarts.min.js"></script>
	<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
<style type="text/css">
	#main{
		position:absolute;
		top:9px
	}
	#main1{
		position:absolute;
		left:900px;
		top:9px
	}
	#main2{
		position:absolute;
		top:370px
	}
table.gridtable {
	font-family: verdana,arial,sans-serif;
	font-size:11px;
	color:#333333;
	border-width: 1px;
	border-color: #666666;
	border-collapse: collapse;
}
table.gridtable th {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #666666;
	background-color: #dedede;
}
table.gridtable td {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #666666;
	background-color: #ffffff;
}
</style>
  </head>
  <body>
  	<div id="main1" style="display:none">
  		<button type="button" id ="pro" onclick="button1()">上个月</button>
  		<button type="button" id = "next" onclick="button2()">下个月</button>
  	</div>
  	<div id="main" border="50" style="width:48%;height:40%;"></div>
	<div id="main2" border="50" style="width:99%;height:54%;"></div>
	<script type="text/javascript">
		var str = location.href;
		var date = str.split("?")[1].split("=")[1];
		var ind = 0;
		$(function(){
			if(date == "1"){
				var el = document.getElementById('main1');
				  el.style.display="block";  
			}
			if(ind==0){
				$("#next").attr("disabled",true);
			}
			m();
		});
		
		function m(){
			 var myChart = echarts.init(document.getElementById('main2'));
					var option = {
					    title: {
					        text: '设备报警个数',
					    },
					    tooltip: {
					        trigger: 'axis',
					    },
					    xAxis:  {
						    axisLabel:{
				                interval : 0,
				                rotate:20 
				            }, 
				            
					        type: 'category',
					        boundaryGap: false,
					        data:[15],
					    },
					    yAxis: {
					        type: 'value',
					        axisLabel: {
					            formatter: '{value} 条'
					        }
					    },
					    series: [
					        {
					            name:'报警个数',
					            type:'line',
					            data:[1],
					        },
					    ]
					};
					myChart.setOption(option); 
			$.ajax({
				Type:"POST",
				url:"baojgk.do",
				data:{date:date,date1:0,index:ind},
				dateType:"JSON",
				success:function(data){
					var s = "";
					var name = [];
					var msg = eval("("+data+")");
					var msg1 = eval("("+msg+")");
					for(var i=0;i<msg1.length;i++){
						if(date == 1){
							if(i == msg1.length - 1){
								s = msg1[i]+"月";
							}else{
								name.push(msg1[i]);
							}
						}else if(date == 2){
							if(i == msg1.length - 1){
								s = msg1[i]+"年";
							}else{
								name.push(msg1[i]);
							}
						}else{
							name.push(msg1[i]);
						}
					}
					
					myChart.setOption({
						title:{
							text:s,
						},
						xAxis: {
                            data: name,
                        },
					});    
				
					$.ajax({
						Type:"POST",
						url:"baojgk.do",
						data:{date:date,date1:1,index:ind},
						dateType:"JSON",
						success:function(data){
							var values = [];
							var msg = eval("("+data+")");
							var msg1 = eval("("+msg+")");
							for(var i=0;i<msg1.length;i++){
								values.push(msg1[i]);
							}
						
							myChart.setOption({
								series: {
		                            data: values,
		                        },
							});
							ma();    
						},
					}); 
				},
			});
			 
		} 
		function ma(){			
				 $.ajax({
						Type:"POST",
						url:"bao1jgk.do",
						data:{date:date,index:ind},
						dateType:"JSON",
						success:function(data){
							var s = "报警数量";
							if(date == 0){
								s = "七天的报警数量";
							}
							var taa = data.substring(1,data.length-1);
							var myChart = echarts.init(document.getElementById('main'));
				    		var option = {
				    			title:{
				    				show:true,
				    				left:'center',
				    				text:s,
				    			},
							    tooltip: {
							        trigger: 'item',
							        formatter: "{a} <br/>{b}: {c} ({d}%)"
							    },
							     graphic:{
							            type:'text',
							            left:'center',
							            top:'center',
							            style:{
							                text:taa+"报警数量",
							                textAlign:'center',
							                fontSize: '20',
							                fill:'#000',
							                width:30,
							                height:30
							            }
							        },
							    series: [
							        {
							            name:'报警数量',
							            type:'pie',
							            radius: ['60%', '80%'],
							            avoidLabelOverlap: false,
							            color: ['#B2DFEE'],
							            label: {
							                normal: {
							                    show: false,
							                    position: 'center'
							                },
							                emphasis: {
							                    show: true,
							                    textStyle: {
							                        fontSize: '30',
							                        fontWeight: 'bold'
							                    }
							                }
							            },
							            labelLine: {
							                normal: {
							                    show: false
							                }
							            },
							            data:[
							                {value:taa, name:'报警数'},
							            ]
							        }
							    ]
							};
							myChart.setOption(option); 
						},
				}); 
		}
		function button1(){
			ind-=1;
			if(ind<0){
				$("#next").attr("disabled",false);
			}
			
			m();
		};
		function button2(){
			ind+=1;
			if(ind==0){
				$("#next").attr("disabled",true);
			}
		
			m();
		};
	</script>
  </body>
</html>