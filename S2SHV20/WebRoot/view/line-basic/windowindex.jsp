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
		var dataTmpA = "";
		var dataTmpB = "";
		var dataTmpC = "";
		
		
		$(function () {
			
			//GetseriesA();  //获取数据源信息
			GetData();
			st();
    		 
    		
    		//alert("dataTmpB="+dataTmpB);
    		//alert("dataTmpC="+dataTmpC);
    		//alert("dataTmpA="+dataTmpA);
    		//GetData();
    		//redraw(); 
    		
    		/* setInterval(function () {
        	// Speed
        	GetseriesA();  //获取数据源信息
    		GetseriesB(); 
    		GetseriesC();
    		redraw(); 
    		}, 3600000); */
    		
    		
    		
		});
		function GetseriesA(){
			var d = new Date();
			var temptime = d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
			dataTmpA="";
			$.ajax({ 
            	type: "post",
            	dataType: "json",
            	url: "datenhgk.do",
            	data:{time:temptime},
            	success: function (data) {
            	var msg = eval("("+data+")");
                $.each(msg, function (i, field) {
               	dataTmpA += field.nh + ",";
            	});
            	dataTmpA=dataTmpA.substring(0, dataTmpA.length - 1);
            	GetseriesB();
            	}
        	});
		}
		function GetseriesB(){
		var d = new Date();
		d.setDate(d.getDate()-1); 
		dataTmpB="";
		var ytime = d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
		//alert("ytime1="+ytime);
			$.ajax({ 
            	type: "post",
            	dataType: "json",
            	url: "datenhgk.do",
            	data:{time:ytime},
            	success: function (data) {
            	var msg = eval("("+data+")");
                $.each(msg, function (i, field) {
               	dataTmpB += field.nh + ",";
            	});
            	dataTmpB=dataTmpB.substring(0, dataTmpB.length - 1);
            	GetseriesC();
            	}
        	});
		}
		function GetseriesC(){
		var d = new Date();
		d.setDate(d.getDate()-2);
		dataTmpC=""; 
		var ytime = d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
			$.ajax({ 
            	type: "post",
            	dataType: "json",
            	url: "datenhgk.do",
            	data:{time:ytime},
            	success: function (data) {
            	var msg = eval("("+data+")");
                $.each(msg, function (i, field) {
               	dataTmpC += field.nh + ",";
            	});
            	dataTmpC=dataTmpC.substring(0, dataTmpC.length - 1);
            	redraw();
            	}
        	});
		}
		
		function st() {
   			setInterval("GetseriesA()", 60000);
  		}
		function redraw() {
    // create the chart
    	$('#container').highcharts({
    		credits: {  
          	enabled:false  },
          	exporting: {  
            enabled:false  },
            title: {
                text: '',
                x: -20 //center
            },
            subtitle: {
                text: ' ',
                x: -20
            },
        series: [{
                name: '前天',
                data: eval("[" + dataTmpC + "]") 
            },{
                name: '昨天',
                data: eval("[" + dataTmpB + "]") 
            },{
                name: '今天',
                data: eval("[" + dataTmpA + "]") 
    
            }]
    	});
		};
		
		function GetData(){
  		var chart;
    	$(document).ready(function() {
        chart = new Highcharts.Chart({
            chart: {
                renderTo: 'container',
                type: 'line',
                
            },
            credits: {  
          	enabled:false  },
          	exporting: {  
            enabled:false  },
            title: {
                text: '',
                x: -20 //center
            },
            subtitle: {
                text: ' ',
                x: -20
            },
             xAxis: {
                categories: ['0','1', '2', '3', '4', '5', '6',
                    '7', '8', '9', '10', '11', '12'
                    , '13', '14', '15', '16', '17'
                    , '18', '19', '20', '21', '22', '23']
            }, 
            /* xAxis: {
                categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
            }, */
            
            yAxis: {
                title: {
                    text: '每小时 用电(KWh)'
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
                        this.x +'点: '+ this.y +'KWh';
                }
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'top',
                x: 0,
                y: 100,
                borderWidth: 0
            },
            series: [{
                name: '前天',
                data: [100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100] 
            },{
                name: '昨天',
                data: [100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100]  
            },{
                name: '今天',
                data: [100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100]  
    
            }]
           /*  series: [{
                name: '前天',
                data: eval("[" + dataTmpC + "]") 
            },{
                name: '昨天',
                data: eval("[" + dataTmpB + "]") 
            },{
                name: '今天',
                data: eval("[" + dataTmpA + "]") 
    
            }] */
        });
    });
    };
    	
    	
	</script>
	</head>
	<body>
	<script src="<%=path%>/js/highcharts.js"></script>
	<script src="<%=path%>/js/modules/exporting.js"></script>
	<div float:left>
	<div id="container" style="min-width: 100%; height: 200px; margin: 0 auto"></div>

	</body>
</html>
