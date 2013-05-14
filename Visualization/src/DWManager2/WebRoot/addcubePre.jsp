<%@ page language="java" pageEncoding="GB18030"%>
<%@ page import="data.web.model.GetTablesBean"%>
<%@page import="data.web.olapschema.*"%>
<%@page import="java.io.*,org.jdom.*"%>
 <%
            String selSchName = (String) request.getParameter("schemaName");
            System.out.println(selSchName);
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
