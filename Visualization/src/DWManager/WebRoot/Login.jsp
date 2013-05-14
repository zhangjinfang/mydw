<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ include file="taglibs.jsp" %>
<%@ include file="header.jsp" %>

<html:errors />
<html>
<head>
	<title>LoginPage</title>
</head>
<body>

<html:form action="/Login.do"  focus="userId"> 
	<table border="0" cellspacing="2" cellpadding="2" width="100%">
		<tr>
			<td width="40%" align="right"><bean:message key="Login.userId"/></td>
			<td width="60%"><html:text property="userId"/><br></td>
		</tr>
		<tr>
			<td align="right"><bean:message key="Login.password"/></td>
			<td><html:password property="password"/></td>
		</tr>
		<tr>
			<td align="right"><html:submit property="submit"><bean:message key="Login.submit"/></html:submit></td>
			<td align="left"><html:reset property="reset"><bean:message key="Login.reset"/></html:reset></td>
		</tr>
	</table>
</html:form>
<%@ include  file="/footer.jsp"%>
</body>
</html>