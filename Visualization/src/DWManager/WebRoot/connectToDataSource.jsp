<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>

<%@ include file="taglibs.jsp"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<%
		//session.setAttribute("cubeName", request.getParameter("cubeName"));
		%>
		<%
			String schemaName = request.getParameter("schemaName");
			String cubeName = request.getParameter("cubeName");
			String measureTable = request.getParameter("factTable");
			String driverName = request.getParameter("connDriver");
			String connectString = request.getParameter("connString");
			String userName = request.getParameter("userName");
			String passWord = request.getParameter("passWord");
			session.setAttribute("measureTable", measureTable);
			session.setAttribute("connDriver_", driverName);
			session.setAttribute("connString_", connectString);
			session.setAttribute("userName_", userName);
			session.setAttribute("passWord_", passWord);
			session.setAttribute("schemaName_", schemaName);
			session.setAttribute("cubeName_", cubeName);
		%>
		<title>添加新数据源</title>
		<script type="text/javascript" src="js/testDataSource.js"></script>
	</head>
	<body>
		<form id="form1" action="connectToDataSource.do">
			<div>
				<table>
					<tr>
						<td>
							<bean:message key="addDataSource.JNDI.NAME" />
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" name="schemaName" value="<%=schemaName%>">
						</td>
					</tr>
					<tr>
						<td>
							Cube Name
						<td>
					</tr>
					<tr>
						<td>
							<input type="text" name="cubeName" value="<%=cubeName%>">
						</td>
					</tr>
				</table>
			</div>
			<div>
				<table>
					<tr>
						<td>
							<bean:message key="addDataSource.driver" />
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" name="driverName" value="<%=driverName%>">
						</td>
					</tr>
				</table>
			</div>
			<div>
				<table>
					<tr>
						<td>
							<bean:message key="addDataSource.connectString" />
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" name="connectString"
								value="<%=connectString%>">
						</td>
					</tr>
				</table>
			</div>
			<div>
				<table>
					<tr>
						<td>
							<bean:message key="addDataSource.userName" />
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" name="userName" value="<%=userName%>" />
						</td>
					</tr>
					<tr>
						<td>
							<bean:message key="addDataSource.password" />
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" name="passWord" value="<%=passWord%>" />
						</td>

					</tr>
				</table>
			</div>
			<div>
				<table align="center">
					<tr align="center">
						<td>
							<div id="result"></div>
						</td>
					</tr>
					<tr align="center">

						<td>
							<input type="submit" value="连接数据源">
							<script type="text/javascript">
								//form1.submit();
							</script>
						</td>

					</tr>
				</table>
			</div>

		</form>
		<form action="test.jsp" method="get" name="form2" id="form2">
			<input type="hidden" name="driver2" value="org.hsqldb.jdbcDriver" />
			<input type="hidden" name="connect2" />
			<input type="hidden" name="userName2" />
			<input type="hidden" name="password2" />
			<table align="center">
				<tr>
					<td>
						<input type="button" value="测试" onclick="getSubmit()" />
					</td>
				</tr>
			</table>
		</form>
		<div id="table"></div>
	</body>
</html>
