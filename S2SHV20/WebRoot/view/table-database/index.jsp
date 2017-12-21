<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<title>Member List</title>
<script type="text/javascript" src="../../js/jquery.min.js"></script>
<script type="text/javascript">
		var dataTmpA = "";
		var dataTmpB = "";
		var dataTmpC = "";
		$(function () {
    		GetseriesValue();  //获取数据源信息
    		
		});
		function GetseriesValue(){
        	$.ajax({ 
            	type: "post",
            	dataType: "json",
            	data:{time:"2016-12-16 08:59:30"},  
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
            		
            	}
        	});
		}
</script>
<link href="../../css/table.css" rel="stylesheet">
</style>
</head>
<body>
<table class="datalist" summary="list of members in EE Studay">
	<caption>配电数据</caption>
	
	<tr>
		<th scope="col">电流A</th>
		<th scope="col">电流B</th>
		<th scope="col">电流C</th>
		<th scope="col">时间</th>
	</tr>
	<tr>					
		<td>isaac</td>
		<td>W13</td>
		<td>Jun 24th</td>
		<td>Cancer</td>
	</tr>
	
</table>
</body>
</html>