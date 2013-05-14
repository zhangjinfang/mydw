<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,data.web.olapschema.Util,data.web.olapschema.Cube"%>
<%@ page import="data.web.olapschema.Schema,java.io.File,data.web.olapschema.Dimension" %>
<%@ page import="data.web.olapschema.Hierarchy,data.web.olapschema.Level" %>
<%
	String schemaName=(String)session.getAttribute("schemaName");
	String cubeName=(String)session.getAttribute("cubename");
	String demention=request.getParameter("demention");
	String[] dementions=demention.split("\\$");
	String schemaPath=Util.getWebRootPath()+"/"+Util.getSchemaFilePath(schemaName);
	File file=new File(schemaPath);
	Schema schema=new Schema(file);
	LinkedHashMap<String, Cube> cubeTable=schema.getCubeTable();
	Cube cube=cubeTable.get(cubeName);
	ArrayList<Dimension> dimensions=cube.getDimensionList();
	for(int i=0;i<dementions.length;i++)
	{
		String[] dem=dementions[i].split("\\^");
		Dimension dimension=new Dimension();
		dimension.setDimName(dem[0]);
		dimension.setForeignKey(dem[1]);
		ArrayList<Hierarchy> hierarchys=new ArrayList<Hierarchy>();
		Hierarchy hierarchy=new Hierarchy();
		hierarchy.setHieName(dem[2]);
		Boolean hasAll=true;
		if(dem[3]=="false")hasAll=false;
		hierarchy.setHasAll(hasAll);
		hierarchy.setAllMemberName(dem[4]);
		hierarchy.setPrimaryKey(dem[5]);
		hierarchy.setTableName(dem[6]);
		ArrayList<Level> levels=new ArrayList<Level>();
		for(int j=7;j<dem.length;j+=3){
			Level level=new Level();
			level.setName(dem[j]);
			level.setColumn(dem[j+1]);
			Boolean uniqueMembers=true;
			if(dem[j+2]=="false")uniqueMembers=false;
			level.setUniqueMembers(uniqueMembers);
			levels.add(level);
		}
		hierarchy.setLevelList(levels);
		hierarchys.add(hierarchy);
		dimension.setHieList(hierarchys);
		dimensions.add(dimension);
	}
	cube.setDimensionList(dimensions);
	cubeTable.put(cubeName,cube);
	schema.setCubeTable(cubeTable);
	schema.outToFile(schemaPath);
%>