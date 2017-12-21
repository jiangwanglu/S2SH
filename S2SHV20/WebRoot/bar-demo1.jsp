<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 

<html>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<head>
		<title>柱状图</title>
		<!--<script src="js/Chart.js"></script>-->
		<!--<script src="js/Chart.min.js"></script>-->
		
		<script src="js/Chart-1.0.1-beta.4.js"></script>
		<script>
			var arr1 = [];
			var arr2 = [];
			<%
			Map map = (LinkedHashMap)session.getAttribute("map");
			Iterator it=map.keySet().iterator();
			while(it.hasNext()){    
     		String key;    
     		String value;    
     		key=it.next().toString();    
     		value=(String)map.get(key);%>
     		arr1.push("<%=key%>");
     		arr2.push("<%=value%>");
     		<%    
     		System.out.println(key+"--"+value);    
			}
			%>
		
			var data = {
				labels : arr1,
				datasets : [
					{
						barItemName: "name1",
						fillColor : "rgba(220,220,220,0.5)",
						strokeColor : "rgba(220,220,220,1)",
						data : arr2
					},
					{
						barItemName: "name2",
						fillColor : "rgba(151,187,205,0.5)",
						strokeColor : "rgba(151,187,205,1)",
						data : [28,48,40,19,96,27,100,56]
					}
				]
			};
			
			var chartBar = null;
			window.onload = function() {				
				var ctx = document.getElementById("myChart").getContext("2d");
				chartBar = new Chart(ctx).Bar(data);
				
				initEvent(chartBar, clickCall);
			}
			
			function clickCall(evt){
				var activeBar = chartBar.getBarSingleAtEvent(evt);
				if ( activeBar !== null )
					alert(activeBar.label + ": " + activeBar.barItemName + " ____ " + activeBar.value);
			}
			
			function initEvent(chart, handler) {
				var method = handler;
				var eventType = "click";
				var node = chart.chart.canvas;
								
				if (node.addEventListener) {
					node.addEventListener(eventType, method);
				} else if (node.attachEvent) {
					node.attachEvent("on" + eventType, method);
				} else {
					node["on" + eventType] = method;
				}
			}
			
		</script>
	</head>


	<body> 

		<canvas id="myChart" width="800" height="400"></canvas>
	</body>
</html>