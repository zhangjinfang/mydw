<%@ page language="java" pageEncoding="GB2312"%>

  <head>
    <title>delSchemaSuccess.jsp</title>
	<script type="text/javascript">
		var wins = top.frames[0].window;
		 wins.location.href = "tree.jsp";
	</script>
	</head>

	<body>
		<table align="center">
			<tr>
				<td>
					<font size="5" color="red">É¾³ýSchema³É¹¦</font>
				</td>
				<% 
				String message=(String)session.getAttribute("message");
				message=message.replaceAll("\n","<br />");
				%>
				<%=message %>
			</tr>
		</table>
		<script type="text/javascript">
		var wins = top.frames[0].window;
		 wins.location.href = "tree.jsp";
	</script>
	</body>
</html:html>
