<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Highcharts Example</title>

		<script type="text/javascript" src="../../js/jquery.min.js"></script>
		<link href="../../css/table.css" rel="stylesheet">
		<script type="text/javascript">
		$(function () {
    		GetseriesValue();  //获取数据源信息
    		
		});
		function GetseriesValue(){
        	$.ajax({ 
            	type: "post",
            	dataType: "json",
            	data:{time:window.parent.time},  
            	url: "loaddl.do",
            	success: function (data) {
            		var msg = eval("("+data+")");
            		var tr = $("#cloneTr");
                	$.each(msg, function (i, field) {
                	//拼接json数据集字符串
                	var clonedTr = tr.clone(); 
					if(i%2==0){clonedTr.addClass("altrow")};//隔行变色
                    clonedTr.children("td").each(function(inner_index){ 
                                  
                                      //根据索引为每一个td赋值  
                                            switch(inner_index){  
                                                  case(0):   
                                                     $(this).html(i + 1);  
                                                     break;  
                                                  case(1):  
                                                     $(this).html(field.dianliuA);  
                                                     break;  
                                                 case(2):  
                                                     $(this).html(field.dianliuB);  
                                                     break;  
                                                 case(3):  
                                                     $(this).html(field.dianliuC);  
                                                     break;  
                                                 case(4):  
                                                     $(this).html(field.time);  
                                                     break;  
                                
                                           }//end switch                          
                            });//end children.each  
                            clonedTr.insertAfter(tr);
            		});

               	 	$("#cloneTr").hide();

            	}
        	});
		};
		
		
		</script>

	</head>
	<body>
	 <table id="generatedTable" class="datalist">  
            <thead>  
                <tr>  
                    <th scope="col">序号</th>  
                    <th scope="col">电流A</th>  
                    <th scope="col">电流B</th>  
                    <th scope="col">电流C</th>                               
                    <th scope="col">时间</th>                            
                </tr>  
            </thead>  
            <tbody>  
                <tr id="cloneTr">  
                   <td></td>  
                   <td></td>  
                   <td></td>  
                   <td></td>  
                   <td></td>           
                 </tr>  
             </tbody>  
 </table> 

	</body>
</html>
