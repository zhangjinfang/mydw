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

	//��tab.jsp�е�doRequest(o)�����ж�����Session�ľ������ݡ�������ͨ��.getParameter����ȡ��
	String selSchName = (String) request.getParameter("selSchName");
	String nodeType = (String) request.getParameter("nodeType");
	String value = (String) request.getParameter("value");
%>
<body>
	<a href="Login.jsp" target="mainPage">123</a>
	<br />
	��ά���ݼ����ƣ�<%=selSchName%><br />
	�ڵ����ͣ�<%=nodeType%><br />
	�ڵ��ֵ��<%=value%>
<%
	Util s=new Util();//�ο�data.web.olapschema�е�Util.java,�������������е�һ��
	                  //����,����selSchName��Ӧ��·��.
	String selSchPath=s.getSchemaFilePath(selSchName);
%>
	<br/>��ά���ݼ����ļ�·��:<%=selSchPath %>
	

</body>

</html:html>
