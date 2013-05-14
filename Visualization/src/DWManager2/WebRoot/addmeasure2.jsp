<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="data.web.olapschema.Util,data.web.olapschema.Cube"%>
<%@ page import="data.web.olapschema.Schema,java.io.File,data.web.olapschema.Measure" %>
<%  String schemaName=(String)session.getAttribute("schemaName");
	String cubeName=(String)session.getAttribute("cubename");
	System.out.println(schemaName+":"+cubeName);
	String measure=request.getParameter("measures");
	String[] measures=measure.split("\\$");
	String schemaPath=Util.getWebRootPath()+"/"+Util.getSchemaFilePath(schemaName);
	System.out.println(measure);
	File file=new File(schemaPath);
	Schema schema=new Schema(file);
	LinkedHashMap<String, Cube> cubeTable=schema.getCubeTable();
	Cube cube=cubeTable.get(cubeName);
	ArrayList<Measure> measurelist =new ArrayList<Measure>();
	for(int i=0;i<measures.length;i+=4)
	{Measure  mea=new Measure();
	 mea.setColmn(measures[i]);
	 mea.setFormat(measures[i+2]);
	 mea.setFunction(measures[i+1]);
	 mea.setName(measures[i+3]);
	 measurelist.add(mea);
	}
	cube.setMList(measurelist);
	cubeTable.put(cubeName,cube);
	schema.setCubeTable(cubeTable);
	schema.outToFile(schemaPath);
 %>
  <%=measure%>
