<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'property.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <form method="post" action="addPropertySucceed.jsp">
    <table cellspacing="1" cellpadding="2" align="center" border="2" >
    	<tr>
    		<td align="center"><font size="2" face="黑体" color="blue">源文件</font></td>
    		<td align="center">聚合函数</td>
    		<td align="center">格式</td>
    		<td align="center">命名</td>
    	</tr>
    	<tr>
    		<td align="center"><%=request.getParameter("tableName") %>.<%=request.getParameter("columnName") %>
    			<input type="hidden" name="columnName" value="<%=request.getParameter("columnName") %>">
    		</td>
    		<td>
    			<select name="function">
    				<option value="sum">sum</option>
    				<option value="avg">avg</option>
    				<option value="count">count</option>
    				<option value="min">min</option>
    				<option value="max">max</option>
    			</select>
    		</td>
    		<td>
    			<select name="format">
    				<option value="standard">standard</option>
    				<option value="#,##0">#,##0</option>
    				<option value="#,##0.###">#,##0.###</option>
    			</select>
    		</td>
    		<td>
    			<input type="text" name="name" value="<%=request.getParameter("tableName") %>.<%=request.getParameter("columnName") %>">
    		</td>
    	</tr>
    	
    </table>
    <table align="center">
    <tr><td>
    <input type="submit" value="确定">
    </td></tr></table>
    </form>
  </body>
</html>
