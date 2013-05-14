<%@ page language="java" pageEncoding="GB2312"
import="data.web.model.TestDSConnectionBean"%>
<html>
<head>
	<title>测试数据源连接</title>
</head>
	
	
<body>
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("If-Modified-Since","Tus,23 Oct 2007 01:00:00 GMT");
	//获取Session的内容.
	String userName = (String) request.getParameter("userName");
	String passWord = (String) request.getParameter("passWord");
	String connString = (String) request.getParameter("connString");
	String connDriver = (String) request.getParameter("connDriver");

	//定义一个测试数据源连接的类,传入相关的参数,得到连接成功与否的结果.
	TestDSConnectionBean DSConnection = new TestDSConnectionBean();
	DSConnection.setDriverName(connDriver);
	DSConnection.setConnectString(connString);
	DSConnection.setUserName(userName);
	DSConnection.setPassword(passWord);
	String result="";
	if(DSConnection.connect())
	{
		result = "连接数据源成功!";
	}
	else
	{
		result = "连接数据源失败!";
	}
%>
<table align="center">
	<tr>
	<td><font color="red" face="黑体"><%=result %></font></td>
	</tr>
</table>

</body>

</html>