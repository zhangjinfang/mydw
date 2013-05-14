<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,data.web.olapschema.Util,data.web.olapschema.Cube"%>
<%@ page import="data.web.olapschema.Schema,java.io.File" %>
    <%
    String factTable=(String)request.getParameter("factTable");
	session.setAttribute("factTable",factTable);
    String columnList=(String)request.getParameter("columnList");
    String[] columns=columnList.split("\\$");
    session.setAttribute("columns",columns);
    String demList=(String)request.getParameter("demList");
    String[] dementions=demList.split("\\$");
    session.setAttribute("dementions",dementions);
    String nextPage="addmeasure.jsp";
    //写入xml
    String sName=(String)session.getAttribute("schemaName");
    String xfpath = Util.getWebRootPath()+"/"+Util.getSchemaFilePath(sName);
    File schemaFile=new File(xfpath);
	String cubeName=(String)session.getAttribute("cubename");
	Cube newCube=new Cube();
	newCube.setCubeName(cubeName);newCube.setTableName(factTable);
   Schema newSchema=new Schema(schemaFile);
   LinkedHashMap<String, Cube> cubeTable=newSchema.getCubeTable();
	cubeTable.put(cubeName,newCube);
   newSchema.setCubeTable(cubeTable);
   newSchema.outToFile(xfpath);
	
     %>
     <%= nextPage%>