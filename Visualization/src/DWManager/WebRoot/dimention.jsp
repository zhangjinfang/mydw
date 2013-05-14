<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@page language="java" import="java.sql.*"%>
<%@page import="data.web.model.GetTablesBean;"%>



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

		<title>Dimention</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<script type="text/javascript">
		var htmlStr = "";
		var columnNames = "";
		var n = 0;
		
		function selectToDimention(columnName){
			n = n + 1;
			//alert(columnName);
			if(columnNames != ""){
				columnNames += "&" + columnName; 
			}else{
				columnNames = columnName;
			}
			var div = document.getElementById("levels");
			if(htmlStr != ""){
				htmlStr += "<p>" + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size='2' face='����' color='blue'>LEVEL��:</font><input type='text' name='level&" + columnName + "&" + n + "'>&nbsp;&nbsp;<font size='2' face='����' color='blue'>����:</font><input name='' type='text' disabled='disabled' value='" + columnName + "' name='column&" + columnName + "'>&nbsp;&nbsp;<font size='2' face='����' color='blue'>uniqueMembers:</font>" + "<select name='uniqueMembers&" + columnName + "&" + n + "'><option value='true'>true</option><option value='false'>false</option></select><br>";
			}else{
				htmlStr = "<p>" + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size='2' face='����' color='blue'>LEVEL��:</font><input type='text' name='level&" + columnName + "&" + n + "'>&nbsp;&nbsp;<font size='2' face='����' color='blue'>����:</font><input type='text' disabled='disabled' value='" + columnName + "' name='column&" + columnName + "'>&nbsp;&nbsp;<font size='2' face='����' color='blue'>uniqueMembers:</font>" + "<select name='uniqueMembers&" + columnName + "&" + n + "'><option value='true'>true</option><option value='false'>false</option></select><br>";
			}
			div.innerHTML = htmlStr;
		}
		function validateAndSubmit(myForm){
			var dimension = document.getElementById("dimentionName").value;
			var hierarchy = document.getElementById("hierarchyName").value;
			var foreignKey = document.getElementById("foreinKey").value;
			var primaryKey = document.getElementById("primaryKey").value;
			//alert(foreignKey);
			//alert(primaryKey);
			var xp = /&/;
			var columnArray = columnNames.split(xp);
			if(dimension.length < 1){
				alert("ά��������Ϊ��!");
			}else if(hierarchy.length < 1){
				alert("��νṹ������Ϊ��");
			}else if(foreignKey.length < 1 ){
				alert("�������Ϊ��");
			}else if(primaryKey.length < 1 ){
				alert("��������Ϊ��");
			}else {
				var count = 0;
				for(var i = 0; i < columnArray.length; i++){
					var levelName = "level&".concat(columnArray[i]);
					levelName = levelName +"&" + (i + 1);
					//alert(levelName);
					var level = document.getElementById(levelName).value;
					//alert(level);
					if(level.length < 1)
						count++;
				}
				if(count > 0){
					alert("�������ֲ���Ϊ��!");
				}else{
					myForm.submit();
				}
			}
		}
		function go(){
			//alert("go");
			
			var div_type = document.getElementById("div_type");
			if(document.forms[0].checkType.checked){
				//alert("checked");
				div_type.innerHTML = "<input id=\"type\" name=\"type\" type=\"hidden\" value=\"TimeDimension\">";
			}else{
				div_type.innerHTML = "";
			}
		}
	</script>
	</head>

	<body>
		<%
			session.setAttribute("n", 0);
			//	String cubeName = (String)session.getAttribute("cubeName");
			//	String jndiName = (String)session.getAttribute("jndiName");
			//	String userName = (String)session.getAttribute("userName");
			//	String password = (String)session.getAttribute("password");

			String driverName = (String) session.getAttribute("connDriver_");
			String connectString = (String) session.getAttribute("connString_");
			String userName = (String) session.getAttribute("userName_");
			String passWord = (String) session.getAttribute("passWord_");
			String measureTable = (String) session.getAttribute("measureTable");
			//	GetAllTheTableNames bean = new GetAllTheTableNames();
			//	String measureTable_columns = bean.getCols(driverName,
			//	connectString, userName, passWord, measureTable);
			//	String[] str_column = measureTable_columns.split("&");
			GetTablesBean gtlBean = new GetTablesBean();
			ArrayList<String> str_column = new ArrayList<String>();
			try {
				gtlBean.initializeDataConnection(driverName, connectString,
				userName, passWord);
				str_column = gtlBean.getColumns(measureTable);
				gtlBean.close();
			} catch (SQLException e) {
				response.sendRedirect("cError.jsp");
			}
			String str_columns = "<select multiple=\"multiple\">";
			for (int i = 1; i < str_column.size(); i++) {
				str_columns += "<option>" + str_column.get(i) + "</option>";
			}
			str_columns += "</select>";
		%>

		<form �� method="post" action="addDimensionSuccess.jsp">

			<a target="right" href="table1.jsp">������ӱ�</a>
			<%
				String str = (String) session.getAttribute("dimentionCol");
				String[] array1 = str.split("&"); //��Dimentionȡ������
				String[] array2 = new String[array1.length]; //���ݱ���ȡ������
				for (int i = 0; i < array1.length; i++) {
					array2[i] = (String) session.getAttribute(array1[i]);
				}
			%>
			<%
				//��Dimention�����еı�������ϲ�
				//�ϲ����ַ���

				//		String combineCol = "";
				//		ArrayList<String> arrayList = new ArrayList<String>();
				//		String[] _column1 = array2[0].split("&"); //�ѵ�һ�������ַ��ϴ���������
				//		for (int i = 0; i < _column1.length; i++) {
				//	arrayList.add(_column1[i]);
				//		}
				//		for (int i = 1; i < array2.length; i++) {
				//	//��array2[i]���ó������ַ����ŵ�_array2������
				//	String[] _array2 = array2[i].split("&");
				//	for (int j = 0; j < _array2.length; j++) {
				//		if (!(arrayList.contains(_array2[j]))) {
				//	arrayList.add(_array2[j]);
				//		}
				//	}
				//		}
				//		for (int i = 0; i < arrayList.size(); i++) {
				//	combineCol += "<option value='" + arrayList.get(i) + "'>"
				//	+ arrayList.get(i) + "</option>";
				//		}
				//��ȡ��ǰά�ȱ������ֵ����ͬ������
				ArrayList<String> arrayLists = new ArrayList<String>();
				for (int i = 0; i < str_column.size(); i++) {
					int k = array2.length - 1;
					String[] _array3 = array2[k].split("&");
					for (int j = 0; j < _array3.length; j++) {
						if (str_column.get(i).equals(_array3[j])) {
					arrayLists.add(str_column.get(i));
						}
					}
				}
				String sameColumn = "";
				for (int i = 1; i < arrayLists.size(); i++) {
					sameColumn += "<option value=\"" + arrayLists.get(i) + "\">"
					+ arrayLists.get(i) + "</option>";
				}
			%>
			<div id="table">
				<table>
					<tr>
						<td>
							<font size="3" color="red"><%=measureTable%></font>
						</td>

						<%
						for (int i = 0; i < array1.length; i++) {
						%>
						<td><%=array1[i]%></td>
						<%
						}
						%>
					</tr>
					<tr>
						<td><%=str_columns%></td>
						<%
						for (int i = 0; i < array2.length; i++) {
						%>
						<td>
							<select multiple="multiple"
								ondblclick="selectToDimention(this.value)">
								<%
										String[] str3 = array2[i].split("&");
										for (int j = 1; j < str3.length; j++) {
								%>
								<option value="<%=str3[j]%>"><%=str3[j]%></option>
								<%
								}
								%>
							</select>
						</td>
						<%
						}
						%>
					</tr>
				</table>
			</div>
			<hr>
			<p>
				<font size="3" face="����" color="blue">����ά������:</font>
				<input type="text" name="dimentionName">
				&nbsp;&nbsp;
				<font size="3" face="����" color="blue">���:</font>
				<select name="foreinKey"><%=sameColumn%></select>
				<font size="3" face="����" color="blue">(�Ƿ�Ϊʱ��ά?)</font>
				<input type="checkbox" name="checkType" onclick="go()">

			<div id="div_type"></div>
			<p>
				&nbsp;&nbsp;
				<font size="2" face="����" color="blue">����νṹ����:</font>
				<input type="text" name="hierarchyName">

				<font size="2" face="����" color="blue">����:</font>
				<select name="primaryKey"><%=sameColumn%></select>
			<p>
				<font size="2" face="����" color="blue">�Ƿ���All��Ա:</font>
				<select name="hasAll">
					<option value="true">
						true
					</option>
					<option value="false">
						false
					</option>
				</select>



				<font size="2" face="����" color="blue">All��Ա����:</font>
				<input type="text" name="allMemberName">
			<p>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<font size="2" color="red">(˫������������Ϊά�ȱ�ļ���)</font>
			<div id="levels"></div>
			<hr>
			<table align="center">
				<tr>
					<td>
						<input type="button" onclick="validateAndSubmit(this.form)"
							value="���ά��">
					</td>
					<td>
						<input type="reset" value="����">
					</td>

				</tr>
			</table>
		</form>

	</body>
</html>
