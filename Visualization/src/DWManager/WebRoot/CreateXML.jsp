<%@ page language="java" import="java.util.*, java.io.*, org.jdom.*, org.jdom.input.*,org.jdom.output.*" 
pageEncoding="GB18030"%>
<%	
	//���0�4���0�2�0�5�0�2DOM�0�2�0�4�0�1�����0�3�0�2�0�6�0�5�0�2�0�3�0�1
	String xmlcontent = (String)request.getParameter("xmlcontent");  
	//���0�4���0�2�0�6�0�3�0�2�0�5�0�9�0�2�0�9�0�3�0�4�0�5�0�7�0�4�0�0�0�5�0�4�0�6�0�4�0�4�0�3�0�9�0�2�0�4�0�1�����0�4�0�2�0�6�0�4�0�3�0�2�0�1�0�4�0�7�0�3�0�2�0�5�0�1�0�2�0�1�0�9�0�2�0�0�0�2�0�1�0�0�0�0�0�4�0�7�0�0�0�2�0�4�0�1�����0�4�0�2�0�6�0�4�0�1�0�5�0�8�0�1�0�0�0�2�0�1�0�7�0�9�0�2�0�2�0�4�����0�4�0�2�0�6�0�4
	String filepath = (application.getRealPath("/")).replaceAll("\\\\","/") + (String)request.getParameter("filepath");
	
	//�0�1�0�7�0�9�0�2�0�2�0�4XML
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
			result = "�ύ�ɹ�";
	}catch (Exception ex)
	{
		result = result + "��������";
	}
	
%>
<%=result %>
