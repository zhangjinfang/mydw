<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'createMeasures.jsp' starting page</title>
    
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
    <p><font size="5" face="����" color="#191970">��������ֵ</font>
    <br><font size="3" face="����" color="#4b0082">ѡ��������������ֵ����ʵ��,Ȼ��ѡ�����ֵ����,��ָ�����ľۺϺ���,��ʽ������.</font>
    <hr color="#8b008b">
    	<table>
    		<tr>
    			<td><font size="3" face="����" color="#000068">��ʵ��</font></td>
    		</tr>
    		<tr>
    			<td>
    				<div id="tableName"></div>
    			</td>
    		</tr>
    		<br>
    		<br>
    		<tr><td><font size="3" face="����" color="#000059">��ʵ������</font></td></tr>
    		<tr>
    			<td><div id="columnName"></div></td>
    		</tr>
    	</table>
    	
  </body>
</html>
