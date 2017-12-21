<!--//当天空调电流  -->
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>Highcharts tjt</title>
		<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
		<script type="text/javascript"  >
		var dataTmp = "";
		var dataTmpA = "";
		var dataTmpB = "";
		var dataTmpC = "";
		var wenduTmpA = "";
		var wenduTmpB = "";
		var wenduTmpC = "";
		var wenduTmpD = "";
		var d = new Date();
		var str = d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
		$(function () {
    		Getseries();  //获取数据源信息
		});
		
		function Getseries(){
			$("#jinx1").attr("disabled",true);
			$("#jinx2").attr("disabled",true);
			$("#jinx3").attr("disabled",true);
			$.ajax({ 
            	type: "post",
            	dataType: "json",
            	data:{time:str},  
            	url: "surveyairmacgk.do",
            	success: function (data) {
            		
            		var msg = eval("("+data+")");
            		var jsons = eval(data);
            		var index=new Array();
            		for (var key in jsons){
            			var i=jsons[key];
            			index.push(i);
            			if(i=="1"){
            			$("#jinx1").attr("disabled",false);
            			}else if(i=="2"){
            			$("#jinx2").attr("disabled",false);
            			}else if(i=="3"){
            			$("#jinx3").attr("disabled",false);
            			}		
            		}
            		if(index.length>0){
            			GetseriesValue(index[0]);
            			redraw();
            			
            		}
  					
            	}
        	});
		}
		
		
		function GetseriesValue(index){
			var d = new Date();
			var str = d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
        	$.ajax({ 
            	type: "post",
            	dataType: "json",
            	url: "airsurveygk.do",
            	data:{time:str,flag:index},
            	success: function (data) {
            	dataTmp = "";
				dataTmpA = "";
				dataTmpB = "";
				dataTmpC = "";
				wenduTmpA = "";
				wenduTmpB = "";
				wenduTmpC = "";
				wenduTmpD = "";
            		var msg = eval("("+data+")");
                	$.each(msg, function (i, field) {
               	 	dataTmp += "'"+field.time + "',";
               	 	dataTmpA += field.dianliuA+ ",";
               	 	dataTmpB += field.dianliuB+ ",";
               	 	dataTmpC += field.dianliuC+ ",";
               	 	wenduTmpA +=field.wenduldj+",";
               	 	wenduTmpB +=field.wenduldc+",";
               	 	wenduTmpC +=field.wendulqj+",";
               	 	wenduTmpD +=field.wendulqc+",";
            		});
            		wenduTmpA=wenduTmpA.substring(0, wenduTmpA.length - 1);
            		wenduTmpB=wenduTmpB.substring(0, wenduTmpB.length - 1);
            		wenduTmpC=wenduTmpC.substring(0, wenduTmpC.length - 1);
            		wenduTmpD=wenduTmpD.substring(0, wenduTmpD.length - 1);
            		dataTmpB=dataTmpB.substring(0, dataTmpB.length - 1);
            		dataTmpA=dataTmpA.substring(0, dataTmpA.length - 1);
            		dataTmpC=dataTmpC.substring(0, dataTmpC.length - 1);
            		dataTmp=dataTmp.substring(0, dataTmp.length - 1);
            		GetData();
            		Getwendu();
            	}
        	});
		}
		function Getwendu(){
		new Highcharts.Chart({
            chart: {
                renderTo: 'containerwendu',
                type: 'column'
            },
            title: {
                text: '今日温度'
                
            },
            exporting: {
            enabled:false
			},
            credits: {
            enabled: false
            },
            xAxis: {
                categories: eval("[" + dataTmp + "]")
            },
            yAxis: {
                min: 0,
                title: {
                    text: '温度 (℃)'
                }
            },
            legend: {
                layout: 'vertical',
                backgroundColor: '#FFFFFF',
                align: 'left',
                verticalAlign: 'top',
                x: 100,
                y: 70,
                floating: true,
                shadow: true
            },
            tooltip: {
                formatter: function() {
                    return ''+
                        this.x +': '+ this.y +' ℃';
                }
            },
            plotOptions: {
                column: {
                    pointPadding: 0.2,
                    borderWidth: 0
                }
            },
                series: [{
                name: '冷冻进水',
                data: eval("[" + wenduTmpA + "]") 
    
            }, {
                name: '冷冻出水',
                data: eval("[" + wenduTmpB + "]") 
    
            }, {
                name: '冷却进水',
                data: eval("[" + wenduTmpC + "]") 
    
            }, {
                name: '冷却出水',
                data: eval("[" + wenduTmpD + "]") 
    
            }]
        });
		}; 
		function GetData() {
  		new Highcharts.Chart({
            chart: {
                renderTo: 'container',
                type: 'line',
                marginRight: 130,
                marginBottom: 25
            },
            title: {
                text: '今日电流',
                x: -20 //center
            },
            exporting: {
            enabled:false
			},
            credits: {
            enabled: false
            },
            
            xAxis: {
                categories: eval("[" + dataTmp + "]") 
            },
            yAxis: {
                title: {
                    text: '电流 (A)'
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
                        this.x +': '+ this.y +'A';
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
                name: '电流A',
                data: eval("[" + dataTmpA + "]") 
            },{
                name: '电流B',
                data: eval("[" + dataTmpB + "]") 
            },{
                name: '电流C',
                data: eval("[" + dataTmpC + "]") 
            }]
        });
    };
    
    function redraw() {
    // create the chart
    	$('#container').highcharts({
        series:  [{
                name: '电流A',
                data: eval("[" + dataTmpA + "]") 
    
            }, {
                name: '电流B',
                data: eval("[" + dataTmpB + "]") 
            },{
                name: '电流C',
                data: eval("[" + dataTmpC + "]") 
            }],
    	});
    	
    	$('#containerwendu').highcharts({
        series: [{
                name: '冷冻进水',
                data: eval("[" + wenduTmpA + "]") 
    
            }, {
                name: '冷冻出水',
                data: eval("[" + wenduTmpB + "]") 
    
            }, {
                name: '冷却进水',
                data: eval("[" + wenduTmpC + "]") 
    
            }, {
                name: '冷却出水',
                data: eval("[" + wenduTmpD + "]") 
    
            }],
    	});
		};
    	
    	function onbutton1() {
			GetseriesValue(1);
			redraw();
		};
		function onbutton2() {
			GetseriesValue(2); 
			redraw();
		};
		function onbutton3() {
			GetseriesValue(3);
			redraw();
		};
		
	</script>
	</head>
	<body>
	<script src="<%=path%>/js/highcharts.js"></script>
	<script src="<%=path%>/js/modules/exporting.js"></script>
	</div>
	<div style="float:left">
	<input type="button" value="1#空调" id="jinx1" disabled="true" onclick="onbutton1()"/>
	<input type="button" value="2#空调" id="jinx2" disabled="true" onclick="onbutton2()"/>
	<input type="button" value="3#空调" id="jinx3" disabled="true" onclick="onbutton3()"/>
	</div>
	<div id="container" style="min-width: 90%; height: 600px; margin: 0 auto"></div>
	<div id="containerwendu" style="min-width: 90%; height: 400px; margin: 0 auto"></div> 

	</body>
</html>
