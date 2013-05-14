<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'toTestpage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		document.onreadystatechange=function(){
			if(document.readyState != 'interactive'&&document.readyState != 'complete'){
			window.location.reload();
			}
	    	if(document.readyState == 'complete'){ 
				var win = top.frames[3].window;
				var schemaName = document.getElementById("schemaName").value;
				var cubeName = document.getElementById("cubeName").value;
				win.location.href = "testpage.jsp?schemaName=" + schemaName + "&cubeName=" + cubeName;
			}
		}
	</script>

  </head>
  <%
  	session.setAttribute("controlTestpage",true);
  	response.setHeader("Cache-Control","no-cache");	
	response.setHeader("If-Modified-Since","Tus,23 Oct 2007 01:00:00 GMT");
	
	String schemaName = (String)request.getParameter("schemaName");
	String cubeName = (String)request.getParameter("cubeName");
   %>
  <body >
    <form action="">
    	<input id="schemaName" name="schemaName" type="hidden" value="<%=schemaName %>">
    	<input id="cubeName" name="cubeName" type="hidden" value="<%=cubeName %>">
    </form>
  </body>

</html>
