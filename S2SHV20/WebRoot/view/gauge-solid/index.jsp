<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
		<title>Highcharts Example</title>

		<script type="text/javascript" src="../../js/jquery.min.js"></script>
		<style type="text/css">
.highcharts-yaxis-grid .highcharts-grid-line {
	display: none;
}
		</style>
		<script type="text/javascript">
$(function () {

    var gaugeOptions = {

        chart: {
            type: 'solidgauge'
        },

        title: null,

        pane: {
            center: ['50%', '85%'],
            size: '140%',
            startAngle: -90,
            endAngle: 90,
            background: {
                backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || '#EEE',
                innerRadius: '60%',
                outerRadius: '100%',
                shape: 'arc'
            }
        },

        tooltip: {
            enabled: false
        },

        // the value axis
        yAxis: {
            stops: [
                [0.1, '#55BF3B'], // green
                [0.5, '#DDDF0D'], // yellow
                [0.9, '#DF5353'] // red
            ],
            lineWidth: 0,
            minorTickInterval: null,
            tickAmount: 2,
            title: {
                y: -70
            },
            labels: {
                y: 16
            }
        },

        plotOptions: {
            solidgauge: {
                dataLabels: {
                    y: 5,
                    borderWidth: 0,
                    useHTML: true
                }
            }
        }
    };

    // The speed gauge
    $('#container-speed').highcharts(Highcharts.merge(gaugeOptions, {
        yAxis: {
            min: 0,
            max: 100,
            title: {
                text: '负载率'
            }
        },

        credits: {
            enabled: false
        },

        series: [{
            name: 'Speed',
            data: [80],
            dataLabels: {
                format: '<div style="text-align:center"><span style="font-size:25px;color:' +
                    ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y}</span><br/>' +
                       '<span style="font-size:12px;color:silver">%</span></div>'
            },
            tooltip: {
                valueSuffix: ' %'
            }
        }]

    }));

    // Bring life to the dials
    setInterval(function () {
        // Speed
        var chart = $('#container-speed').highcharts();
        var point;
        var newVal;

        if (chart) {
            point = chart.series[0].points[0];
            jQuery.getJSON("fuzaied.do"+"?ran="+Math.random(),function(data){
                            var msg=eval("("+data+")");
                            newVal=parseFloat(msg.x);
                            point.update(newVal);
                            }); 
            
        };
    }, 60000);


});
		</script>
	</head>
	<body>
<script src="../../js/highcharts.js"></script>
<script src="../../js/highcharts-more.js"></script>

<script src="../../js/modules/solid-gauge.js"></script>

<div style="width: 320px; height: 215px; margin: 0 auto">
    <div id="container-speed" style="width: 300px; height: 200px; float: left"></div>
</div>


	</body>
</html>
