<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="WEB-INF/struts-layout.tld" prefix="layout"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<layout:html>
	
	<layout:text property="ddd" value="aaa" size="40" type="text">aaa</layout:text>
</layout:html>