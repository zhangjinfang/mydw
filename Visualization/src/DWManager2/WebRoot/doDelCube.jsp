<%@ page language="java" contentType="text/html; charset=GB2312"
    pageEncoding="GB2312"%>
<%@ page import="java.util.*,data.web.olapschema.Util,data.web.olapschema.Cube"%>
<%@ page import="data.web.olapschema.Schema,java.io.File" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<title>Insert title here</title>
</head>
<%
	String schemaName = (String) session.getAttribute("schemaName");
	String cubeName = (String) session.getAttribute("cubeName");
	System.out.println(schemaName+":"+cubeName);
	//ɾ��local-config.xml�µ���ؼ�¼
	Util.delLocalConfigNode(schemaName,cubeName);
	
	//ɾ��schema�ļ��еĶ�Ӧ������
	String xfpath = Util.getWebRootPath()+"/"+Util.getSchemaFilePath(schemaName);
    File schemaFile=new File(xfpath);
    Schema newSchema=new Schema(schemaFile);
	LinkedHashMap<String, Cube> cubeTable=newSchema.getCubeTable();
	cubeTable.remove(cubeName);
	newSchema.setCubeTable(cubeTable);
	newSchema.outToFile(xfpath);
 %>
<body>
<p>�ɹ�ɾ��������<%=cubeName %></p>
<script type="text/javascript">
top.frames[0].window.location.reload();
</script>
</body>
</html>