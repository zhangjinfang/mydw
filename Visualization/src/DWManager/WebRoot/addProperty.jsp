<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="org.jdom.*" %>
<%@ page import="org.jdom.output.*" %>  
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

		<title>My JSP 'addProperty.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<script type="text/javascript">
		function property(){
			var win = top.frames[3].window;
			var tableName = document.getElementById("tableName").value;
			var columnName = document.getElementById("columns").value;
			win.location.href = "property.jsp?tableName=" + tableName + "&columnName=" + columnName;
		}
	</script>
	</head>

	<body>
		<%
			//��CUBE���Ԫ��
			String jndiName = (String)session.getAttribute("jndiName");
			String tableName = request.getParameter("table");
			session.setAttribute("tableName_",tableName);
			//ȡ��measure�Ựsession
			String measure = (String)session.getAttribute("measure");
			if(measure.length() < 1){
				session.setAttribute("measure",tableName);
			}else{
				measure += "&" + tableName;
				session.setAttribute("measure",measure);
			}
			//jndiName = "&" + tableName;
			session.setAttribute("jndiName", jndiName);

			String[] column = request.getParameterValues("column");
			session.setAttribute(tableName, "");
			String columnName = "";
			String columnName1 = "";
			for (int i = 0; i < column.length; i++) {
				columnName = (String)session.getAttribute(tableName);
				columnName += "&" + column[i];
				session.setAttribute(tableName, columnName);

				columnName1 += "<option value='" + column[i] + "'>" + column[i]
				+ "</option>";
			}
			String str = "";
				
				if(session.getAttribute("dimentionCol") != ""){
					str = (String)session.getAttribute("dimentionCol");
					str += "&" + tableName;
					session.setAttribute("dimentionCol", str);
				}else{
					session.setAttribute("dimentionCol",tableName);
				}
			//=============================
			
			//��sessionȡ��root�ڵ�
//			Element root = (Element)session.getAttribute("xml");
//			root = (Element)root.clone();
			//��ȡCube�ڵ�
//			Element child = root.getChild("Cube");
			//��ȡTable�ڵ�
//			child = child.getChild("Table");
//			boolean bl = (Boolean)session.getAttribute("controlMeasureTable");
//			if(bl){
				//����name����
//				Attribute rootAttribute = new Attribute("name",tableName);
				//��name���Լӵ�Table�ڵ�
//				child.setAttribute(rootAttribute);
//				session.setAttribute("controlMeasureTable",false);
//			}
			//��root���ڵ�д��session
//			session.setAttribute("xml",root);
			
			
		%>
		<form>
			<table>
				<tr>
					<td>
						<font size="3" color="blue" face="����">��һ��ѡ�еı���:</font>
					</td>
					<td>
						<font size="3" color="red" face="����"><%=tableName%></font>
					</td>
				</tr>
				<tr>
					<td>
						<font size="3" color="blue" face="����">�ϱ���ѡ�е�����:</font>
					</td>
					<td></td>
				</tr>
				<tr>
					<td>
						<font size="2" color="red">(��ʾΪ��ѡ������)</font>
					</td>
					<td>
						<font size="3" color="red" face="����"><select
								multiple="multiple" size="10" ondblclick="property()"
								name="columns"><%=columnName1%></select> </font>
					</td>
				</tr>

			</table>

			<input type="hidden" name="tableName" value="<%=tableName%>">
		</form>
		<input type="button" value="����ά��"
			onclick="top.frames[1].window.location.href='dimention.jsp?tableName=<%=tableName%>'">
			
	</body>
</html>
