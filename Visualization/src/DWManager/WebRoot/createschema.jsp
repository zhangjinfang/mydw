<%@ page language="java" pageEncoding="GB18030"%>
<%@ include file="taglibs.jsp"%>
<html:html>
<head>
	<title>create schema</title>
	<script type="text/javascript" src="js/testDataSource.js"></script>
	<script type="text/javascript">
	<!--
	//function test(){
	//	var driver1 = document.getElementById("driver").value;
	//	var connectionstring1 = document.getElementById("connectionstring").value;
	//	var username1 = document.getElementById("username").value;
	//	var password1 = document.getElementById("password").value;         
	//	location="testschema.jsp?driver1="+driver1+"&connectionstring1="+connectionstring1+"&username1="+username1+"&password1="+password1;        
	//}
//-->
<!--
	function check(thisform){
		if(document.getElementById("schemaname").value=="")
		{
		     alert("schemaname����Ϊ��,������schemaname!");
        }else
        {
                 if(document.getElementById("connectionstring").value=="")
                 {
		              alert("connectionstring����Ϊ��,������connectionstring!");
                 }
                 else
                 { 
                           if(document.getElementById("datasourcename").value=="")
                           {
		                       alert("datasourcename����Ϊ��,������datasourcename!");
                           }
                           else
                           {
                                      thisform.submit();
                           }
                 }
         }                
	}
//-->
</script>
</head>

<body>
	<h4>
		&nbsp;&nbsp;&nbsp;&nbsp;����������Ҫ������schema���֣�
	</h4>
	<html:form action="createschema.do">
		<div>

			<table>
				<tr>
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						Schema Name
					</td>
					<td>
						<html:text property="schemaname"></html:text>
					</td>
				</tr>
			</table>

		</div>
		<h4>
			&nbsp;&nbsp;&nbsp;&nbsp;�������schema��������Ҫ��������Ӳ�����
		</h4>
		<div>
			<center>
				<table>
					<tr>
						<td align="right">
							Driver
						</td>
						<td>
							<html:select property="driver">
								<option value="org.hsqldb.jdbcDriver">
									org.hsqldb.jdbcDriver
								</option>
								<option value="com.mysql.jdbc.NonRegisteringDriver">
									com.mysql.jdbc.NonRegisteringDriver
								</option>
								<option value="com.mysql.jdbc.Driver">
									com.mysql.jdbc.Driver
								</option>
								<option value="com.mysql.jdbc.NonRegisteringReplicationDriver">
									com.mysql.jdbc.NonRegisteringReplicationDriver
								</option>
								<option value="com.mysql.jdbc.ReplicationDriver">
									com.mysql.jdbc.ReplicationDriver
								</option>
								<option value="org.gjt.mm.mysql.Driver">
									org.gjt.mm.mysql.Driver
								</option>
								<option value="oracle.jdbc.driver.OracleDriver">
									oracle.jdbc.driver.OracleDriver
								</option>
								<option value="oracle.jdbc.OracleDriver">
									oracle.jdbc.OracleDriver
								</option>
								<option value="com.microsoft.sqlserver.jdbc.SQLServerDriver">
									com.microsoft.sqlserver.jdbc.SQLServerDriver
								</option>
								<option value="sun.jdbc.odbc.JdbcOdbcDriver">
									sun.jdbc.odbc.JdbcOdbcDriver
								</option>
							</html:select>
						</td>
					</tr>
					<tr>
						<td align="right">
							Connection String
						</td>
						<td>
							<html:text property="connectionstring"></html:text>
						</td>
					</tr>
					<tr>
						<td align="right">
							DataSource Name
						</td>
						<td>
							<html:text property="datasourcename"></html:text>
						</td>
					</tr>
					<tr>
						<td align="right">
							Username
						</td>
						<td>
							<html:text property="username"></html:text>
						</td>
					</tr>
					<tr>
						<td align="right">
							Password
						</td>
						<td>
							<html:text property="password"></html:text>
						</td>

					</tr>
				</table>
			</center>
		</div>

		<br>
		<div>
			<table>
				<tr>
					<td>
						<h4>
							&nbsp;&nbsp;&nbsp;&nbsp;������԰�ť��������Դ�����Ƿ�ɹ���
						</h4>
					</td>
					<td>
						&nbsp;&nbsp;
						<input type="button" value="����" onclick="getSubmit1()"></input>
					</td>
				</tr>
			</table>
		</div>
		<br>
		<div>
			<table>
				<tr>
					<td>
						<h4>
							&nbsp;&nbsp;&nbsp;&nbsp;���ȷ����ť����schema��������谴ť�������ã�
						</h4>
					</td>
					<td>
						&nbsp;&nbsp;
						<html:button property="" onclick="check(this.form)">ȷ��</html:button>
					</td>
					<td>
						&nbsp;&nbsp;
						<html:reset>����</html:reset>
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
					<!-- 	<input type="button" value="����" onclick="getSubmit1()" /> -->
					</td>
				</tr>
			</table>
			<div id="result"></div>
		</form>
</body>
</html:html>