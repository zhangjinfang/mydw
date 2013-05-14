<%@ page language="java" pageEncoding="GB2312" import="data.web.olapschema.*,
org.jdom.*,java.io.*"%>
<html>
<head> 
	<title>Edit Cube</title>
</head>
	<!-- 引入脚本 -->
	<script src=""></script>
	
<body>
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("If-Modified-Since","Tus,23 Oct 2007 01:00:00 GMT");
	String selSchName = (String) request.getParameter("selSchName");
	String selCubeName = (String) request.getParameter("selCubeName");
	//参考data.web.olapschema中的Util.java,下面调用这个类中的一个函数,返回selSchName对应的路径. 
	String selSchPath=Util.getWebRootPath()+'/'+Util.getSchemaFilePath(selSchName); 
	
	//根据路径生成File文件,进而定义schema类型的数据. 
	File schemaFile=new File(selSchPath); 
	Schema myschema=null;
	try {
			myschema=new Schema(schemaFile); 
		} catch (JDOMException e) {
			e.printStackTrace();		
		} catch (IOException e) {
			e.printStackTrace();
		}	
	
	//从XML文件中取得数据源的相关参数的值
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