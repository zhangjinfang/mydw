<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="org.jdom.*"%>
<%@ page import="org.jdom.input.*"%>
<%@ page import="java.io.*"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>


		<title>Homepage</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<%
			session.setAttribute("dimentionCol", "");
			session.setAttribute("cube", "");
			session.setAttribute("measure", "");
			session.setAttribute("controlMeasureTable", true);
		%>
	</head>
	<frameset cols="20%,50%">
		<frame src="menu.jsp" name="menu" /> 
		<frame src="content.jsp" name="right" />	
	</frameset>

</html>
