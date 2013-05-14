<%@ page language="java" pageEncoding="GB2312" import="data.web.olapschema.*,
java.util.*,java.io.File,java.io.IOException,java.io.*,
org.jdom.input.*,org.jdom.*"%>

<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-nested" prefix="nested" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html locale="true">
<head>
	<html:base />

	<title>schema.jsp</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">


	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("If-Modified-Since","Tus,23 Oct 2007 01:00:00 GMT");

	//在tab.jsp中的doRequest(o)函数中定义了Session的具体内容。在这里通过.getParameter来获取。
	String selSchName = (String) request.getParameter("selSchName");
	String nodeType = (String) request.getParameter("nodeType");
	String value = (String) request.getParameter("value");
%>
<body>
	<a href="Login.jsp" target="mainPage">123</a>
	<br />
	多维数据集名称：<%=selSchName%><br />
	节点类型：<%=nodeType%><br />
	节点的值：<%=value%>
<%
	Util s=new Util();//参考data.web.olapschema中的Util.java,下面调用这个类中的一个
	                  //函数,返回selSchName对应的路径.
	String selSchPath=s.getSchemaFilePath(selSchName);
%>
	<br/>多维数据集的文件路径:<%=selSchPath %>
	

</body>

</html:html>
