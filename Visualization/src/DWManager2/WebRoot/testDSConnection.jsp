<%@ page language="java" pageEncoding="GB2312"
import="data.web.model.TestDSConnectionBean"%>
<html>
<head>
	<title>��������Դ����</title>
</head>
	
	
<body>
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("If-Modified-Since","Tus,23 Oct 2007 01:00:00 GMT");
	//��ȡSession������.
	String userName = (String) request.getParameter("userName");
	String passWord = (String) request.getParameter("passWord");
	String connString = (String) request.getParameter("connString");
	String connDriver = (String) request.getParameter("connDriver");

	//����һ����������Դ���ӵ���,������صĲ���,�õ����ӳɹ����Ľ��.
	TestDSConnectionBean DSConnection = new TestDSConnectionBean();
	DSConnection.setDriverName(connDriver);
	DSConnection.setConnectString(connString);
	DSConnection.setUserName(userName);
	DSConnection.setPassword(passWord);
	String result="";
	if(DSConnection.connect())
	{
		result = "��������Դ�ɹ�!";
	}
	else
	{
		result = "��������Դʧ��!";
	}
%>
<table align="center">
	<tr>
	<td><font color="red" face="����"><%=result %></font></td>
	</tr>
</table>

</body>

</html>