<%@ page language="java" pageEncoding="GB2312"
  import="java.util.*,data.web.olapschema.*,java.io.File" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String schemaName=(String) request.getParameter("schemaName");

Util s=new Util();//�ο�data.web.olapschema�е�Util.java,�������������е�һ��
	                  //����,����selSchName��Ӧ��·��.
String schemaPath=s.getWebRootPath()+'/'+s.getSchemaFilePath(schemaName);

File schemaFile=new File(schemaPath);
Schema mySchema=new Schema(schemaFile);
    
ArrayList<Cube> cubeList=new ArrayList<Cube>();
   
//��ȡ���е�Dimension
Iterator it=mySchema.getCubeTable().keySet().iterator();
while(it.hasNext()) cubeList.add(mySchema.getCubeTable().get(it.next()));

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>������</title>

  </head>
  
  <body>
  
 <h4>�����壺</h4>
 <table width=500 cellpadding=10>
 <tr><th></th>  <th></th>   <th></th>  <th align=left>��ʵ���ݱ�</th></tr>
 <%for(int i=0;i<cubeList.size();i++){ %>
 <tr>
 <td>&nbsp;</td>
 <td><img src="./images/cube.gif"></td>
 <td><%=cubeList.get(i).getCubeName() %></td>
 <td align=left><%=cubeList.get(i).getTableName() %></td>
 </tr>
 <%} %>
 </table>
 
  </body>
</html>
