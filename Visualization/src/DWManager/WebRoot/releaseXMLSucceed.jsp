<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'releaseXMLSucceed.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		function clicks(){
			var win = top.frames[0].window;
			win.location.href = "menu.jsp";
		}
	</script>
  </head>
  
  <body onload="clicks()">
    <table align="center">
    	<tr>
    		<td><font size="5" color="red">发布成功</font></td>
    	</tr>
    	<tr>
    		<td align="center"><input type="button" value="确定" onclick="" ></td>
    	</tr>
    </table>
  </body>
</html>
