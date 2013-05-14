<%@ page language="java"  pageEncoding="GB2312"%>

<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>

<%@ taglib uri="http://jakarta.apache.org/struts/tags-nested" prefix="nested" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html locale="true">
  <head>
    <html:base />
    
    <title>error.jsp</title>

  </head>
  
  <body>
  <%
  String message=(String)session.getAttribute("message");
  message=message.replaceAll("\n","<br/>");
   %>
    ·¢Éú´íÎó£º<%=message %>  <br>
    <c:out> </c:out>
  </body>
</html:html>
