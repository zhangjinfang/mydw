<%@ page language="java" import="java.util.*, java.io.*, org.jdom.*, org.jdom.input.*,org.jdom.output.*" 
pageEncoding="GB18030"%>
<%	
	//è·åDOMå¯¹è±¡åå®¹
	String xmlcontent = (String)request.getParameter("xmlcontent");  
	//è·å¾å½åç½ç«çç»å¯¹è·¯å¾æ ¹ç®å½å¹¶å ä¸ç¸å¯¹è·¯å¾ä½ä¸ºä¿å­è·¯å¾
	String filepath = (application.getRealPath("/")).replaceAll("\\\\","/") + (String)request.getParameter("filepath");
	
	//ä¿å­XML
	File XMLfile = new File(filepath);
	String result ="";
	try
	{
		if(!XMLfile.exists())
		{
			XMLfile.createNewFile();
	    }
			PrintWriter writer = new PrintWriter(new FileOutputStream(filepath));
			writer.write(xmlcontent);
			writer.flush();
			writer.close();
			result = "提交成功";
	}catch (Exception ex)
	{
		result = result + "发生错误";
	}
	
%>
<%=result %>
