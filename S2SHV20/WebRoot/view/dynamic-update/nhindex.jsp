<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Highcharts Example</title>
		<style> 
			.divcss5{text-align:center} 
		</style>
		<script type="text/javascript">
       $(function () {
            jQuery.getJSON("realnhgk.do"+"?ran="+Math.random(),function(data){
                            var msg=eval("("+data+")");
                            document.getElementById("txtHint").innerHTML=""+msg.y+"";
                            }); 
       });
    </script>
	</head>
	<body>
	<div class="divcss5"><img src="../../view/image/tu.png" /></div>
	<div class="divcss5"><span id="txtHint">KWh</div>   
	</body>
</html>
