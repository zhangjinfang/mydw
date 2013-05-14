<%@ page language="java" pageEncoding="GB2312"
  import="java.util.*,data.web.olapschema.*,java.io.File" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String schemaName=(String) request.getParameter("schemaName");

Util s=new Util();//参考data.web.olapschema中的Util.java,下面调用这个类中的一个
	                  //函数,返回selSchName对应的路径.
String schemaPath=s.getWebRootPath()+'/'+s.getSchemaFilePath(schemaName);

File schemaFile=new File(schemaPath);
Schema mySchema=new Schema(schemaFile);
    
ArrayList<Dimension> dimList=new ArrayList<Dimension>();
   
//获取所有的Dimension
Iterator it=mySchema.getDimTable().keySet().iterator();
while(it.hasNext()) dimList.add(mySchema.getDimTable().get(it.next()));

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>"> 
      
    <title>所有共享维度</title>   
  </head>
  
  <body>
  
  <h4><img src="./images/dimcollection.gif">&nbsp;共享维度： </h4>
  
 <table cellpadding=10>
 <%for(int i=0;i<dimList.size();i++){  %>
 <!--共享维度名-->
 <tr>
 <td>&nbsp;</td>
 <td><img src="./images/dimension.gif"></td>
 <td colspan=30><%=dimList.get(i).getDimName() %></td>
 <!-- 维度的全部级别 -->
 <td>
 <%for(int j=0;j<dimList.get(i).getHieList().size();j++) 
   for(int k=0;k<dimList.get(i).getHieList().get(j).getLevelList().size();k++){
 %>
 <%=dimList.get(i).getHieList().get(j).getLevelList().get(k).getName() %>,
 <%} %>
 </td></tr>
 <%} %>
 </table>
 
  </body>
</html>
