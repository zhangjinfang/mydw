<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
 
<html> 
	<head>
		<title>JSP for CreateOdbcForm form</title>
	</head>
	<body>
		<html:form action="/createOdbc"> 
		data_source_name : <html:text property="data_source_name"/><html:errors property="data_source_name"/><br/> 
			desripton:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <html:text property="desripton"/><html:errors property="desripton"/><br/>
			
			path :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <html:text property="path"/><html:errors property="path"/><br/>
			<html:submit/><html:cancel/>
		</html:form>
	</body>
</html>

