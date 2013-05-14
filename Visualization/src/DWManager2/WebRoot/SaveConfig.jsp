<%@ page language="java"
	import="java.util.*,java.io.*,org.jdom.*,org.jdom.input.*,org.jdom.output.*"
	pageEncoding="GB2312"%>
<%
	String xmlcontent = (String) request.getParameter("xmlcontent");

	String filepath = (application.getRealPath("/")).replaceAll("\\\\",
			"/")
			+ (String) request.getParameter("filepath");

	File XMLfile = new File(filepath);
	String result = "";
	synchronized (XMLfile) {
		try {
			if (!XMLfile.exists()) {
		XMLfile.createNewFile();
			}
			PrintWriter writer = new PrintWriter(new FileOutputStream(
			filepath));
			writer.write(xmlcontent);
			writer.flush();
			writer.close();
			result = "提交成功";
		} catch (Exception ex) {
			result = result + "发生错误";
		}
	}
%>
<%=result%>
