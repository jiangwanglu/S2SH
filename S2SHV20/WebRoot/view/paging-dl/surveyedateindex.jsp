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
		<script type="text/javascript" src="../../jedate/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="../../jedate/jquery.jedate.js"></script>
		<link type="text/css" rel="stylesheet" href="../../jedate/skin/jedate.css">
		<link type="text/css" rel="stylesheet" href="../../css/calander.css">
		
		<script type="text/javascript">
		var dataTmp = "";
		var dataTmpA = "";
		var dataTmpB = "";
		var dataTmpC = "";
		var temptime = "";
		
		function Getseries(){
			$("#jinx1").attr("disabled",true);
			$("#jinx2").attr("disabled",true);
			$("#jinx3").attr("disabled",true);
			$("#jinx4").attr("disabled",true);
			$("#jinx5").attr("disabled",true);
			$.ajax({ 
            	type: "post",
            	dataType: "json",
            	data:{time:temptime},  
            	url: "surveymacgk.do",
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
            			}else if(i=="4"){
            			$("#jinx4").attr("disabled",false);
            			}else if(i=="5"){
            			$("#jinx5").attr("disabled",false);
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
        	$.ajax({ 
            	type: "post",
            	dataType: "json",
            	url: "surveygk.do",
            	data:{time:temptime,flag:index},
            	success: function (data) {
            	dataTmp = "";
				dataTmpA = "";
				dataTmpB = "";
				dataTmpC = "";
            		var msg = eval("("+data+")");
                	$.each(msg, function (i, field) {
               	 	dataTmp += "'"+field.time + "',";
               	 	dataTmpA += field.dianliuA+ ",";
               	 	dataTmpB += field.dianliuB+ ",";
               	 	dataTmpC += field.dianliuC+ ",";
            		});
            		dataTmpB=dataTmpB.substring(0, dataTmpB.length - 1);
            		dataTmpA=dataTmpA.substring(0, dataTmpA.length - 1);
            		dataTmpC=dataTmpC.substring(0, dataTmpC.length - 1);
            		dataTmp=dataTmp.substring(0, dataTmp.length - 1);
            		GetData();
            	}
        	});
		};
		
		function GetData(){
  		new Highcharts.Chart({
            chart: {
                renderTo: 'container',
                type: 'line',
                marginRight: 130,
                marginBottom: 25
            },
            title: {
                text: '历史日电流',
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
                color:"#FFFF00",
                data: eval("[" + dataTmpA + "]") 
            },{
                name: '电流B',
                color:"#00FF00",
                data: eval("[" + dataTmpB + "]") 
            },{
                name: '电流C',
                color:"#ff0000",
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
		function onbutton4() {
			GetseriesValue(4);
			redraw();
		};
		function onbutton5() {
			GetseriesValue(5);
			redraw();
		};
	</script>
	</head>
	<body>
	<script src="<%=path%>/js/highcharts.js"></script>
	<script src="<%=path%>/js/modules/exporting.js"></script>
	<div style="width:100%; margin-bottom:0px; overflow:hidden;">
                    <ul>
    					<li class="datep"><input class="datainp wicon" id="date01" type="text" placeholder="YYYY-MM-DD" value=""  readonly></li>
					</ul>
	</div>
	</div>
	<div style="float:left">
	<input type="button" value="1#进线" id="jinx1" disabled="true" onclick="onbutton1()"/>
	<input type="button" value="2#进线" id="jinx2" disabled="true" onclick="onbutton2()"/>
	<input type="button" value="3#进线" id="jinx3" disabled="true" onclick="onbutton3()"/>
	<input type="button" value="4#进线" id="jinx4" disabled="true" onclick="onbutton4()"/>
	<input type="button" value="5#进线" id="jinx5" disabled="true" onclick="onbutton5()"/>
	</div>
	<div id="container" style="min-width: 90%; height: 500px; margin: 0 auto"></div>
	
	<script type="text/javascript"  >
	$("#date01").jeDate({
    		festival:false,
    		ishmsVal:false,
    		maxDate: $.nowDate(0),
    		format:"YYYY-MM-DD",
    		zIndex:300,
    		choosefun:function(val){temptime=val.context.value},
    		okfun:function(val){
    		temptime=$("#date01").val();
    		Getseries();
    		}
	});
	
	</script>

	</body>
</html>
