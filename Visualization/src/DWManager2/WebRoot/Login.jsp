<%@ page language="java" pageEncoding="GB2312" %>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
  <head>
    <html:base />
    
    <title>Login.jsp</title>

  </head>
  
  <body>
    
  <div align="center">
	<img src="./images/logo.jpeg" align="middle"/>
	<hr>
</div>
  
    <html:form action="/login" >
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
    
    <tr>
			<td width="40%" align="right">
			<bean:message key="Login.userId"/>
		</td>
			<td width="60%">
			<html:text property="userName"/>
			<br>
		</td>
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
<div align="center">
	<hr> 
	<table align="center">
		<tr align="center">
			<td><bean:message key="footer.author"/></td>
		</tr>
		<tr align="center">
			<td><bean:message key="footer.copyright"/></td>
		</tr>
	</table>
</div>
  </body>
  

</html:html>
