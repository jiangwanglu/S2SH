<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
	  <script type="text/javascript"  >
  
	$(function () {
	 $("#btnget").click(function () {
        $.ajax({ 
            type: "post",
            dataType: "json",
            url: "loadaction.do",
            success: function (data) {
            	var msg = eval("("+data+")");
                var str = "";
                for (i in msg) {
                    str += "<tr><td>" + msg[i].id + "</td><td>" + msg[i].name + "</td><td>" + msg[i].cla + "</td><td>" + msg[i].sex + "</td><td>" + msg[i].tel + "</td></tr>";
                }
                $("tbody").append(str);
            }
        });
    });

	});
  
  </script>
  </head>

  
  <body>
    <table>
    <thead>
        <tr> 
            <td>学号</td>
            <td>姓名</td>
            <td>班别</td>
            <td>性别</td>
            <td>电话</td>
        </tr>
    </thead>
    <tbody></tbody>
</table>
<input id="btnget" type="button" value="加载数据" />

  </body>
</html>
