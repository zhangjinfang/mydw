<%@ page language="java" contentType="text/html; charset=gb2312" pageEncoding="gb2312"%>
<html>
	<head>
	<title></title>
	</head>

	<frameset cols="21%,77%">

	<frame name="tree" src="http://localhost:8080/DWManager2/foodmarttree.jsp?schemaName=<%=request.getParameter("schemaName")%>">

	
	<frame name="content" src="help.jsp">
  
	</frameset>
<body>&nbsp;
</body>
</html>