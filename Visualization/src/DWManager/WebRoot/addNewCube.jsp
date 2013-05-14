<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>

<%@ include file="taglibs.jsp"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<%
		session.setAttribute("cubeName",request.getParameter("cubeName"));
	 %>

		<title>添加新数据源</title>
<script type="text/javascript" src="js/getTable.js"></script>




	</head>

	<body>
		<html:form action="/AddDataSource.do" focus="jndiName">
			<div>
				<table>
					<tr>
						<td>
							<bean:message key="addDataSource.JNDI.NAME" />
						</td>
					</tr>
					<tr>
						<td>
							<html:text property="jndiName" value="" />
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
							<html:select property="driver"
								onchange="document.form2.driver2.value=this.value">
								<html:option value="org.hsqldb.jdbcDriver">
									<bean:message key="addDataSource.driver.hsqldb" />
								</html:option>
								<html:option value="com.mysql.jdbc.NonRegisteringDriver">
									<bean:message key="addDataSource.driver.mysql1" />
								</html:option>
								<html:option value="com.mysql.jdbc.Driver">
									<bean:message key="addDataSource.driver.mysql2" />
								</html:option>
								<html:option
									value="com.mysql.jdbc.NonRegisteringReplicationDriver">
									<bean:message key="addDataSource.driver.mysql3" />
								</html:option>
								<html:option value="com.mysql.jdbc.ReplicationDriver">
									<bean:message key="addDataSource.driver.mysql4" />
								</html:option>
								<html:option value="org.gjt.mm.mysql.Driver">
									<bean:message key="addDataSource.driver.mysql5" />
								</html:option>
								<html:option value="oracle.jdbc.driver.OracleDriver">
									<bean:message key="addDataSource.driver.oracle1" />
								</html:option>
								<html:option value="oracle.jdbc.OracleDriver">
									<bean:message key="addDataSource.driver.oracle2" />
								</html:option>
								<html:option
									value="com.microsoft.sqlserver.jdbc.SQLServerDriver">
									<bean:message key="addDataSource.driver.sqlserver" />
								</html:option>
								<html:option value="sun.jdbc.odbc.JdbcOdbcDriver">
									<bean:message key="addDataSource.driver.sun" />
								</html:option>
							</html:select>
						</td>
					</tr>
				</table>
			</div>
			<div tyle="position:relative;">
				<table>
					<tr>
						<td>
							<bean:message key="addDataSource.connectString" />
						</td>
					</tr>
					<tr>
						<td>
							<span style="margin-left: 18px; width: 200px; overflow: hidden;">
								<html:select style="width:216px;margin-left:-14px;"
									property="box"
									onchange="this.parentNode.nextSibling.value=this.value,document.form2.connect2.value=this.value">
									<html:option value="jdbc:db2:DATABASE_NAME">
										<bean:message key="addDataSource.connectString.db2" />
									</html:option>
									<html:option value="jdbc:hsqldb:hsql://localhost/sampledata">
										<bean:message key="addDataSource.connectString.hsql" />
									</html:option>
									<html:option value="jdbc:mysql://localhost:PORT/DATABASE_NAME">
										<bean:message key="addDataSource.connectString.mysql" />
									</html:option>
									<html:option value="jdbc:oracle:thin:@localhost:1521:orcl">
										<bean:message key="addDataSource.connectString.oracle" />
									</html:option>
									<html:option value="jdbc:teradata://teradata.server.ip.swap">
										<bean:message key="addDataSource.connectString.teradata" />
									</html:option>
								</html:select> </span>
							<input type="text"
								style="width: 200px; position: absolute; left: 16px;"
								name="connectString" />
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
							<html:text property="userName" value="" />
						</td>
					</tr>
					<tr>
						<td>
							<bean:message key="addDataSource.password" />
						</td>
					</tr>
					<tr>
						<td>
							<html:text property="password" value="" />
						</td>

					</tr>
				</table>
			</div>
			<div>
				<table align="center">
					<tr align="center">

						<td>
							<html:submit value="确定"></html:submit>
						</td>
						<td>
							<html:cancel value="取消" property="cancel" />
						</td>
					</tr>
				</table>
			</div>

		</html:form>
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
