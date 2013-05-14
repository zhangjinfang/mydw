<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Schema Operation</title>
<script src="js/createXML.js"></script>
</head>
<body>
<%
	response.setHeader("Cache-Control","no-cache");	
	response.setHeader("If-Modified-Since","Tus,23 Oct 2007 01:00:00 GMT");

	String path = (String)request.getParameter("path");
	String classpath = (String)request.getParameter("classpath");
	String dom = (String)request.getParameter("dom");
	String id = (String)request.getParameter("id");
	String number = (String)request.getParameter("number");
	
%>
<script type="text/javascript">
//MENU页面中dom对象对应的序号
var number = <%=number %>;
//获取在MENU页面中要保存的dom对象并化为XML格式
//var objString = window.parent.frames["menu"].xmlDocArr[number].selectSingleNode("//Measure[@name='Warehouse Profit']").getAttribute("column");
//var objString = objString.replace(/\"/g,'&quot;');
//window.parent.frames["menu"].xmlDocArr[number].selectSingleNode("//Measure[@name='Warehouse Profit']").setAttribute("column",objString);

//window.parent.frames["menu"].xmlDocArr[number].selectSingleNode("//Measure[@name='Warehouse Profit']").setAttribute("column",objString);
//var objxmlDom = window.parent.frames["menu"].xmlDocArr[number].selectSingleNode("//Measure[@name='Warehouse Profit']").xml.replace(/'&quot;'/g,'\"');
var objxmlDom = window.parent.frames["menu"].xmlDocArr[number].xml;

//获取在MENU页面中要保存的dom对象的文件路径
var objxmlPath = window.parent.frames["menu"].xmlDocPath[number];

</script>
<input type="button" value="save Schema" onclick="createXML(objxmlPath,objxmlDom);">
</body>
</html>