<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="/WEB-INF/mytag.tld" prefix="mytag"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String schemaName = (String) request.getParameter("schemaName");
	
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>Ԥ�������</title>
		
	</head>

	<body>
		<h1>
			Ԥ�������
		</h1>

		<br>
	
			<table align="center">
				<tr>
					<td>
						���ݲֿ�ģʽ���ƣ�<%=schemaName%>
					</td>
					<td>
						<html:hidden property="schemaName" value="<%=schemaName%>"/>

					</td>
				</tr>
				<tr>
				<td>
					���������ƣ�
				</td>
				<td>
					<select property="cubename">
						
						<mytag:yujisuan1 />
					</select>
						

				</td>
				</tr>
	
	


	
	
	
	
	</body>
</html>
