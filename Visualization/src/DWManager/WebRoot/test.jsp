<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="data.web.model.AddDataSourceBean"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>测试连接数据源页面</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<script type="text/javascript">
		
	</script>
	</head>

	<body>
		<%
			String driver = (String)request.getParameter("driver2");
			String connectString = (String)request.getParameter("connect2");
			String userName = (String)request.getParameter("userName2");
			if(userName == null || userName.length() < 1)
				userName = "";
			String password = (String)request.getParameter("password2");
			if(password == null || password.length() < 1)
				password = "";
			String result = null;
			
			AddDataSourceBean bean = new AddDataSourceBean();
			bean.setDriverName(driver);
			bean.setConnectString(connectString);
			bean.setUserName(userName);
			bean.setPassword(password);
			
			if(bean.connect()){
				result = "测试连接数据源成功!";
			}else{
				result = "测试连接数据源失败!";
			}
		 %>
		 <table align="center">
		 	<tr><td><font color="red" face="黑体"><%=result %></font></td></tr>
	<!-- 	 	<tr><td><input type="button" value="返回前页面" onclick="history.back()"/></td></tr> -->
		 </table>
		 
		
	</body>
</html>
