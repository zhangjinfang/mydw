<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
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

		<title>My JSP 'table1.jsp' starting page</title>
   
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<script type="text/javascript" src="js/table.js"></script>
		<script type="text/javascript">
			function checkAndSubmit(){
				var table = document.getElementById("table");
				if(table.value.length < 1){
					alert("请选择表名!");
				}else{
					document.forms[0].submit();
				}
			}
		</script>
	</head>

	<body>
		<%
			//String html = (String) session.getAttribute("responseHtml");
			//String[] array = html.split("&");
			ArrayList<String> array=(ArrayList<String>)session.getAttribute("responseHtml");
			//下拉框的列名字符串
			String str = "";
			for (int i = 0; i < array.size(); i++) {
				str += "<option value='" + array.get(i) + "'>" + array.get(i)
				+ "</option>";
			}
			//session.setAttribute("measure","");   //将measure设为空
		%> 
		<form action="addProperty.jsp" method="post">
			<table>
				<tr>
					<td>
						<font face="黑体" size="3" color="blue">表名:</font>
					</td>
				</tr>
				<tr>
					<td>
						<select name="table" onchange="doRequest(this.value)"><%=str%></select>
					</td>
				</tr>
				<tr>
					<td>
						<font face="黑体" size="3" color="blue">列名:</font>
					</td>
				</tr>
				<tr>
					<td>
						<div id="column"></div>
					</td>
				</tr>
			</table>
			<input type="button" value="提交" onclick="checkAndSubmit()" />
		</form>
	</body>
</html>
