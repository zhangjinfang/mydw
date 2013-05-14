<%@ page language="java" pageEncoding="GB2312"
  import="java.util.*,data.web.olapschema.*,java.io.File" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String schemaName=(String) request.getParameter("schemaName");
String cubeName=(String) request.getParameter("cubeName");

Util s=new Util();//参考data.web.olapschema中的Util.java,下面调用这个类中的一个
	                  //函数,返回selSchName对应的路径.
String schemaPath=s.getWebRootPath()+'/'+s.getSchemaFilePath(schemaName);

File schemaFile=new File(schemaPath);
Schema mySchema=new Schema(schemaFile);

Cube cube=mySchema.getCubeTable().get(cubeName);

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>立方体元数据</title>

  </head>
  
  <body>

 <h3><img src="./images/cube.gif">&nbsp;<%=cubeName %></h3>
 
 <p><img src="./images/dimcollection.gif">&nbsp;&nbsp;维度：
 <table width=800 cellpadding=5>
 <%for(int i=0;i<cube.getDimensionUaList().size();i++){%>
 <tr>
 <td>&nbsp;</td>
 <td><img src="./images/dimension.gif"></td>
 <td><%=cube.getDimensionUaList().get(i).getName() %></td>
 <td>(ForeignKey)&nbsp;&nbsp;<%=cube.getDimensionUaList().get(i).getForeignKey() %></td>
 </tr>
 <%} %>

 <%for(int i=0;i<cube.getDimensionList().size();i++){ %>
 <tr>
 <td>&nbsp;</td>
 <td><img src="./images/dimensionprivate.gif"></td>
 <td><%=cube.getDimensionList().get(i).getDimName() %></td>
 <td>(ForeignKey)&nbsp;&nbsp;<%=cube.getDimensionList().get(i).getForeignKey() %></td>
 <td>(级别)&nbsp;
 <%for(int j=0;j<cube.getDimensionList().get(i).getHieList().size();j++)
   for(int k=0;k<cube.getDimensionList().get(i).getHieList().get(j).getLevelList().size();k++){
  %>
  ,&nbsp;<%=cube.getDimensionList().get(i).getHieList().get(j).getLevelList().get(k).getName() %>
  <%} %>
 </td>
 </tr>
 <%} %>
 </table>
 
 <p><img src="./images/Measure.gif">&nbsp;&nbsp;度量值：
 <table width=800 cellpadding=5>
 <%for(int i=0;i<cube.getMList().size();i++){ %>
 <tr>
 <td>&nbsp;</td>
 <td><%=cube.getMList().get(i).getName() %></td>
 <td><%=cube.getMList().get(i).getColmn() %></td>
 <td><%=cube.getMList().get(i).getFunction() %></td>
 <td><%=cube.getMList().get(i).getFormat() %></td>
 </tr>
 <%} %>
 </table>
 
 <p><img src="./images/calculation.gif">&nbsp;&nbsp;计算所得成员：
 <%if(cube.getCalcMemberList().isEmpty()){ %> 无 <%} 
 else 
 for(int i=0;i<cube.getCalcMemberList().size();i++){ %>
 <%=cube.getCalcMemberList().get(i).getName() %>,&nbsp;&nbsp;
 <%} %>
 
  </body>
</html>
