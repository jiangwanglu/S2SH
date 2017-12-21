<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
		<title>Highcharts Example</title>
		
		<script type="text/javascript" src="../../js/jquery.min.js"></script>
		<script type="text/javascript" src="../../jedate/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="../../jedate/jquery.jedate.js"></script>
		<link type="text/css" rel="stylesheet" href="../../jedate/skin/jedate.css">
		<link type="text/css" rel="stylesheet" href="../../css/calander.css">
		<link href="../../css/table.css" rel="stylesheet">
		<script type="text/javascript">
		var temptime="";
		function GetseriesValue(){
        	$.ajax({ 
            	type: "post",
            	dataType: "json",
            	data:{time:temptime},  
            	url: "alarminfogk.do",
            	success: function (data) {
            		alert(data);
            		var msg = eval("("+data+")");
            		var tr = $("#cloneTr");
                	$.each(msg, function (i, field) {
                	//拼接json数据集字符串
                	var clonedTr = tr.clone(); 
                	
                	var unixTime=getDateForStringDate(field.eventTime);
                	unixTime.setHours((unixTime.getHours()+8), unixTime.getMinutes(), unixTime.getSeconds(), 0);
					//var timestr=unixTime.toLocaleString();
					var timestr=unixTime.getHours()+":"+unixTime.getMinutes()+":"+unixTime.getSeconds();
					
					if(i%2==0){clonedTr.addClass("altrow")};//隔行变色
                    clonedTr.children("td").each(function(inner_index){ 
                                  
                                      //根据索引为每一个td赋值  
                                            switch(inner_index){  
                                                  case(0):   
                                                     $(this).html(i + 1);  
                                                     break;  
                                                  case(1):  
                                                     $(this).html(field.tagName);  
                                                     break;  
                                                 case(2):  
                                                     $(this).html(field.alarmValue);  
                                                     break;  
                                                 case(3):  
                                                     $(this).html(field.limitValue);  
                                                     break;  
                                                 case(4):  
                                                     $(this).html(field.alarmText);  
                                                     break;
                                                 case(5):  
                                                     $(this).html(field.eventType);  
                                                     break; 
                                                 case(6):
                                                 	   
                                                     $(this).html(timestr);  
                                                     break;   
                                
                                           }//end switch                          
                            });//end children.each  
                            clonedTr.insertAfter(tr);
            		});

               	 	$("#cloneTr").hide();

            	}
        	});
		};
		function getDateForStringDate(strDate){
            //切割年月日与时分秒称为数组
            var s = strDate.split(" "); 
            var s1 = s[0].split("-"); 
            var s2 = s[1].split(":");
            if(s2.length==2){
                s2.push("00");
            }
            return new Date(s1[0],s1[1]-1,s1[2],s2[0],s2[1],s2[2]);
        }
		
		
		</script>

	</head>
	<body>
	<div style="width:100%; margin-bottom:0px; overflow:hidden;">
    	<ul>
    		<li class="datep"><input class="datainp wicon" id="date01" type="text" placeholder="YYYY-MM-DD hh:mm:ss" value=""  readonly></li>
			
		</ul>
	</div>
	 <table id="generatedTable" class="datalist">  
            <thead>  
                <tr>
                	<th scope="col">序号</th>  
                    <th scope="col">报警点</th>  
                    <th scope="col">报警值</th>  
                    <th scope="col">阈值</th>  
                    <th scope="col">报警信息</th>                               
                    <th scope="col">事件类型</th>
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
                   <td></td> 
                   <td></td>          
                 </tr>  
             </tbody>  
 	</table> 
 	<script type="text/javascript">
	$("#date01").jeDate({
    	festival:false,
    	ishmsVal:false,
    	minDate: $.nowDate(-90),
    	maxDate: $.nowDate(0),
    	format:"YYYY-MM-DD",
    	zIndex:300,
    	choosefun:function(val){temptime=val.context.value},
    	okfun:function(val){temptime=$("#date01").val();
    	GetseriesValue();}
	});
	</script>
	</body>
</html>
