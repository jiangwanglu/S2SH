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
		<script type="text/javascript" src="../../jedate/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="../../jedate/jquery.jedate.js"></script>
		<link type="text/css" rel="stylesheet" href="../../jedate/skin/jedate.css">
		<link type="text/css" rel="stylesheet" href="../../css/calander.css">
		<script type="text/javascript"  >
		var tTmp = "";
		var TmpA = "";
		var TmpB = "";
		var TmpC = "";
		var TmpD = "";
		var TmpE = "";
		var temptime = "";
		function Getseries(){
			tTmp = "";
			TmpA = "";
			TmpB = "";
			TmpC = "";
			TmpD = "";
			TmpE = "";
        	$.ajax({ 
            	type: "post",
            	dataType: "json",
            	url: "powergk.do",
            	data:{month:temptime},
            	success: function (data) {
            	var msg = eval("("+data+")");
                $.each(msg, function (i, field) {
               	tTmp += "'"+field.date.substring(5) + "',";
               	TmpA += field.power1 + ",";
               	TmpB += field.power2 + ",";
               	TmpC += field.power3 + ",";
               	TmpD += field.power4 + ",";
               	TmpE += field.power5 + ",";
            	});
            	
            	tTmp=tTmp.substring(0, tTmp.length - 1);
            	TmpA=TmpA.substring(0, TmpA.length - 1);
            	TmpB=TmpB.substring(0, TmpB.length - 1);
            	TmpC=TmpC.substring(0, TmpC.length - 1);
            	TmpD=TmpD.substring(0, TmpD.length - 1);
            	TmpE=TmpE.substring(0, TmpE.length - 1);
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
                text: '功率峰值'
                
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
                min: 0,
                title: {
                    text: '功率 (KW)'
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
                        this.x +': '+ this.y +' KW';
                }
            },
            plotOptions: {
                column: {
                    pointPadding: 0.2,
                    borderWidth: 0
                }
            },
            series: [{
                name: '1#变压器',
                data: eval("[" + TmpA + "]") 
    
            }, {
                name: '2#变压器',
                data: eval("[" + TmpB + "]") 
    
            }, {
                name: '3#变压器',
                data: eval("[" + TmpC + "]") 
    
            }, {
                name: '4#变压器',
                data: eval("[" + TmpD + "]") 
    
            }, {
                name: '5#变压器',
                data: eval("[" + TmpE + "]") 
    
            }]
        });
		}; 
		
		
		
	</script>
	</head>
	<body>
	<script src="<%=path%>/js/highcharts.js"></script>
	<script src="<%=path%>/js/modules/exporting.js"></script>
	<div style="width:100%; margin-bottom:0px; overflow:hidden;">
                    <ul>
    					<li class="datep"><input class="datainp wicon" id="date01" type="text" placeholder="YYYY-MM" value=""  readonly></li>
					</ul>
	</div>
	<div float:left>
	<div id="container" style="min-width: 90%; height: 400px; margin: 0 auto"></div>
	<script type="text/javascript"  >
	$("#date01").jeDate({
    		festival:false,
    		ishmsVal:false,
    		maxDate: $.nowDate(0),
    		format:"YYYY-MM",
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
