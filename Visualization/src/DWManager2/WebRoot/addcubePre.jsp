<%@ page language="java" pageEncoding="GB18030"%>
<%@ page import="data.web.model.GetTablesBean"%>
<%@page import="data.web.olapschema.*"%>
<%@page import="java.io.*,org.jdom.*"%>
 <%
            String selSchName = (String) request.getParameter("schemaName");
            System.out.println(selSchName);
			//�ο�data.web.olapschema�е�Util.java,�������������е�һ������,����selSchName��Ӧ��·��. 
			String selSchPath = Util.getWebRootPath() + '/'
					+ Util.getSchemaFilePath(selSchName);

			//����·������File�ļ�,��������schema���͵�����. 
			File schemaFile = new File(selSchPath);
			Schema myschema = null;
			//to lxw���˴���Ҫ���쳣���д�����ת������ҳ��
			try {
				myschema = new Schema(schemaFile);
			} catch (JDOMException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
			//��XML�ļ���ȡ������Դ����ز�����ֵ
			String url = myschema.getDataSourceUrl();
			if(url==null)
				url="";
			String connDriver = myschema.getConnDriver();
			if(connDriver==null)
				connDriver="";
			String connString = myschema.getConnString();
			if(connString==null)
				connString="";
			String userName = myschema.getUserName();
			if(userName==null)
			   userName="";
			String passWord = myschema.getPassWord();
			if(passWord==null)
			   passWord="";	
			session.setAttribute("url",url);
			session.setAttribute("schemaName",selSchName);
			session.setAttribute("connDriver",connDriver);
			session.setAttribute("connString",connString);
			session.setAttribute("userName",userName);
			session.setAttribute("passWord",passWord);%>
<script type="text/javascript">
window.parent.frames[1].location.href="addcube.jsp";
</script>
