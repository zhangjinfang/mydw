<%@ page language="java" pageEncoding="GB2312"
	import="data.web.olapschema.*,org.jdom.*,java.io.*"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<html>
	<head>
		<title>JSP for SaveDSForm form</title>
	</head>
	<script Charset="gb2312" type="text/javascript" src="js/testDSConnection.txt"></script>
	<body>
		<%
			String selSchName = (String) request.getParameter("selSchName");
			//参考data.web.olapschema中的Util.java,下面调用这个类中的一个函数,返回selSchName对应的路径. 
			String selSchPath = Util.getWebRootPath() + '/'
					+ Util.getSchemaFilePath(selSchName);

			//根据路径生成File文件,进而定义schema类型的数据. 
			File schemaFile = new File(selSchPath);
			Schema myschema = null;
			//to lxw：此处需要对异常进行处理，跳转到错误页面
			try {
				myschema = new Schema(schemaFile);
			} catch (JDOMException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
			//从XML文件中取得数据源的相关参数的值
			String url = myschema.getDataSourceUrl();
			if(url==null)
				url="";
			String driver = myschema.getConnDriver();
			if(driver==null)
				driver="";
			String connString = myschema.getConnString();
			if(connString==null)
				connString="";
			String userName = myschema.getUserName();
			if(userName==null)
			   userName="";
			String passWord = myschema.getPassWord();
			if(passWord==null)
			   passWord="";
		%>
		<html:form action="/saveDS">
			连接驱动程序 : 
			<html:select property="connDriver">
				<option value="<%=driver%>"><%=driver%></option>
				<option value="com.microsoft.sqlserver.jdbc.SQLServerDriver">
					com.microsoft.sqlserver.jdbc.SQLServerDriver
				</option>
				<option value="oracle.jdbc.OracleDriver">
					oracle.jdbc.OracleDriver
				</option>
				<option value="sun.jdbc.odbc.JdbcOdbcDriver">
					sun.jdbc.odbc.JdbcOdbcDriver
				</option>
				<option value="oracle.jdbc.driver.OracleDriver">
					oracle.jdbc.driver.OracleDriver
				</option>
				<option value="org.gjt.mm.mysql.Driver">
					org.gjt.mm.mysql.Driver
				</option>
				<option value="com.mysql.jdbc.ReplicationDriver">
					com.mysql.jdbc.ReplicationDriver
				</option>
				<option value="com.mysql.jdbc.NonRegisteringReplicationDriver">
					com.mysql.jdbc.NonRegisteringReplicationDriver
				</option>
				<option value="com.mysql.jdbc.Driver">
					com.mysql.jdbc.Driver
				</option>
				<option value="com.mysql.jdbc.NonRegisteringDriver">
					com.mysql.jdbc.NonRegisteringDriver
				</option>
				<option value="org.hsqldb.jdbcDriver">
					org.hsqldb.jdbcDriver
			</html:select>
			<html:errors property="connDriver" />
			<br />
			连接URL : <html:text property="url" value="<%=url%>" name="url" />
			<html:errors property="url" />
			<br />
			连接字符串 : <html:text property="connString" value="<%=connString%>"
				name="connString" />
			<html:errors property="connString" />
			<br />
			用户名 : <html:text property="userName" value="<%=userName%>" />
			<html:errors property="userName" />
			<br />		
			密码 : <html:password property="passWord" value="<%=passWord%>" />
			<html:errors property="passWord" />
			<br />
			<html:hidden property="selSchName" value="<%=selSchName%>" />
			<html:errors property="selSchName" />
			<br />
			
			<input type="button" value="配置ODBC" onclick="popNewWin()"><input type="button" onclick="access(this.form)" value="提  交" /> <input name="button" type="button" onClick="testDSConnection()"
				value="测试连接">
		</html:form>

		<!-- 这里定义一个result的id,这样在testDSConnection.txt中就能将连接的结果传进来了。 -->
		<div id="result"></div>
	</body>
<script type="text/javascript">
	function popNewWin() {
  var newWin;
  newWin=window.open("odbc.jsp", "", "status,width=200,height=200,top=300,left=300,menubar=no,toolbar=no,location=no,scrollbars=no");
}
</script>


	<script type="text/javascript">
	//检查输入
	function access(form){
	
	var url=document.getElementById("url");
	var urlValue=url.value;
	if(urlValue == "" ){ 
			alert("连接URL不能为空！");
			return;
		}
		
	var url=document.getElementById("connString");
	var connStringValue=url.value;
	if(connStringValue == "" ){ 
			alert("连接字符串不能为空！");
			return;
		}
	
	form.submit();
	window.parent.frames["tree"].location.reload();
	}
	</script>

</html>

