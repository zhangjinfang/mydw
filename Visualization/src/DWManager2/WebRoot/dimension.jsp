<%@ page language="java" pageEncoding="GB2312"
  import="java.util.*,data.web.olapschema.*,java.io.File" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String schemaName=(String) request.getParameter("schemaName");
String dimensionName=(String) request.getParameter("dimensionName");

Util s=new Util();//�ο�data.web.olapschema�е�Util.java,�������������е�һ��
	                  //����,����selSchName��Ӧ��·��.
String schemaPath=s.getWebRootPath()+'/'+s.getSchemaFilePath(schemaName);

File schemaFile=new File(schemaPath);
Schema mySchema=new Schema(schemaFile);

Dimension dim=mySchema.getDimTable().get(dimensionName);

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>����ά��</title>
    
  </head>
  
  <body>
  
 <h3><img src="./images/dimension.gif">&nbsp;<%=dimensionName %></h3>
 <table width=500 cellpadding=5>
 <tr><th align=left>����</th>   <th align=left>Դ��</th>    <th align=left>Դ��</th></tr>
 <%for(int i=0;i<dim.getHieList().size();i++)
      for(int j=0;j<dim.getHieList().get(i).getLevelList().size();j++){
 %>
 <tr>
 <td align=left><%=dim.getHieList().get(i).getLevelList().get(j).getName() %></td>
 <td align=left><%=dim.getHieList().get(i).getLevelList().get(j).getColumn()%></td>
 <td align=left><%=dim.getHieList().get(i).getTableName()%></td>
 </tr>
 <%} %>
 </table>
 
  </body>
</html>
