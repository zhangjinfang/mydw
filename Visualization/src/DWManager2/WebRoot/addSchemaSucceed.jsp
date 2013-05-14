<%@ page language="java" pageEncoding="GB2312"%>
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

		<title>addSchemaSucceed.jsp</title>

		<script type="text/javascript">
		window.parent.frames["tree"].location.reload();

	</script>
	</head>

	<body>
		<table align="center">
			<tr>
				<td>
					<font size="5" color="red">Ìí¼ÓSchema³É¹¦</font>
				</td>
			</tr>
		</table>
	</body>
</html>
