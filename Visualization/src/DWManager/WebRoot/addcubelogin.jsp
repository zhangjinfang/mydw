<%@ page language="java" pageEncoding="GB18030"%>
<%@ include file="/taglibs.jsp"%>
<%@ page import="dbcon.bean" %>
<html:html>
<head>
 <%
    response.setHeader("Cache-Control","no-cache");	
	response.setHeader("If-Modified-Since","Tus,23 Oct 2007 01:00:00 GMT");

	String filepath = (String)request.getParameter("filepath");
	String schemaName = (String)request.getParameter("schemaName");
	String url = (String)request.getParameter("URL");
	String userName = (String)request.getParameter("userName");
	String passWord = (String)request.getParameter("passWord");
	String connString = (String)request.getParameter("connString");
	String connDriver = (String)request.getParameter("connDriver");
	//if(filepath!=null){
	session.setAttribute("filepath",filepath);
	session.setAttribute("schemaName",schemaName);
	session.setAttribute("url",url);
	session.setAttribute("userName",userName);
	session.setAttribute("passWord",passWord);
	session.setAttribute("connString",connString);
	session.setAttribute("connDriver",connDriver);	
	//}
	bean testConnBean=new bean();
	boolean conn=testConnBean.initializeDataConnection(connDriver, connString,
					userName, passWord);
     %>
</head>
<body>
    <!-- <a href="addcube.jsp?tablename=s">This is my JSP page.</a> <br> -->
<script type="text/javascript">
//form.submit();


if(<%=conn%>){
location.href="addcubejsp.do?tablename=s";
}
else{
location.href="ErrorPage1.jsp";
}


 
</script>
</body>
</html:html>
