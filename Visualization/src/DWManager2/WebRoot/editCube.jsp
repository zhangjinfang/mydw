<%@ page language="java" pageEncoding="GB2312" import="data.web.olapschema.*,
org.jdom.*,java.io.*"%>
<html>
<head> 
	<title>Edit Cube</title>
</head>
	<!-- ����ű� -->
	<script src=""></script>
	
<body>
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("If-Modified-Since","Tus,23 Oct 2007 01:00:00 GMT");
	String selSchName = (String) request.getParameter("selSchName");
	String selCubeName = (String) request.getParameter("selCubeName");
	//�ο�data.web.olapschema�е�Util.java,�������������е�һ������,����selSchName��Ӧ��·��. 
	String selSchPath=Util.getWebRootPath()+'/'+Util.getSchemaFilePath(selSchName); 
	
	//����·������File�ļ�,��������schema���͵�����. 
	File schemaFile=new File(selSchPath); 
	Schema myschema=null;
	try {
			myschema=new Schema(schemaFile); 
		} catch (JDOMException e) {
			e.printStackTrace();		
		} catch (IOException e) {
			e.printStackTrace();
		}	
	
	//��XML�ļ���ȡ������Դ����ز�����ֵ
	String url=myschema.getDataSourceUrl();
	String driver=myschema.getConnDriver();
	String connString=myschema.getConnString();
	String userName=myschema.getUserName();
	String passWord=myschema.getPassWord();
%>
	<%=selSchName %><br/>
	<%=selCubeName %><br/>
</body>
</html>