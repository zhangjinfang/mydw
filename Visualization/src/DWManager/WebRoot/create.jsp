<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>

<%@ include file="taglibs.jsp"%>


<html>
	<head>
		<title>createCubePage</title>
		<script type="text/javascript" src="js/page.js"></script>
	</head>
	<body>


		<html:form action="/CreateCube.do" focus="name">

			<table border="0" cellspacing="2" cellpadding="2" width="100%">
				<tr>
					<td width="40%" align="right">
						<bean:message key="cube.name" />
					</td>
					<td width="60%">
						<html:text property="name" />
						<br>
					</td>
				</tr>
				<tr>
					<td>
						<hr>
					</td>
					<td>
						<hr>
					</td>
				</tr>

				<tr>
					<td width="40%" align="right">
						<bean:message key="selectDataSource" />
					</td>
				</tr>


			</table>

			<table>
				<tr>
					<td>
						<input type="button" value="Ìí¼Ó" onclick="addNewCube()" />
					</td>
					<td>
						<input type="button" value="±à¼­" />
					</td>
					<td>
						<input type="button" value="É¾³ı" />
					</td>
				</tr>
			</table>

		</html:form>


		<div>
		</div>
	</body>
</html>