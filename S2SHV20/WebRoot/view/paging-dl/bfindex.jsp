<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Highcharts Example</title>

		<script type="text/javascript" src="../../js/jquery.min.js"></script>
		<script type="text/javascript">
		var dataTmpA = "";
		var dataTmpB = "";
		var dataTmpC = "";
		$(function () {
    		GetseriesValue();  //获取数据源信息
    		alert(window.parent.time);
		});
		function GetseriesValue(){
        	$.ajax({ 
            	type: "post",
            	dataType: "json",
            	data:{time:window.parent.time},  
            	url: "loaddl.do",
            	success: function (data) {
            		var msg = eval("("+data+")");
                	$.each(msg, function (i, field) {
                	//拼接json数据集字符串
               	 	dataTmpA += field.dianliuA + ",";
               	 	dataTmpB += field.dianliuB + ",";
               	 	dataTmpC += field.dianliuC + ",";
            		});
            		dataTmpB=dataTmpB.substring(0, dataTmpB.length - 1);
            		dataTmpA=dataTmpA.substring(0, dataTmpA.length - 1);
            		dataTmpC=dataTmpC.substring(0, dataTmpC.length - 1);
            		GetData();
            	}
        	});
		}
		
		function GetData() {
  		new Highcharts.Chart({
            chart: {
                renderTo: 'container',
                type: 'spline'
            },
            title: {
                text: 'Wind speed during two days'
            },
            subtitle: {
                text: 'October 6th and 7th 2009 at two locations in Vik i Sogn, Norway'
            },
            xAxis: {
                type: 'datetime'
            },
            yAxis: {
                title: {
                    text: 'Wind speed (m/s)'
                },
                min: 0,
                minorGridLineWidth: 0,
                gridLineWidth: 0,
                alternateGridColor: null,
                plotBands: [{ // Light air
                    from: 3,
                    to: 200,
                    color: 'rgba(68, 170, 213, 0.1)',
                    label: {
                        text: 'Light air',
                        style: {
                            color: '#606060'
                        }
                    }
                }, { // Light breeze
                    from: 200,
                    to: 400,
                    color: 'rgba(0, 0, 0, 0)',
                    label: {
                        text: 'Light breeze',
                        style: {
                            color: '#606060'
                        }
                    }
                }, { // Gentle breeze
                    from: 400,
                    to: 600,
                    color: 'rgba(68, 170, 213, 0.1)',
                    label: {
                        text: 'Gentle breeze',
                        style: {
                            color: '#606060'
                        }
                    }
                }, { // Moderate breeze
                    from: 600,
                    to: 800,
                    color: 'rgba(0, 0, 0, 0)',
                    label: {
                        text: 'Moderate breeze',
                        style: {
                            color: '#606060'
                        }
                    }
                }, { // Fresh breeze
                    from: 800,
                    to: 1000,
                    color: 'rgba(68, 170, 213, 0.1)',
                    label: {
                        text: 'Fresh breeze',
                        style: {
                            color: '#606060'
                        }
                    }
                }, { // Strong breeze
                    from: 1000,
                    to: 1200,
                    color: 'rgba(0, 0, 0, 0)',
                    label: {
                        text: 'Strong breeze',
                        style: {
                            color: '#606060'
                        }
                    }
                }, { // High wind
                    from: 1200,
                    to: 1500,
                    color: 'rgba(68, 170, 213, 0.1)',
                    label: {
                        text: 'High wind',
                        style: {
                            color: '#606060'
                        }
                    }
                }]
            },
            tooltip: {
                formatter: function() {
                        return ''+
                        Highcharts.dateFormat('%H:%M:%S', this.x) +': '+ this.y +' A';
                }
            },
            plotOptions: {
                spline: {
                    lineWidth: 4,
                    states: {
                        hover: {
                            lineWidth: 5
                        }
                    },
                    marker: {
                        enabled: false,
                        states: {
                            hover: {
                                enabled: true,
                                symbol: 'circle',
                                radius: 5,
                                lineWidth: 1
                            }
                        }
                    },
                    pointInterval: 1000, // one hour
                    pointStart: Date.UTC(2009, 9, 6, 0, 0, 0)
                }
            },
            series: [{
                name: '电流A',
                data: eval("[" + dataTmpA + "]") 
    
            }, {
                name: '电流B',
                data: eval("[" + dataTmpB + "]") 
            },{
                name: '电流C',
                data: eval("[" + dataTmpC + "]") 
            }]
            ,
            navigation: {
                menuItemStyle: {
                    fontSize: '10px'
                }
            }
        });
    	};
		</script>
	</head>
	<body>
<script src="../../js/highcharts.js"></script>
<script src="../../js/modules/exporting.js"></script>

<div id="container" style="min-width: 400px; height: 400px; margin: 0 auto"></div>

	</body>
</html>
