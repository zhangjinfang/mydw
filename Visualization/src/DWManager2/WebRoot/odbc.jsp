
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body><br><br><br><FORM METHOD=POST ACTION="odbc1.jsp"><BR><input type="button" value="data source name:" name="button3">  
  
  <input type="text" value="" name="dataSourceName">
          <br><input type="button" value="discription:" name="button4">&nbsp;  
          <input type="text" value="" name="discription"> <br>
          <input type="button" value="database file path:" name="button4">&nbsp;
          <input type="text" value="" name="filepath"> <br>&nbsp;&nbsp;&nbsp;&nbsp; <br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <input type="SUBMIT" value="OK" name="button6"> &nbsp; 
           <input type="button" value="CANCEL" name="button7"> 
  </body>
</html>
          
          
          
          
         