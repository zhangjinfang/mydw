<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="java.io.*"%>


<%@ page import="data.web.olapschema.*"%>


<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%
	//add Dimension
	String dimentionName = request.getParameter("dimentionName");
	String foreignKey = request.getParameter("foreinKey");
	String type = request.getParameter("type");
	Dimension dimension = new Dimension();
	dimension.setDimName(dimentionName);
	dimension.setForeignKey(foreignKey);
	dimension.setType(type);

	//add Hierarchy
	Hierarchy hierarchy = new Hierarchy();
	String hierarchyName = request.getParameter("hierarchyName");
	String hasAll = request.getParameter("hasAll");
	String primaryKey = request.getParameter("primaryKey");
	
	String allMemberName = request.getParameter("allMemberName");
	String tableName = (String) session.getAttribute("tableName_");

	hierarchy.setHieName(hierarchyName);
	hierarchy.setAllMemberName(allMemberName);
	hierarchy.setTableName(tableName);
	hierarchy.setHasAll(new Boolean(hasAll));
	hierarchy.setPrimaryKey(primaryKey);

	Enumeration e = request.getParameterNames();
	//while(e.hasMoreElements()){
	//	System.out.println((String)e.nextElement());
	//}
	ArrayList<String> arrayList = new ArrayList<String>();
	ArrayList<String> arrayList_level = new ArrayList<String>();
	ArrayList<String> arrayList_uniqueMembers = new ArrayList<String>();
	while (e.hasMoreElements()) {
		String temp = (String)e.nextElement();
		if (!temp.equals("dimentionName") && !temp.equals("foreinKey")
		&& !temp.equals("primaryKey")
		&& !temp.equals("hierarchyName")
		&& !temp.equals("hasAll")) {
			if (!(temp.length() < 1)) {
				arrayList.add(temp);
			}
		}
	}
	for (int i = 0; i < arrayList.size(); i++) {
		String[] temp = arrayList.get(i).split("&");
		if (temp[0].equals("level")) {
			System.out.println();
			arrayList_level.add(arrayList.get(i));
		}
		if (temp[0].equals("uniqueMembers")) {
			arrayList_uniqueMembers.add(arrayList.get(i));
		}
	}

	//添加levels
	Integer p=(Integer)(session.getAttribute("n"));
	for(int i = p.intValue(); i < arrayList_level.size(); i++){
		for(int j = 0; j < arrayList_level.size(); j++){
			for(int k =0; k < arrayList_uniqueMembers.size(); k++){
				String[] str1 = arrayList_level.get(j).split("&");
				String[] str2 = arrayList_uniqueMembers.get(k).split("&");
				int f = i + 1;
				String g = String.valueOf(f);
				if(str1[2].equals(g) && str2[2].equals(g)){
					//创建Level
					Level level = new Level();
					//从request对象取得levelName
					String levelName = request.getParameter(arrayList_level.get(j));
							
					//创建name属性
					level.setName(levelName);
			
					//创建column属性
					level.setColumn(str1[1]);
			
					//从request对象取得uniqueMembers的值
					String uniqueMembersValue = request
							.getParameter(arrayList_uniqueMembers.get(k)); 
					//创建uniqueMembers属性
					 
					level.setUniqueMembers(new Boolean(uniqueMembersValue));
					hierarchy.getLevelList().add(level);
				}
			}
		}
	}
	//==============================================================
	/*
	for (int i = 0; i < arrayList_level.size(); i++) {
		for (int j = 0; j < arrayList_uniqueMembers.size(); j++) {
			String[] str1 = arrayList_level.get(i).split("&");
			String[] str2 = arrayList_uniqueMembers.get(j).split("&");
			if (str1[1].equals(str2[1])) {
		//创建Level
		Level level = new Level();
		//从request对象取得levelName
		String levelName = request.getParameter(arrayList_level
				.get(i));
		//创建name属性
		level.setName(levelName);

		//创建column属性
		level.setColumn(str1[1]);

		//从request对象取得uniqueMembers的值
		String uniqueMembersValue = request
				.getParameter(arrayList_uniqueMembers.get(j));
		//创建uniqueMembers属性
		boolean umv = Boolean.getBoolean(uniqueMembersValue);
		level.setUniqueMembers(umv);
		hierarchy.getLevelList().add(level);
			}
		}
	}
	*/
	//添加Hierarchy到dimension
	dimension.getHieList().add(hierarchy);

	//获得对应的cube，并加入dimension
	String schemaName = (String) session.getAttribute("schemaName_");
	String cubeName = (String) session.getAttribute("cubeName_");
	String filepath = Util.getWebRootPath() + "/"
			+ Util.getSchemaFilePath(schemaName);
	//System.out.println(schemaName);
	//System.out.println(cubeName);
	//System.out.println(filepath);
	File file = new File(filepath);
	Schema s = new Schema(file);
	Cube cube = s.getCubeTable().get(cubeName);
	cube.getDimensionList().add(dimension);
	
	s.outToFile(filepath);
	for(int a = 0; a < arrayList.size(); a++){
		arrayList.remove(a);
	}
	for(int a = 0; a < arrayList_uniqueMembers.size(); a++){
		arrayList_uniqueMembers.remove(a);
	}
	for(int a = 0; a < arrayList_level.size(); a++){
		arrayList_level.remove(a);
	}
%>
<html>
	<head>
		<script type="text/javascript">
			function addDimention(){
				var win = top.frames[1].window;
				win.location.href = "toTable1.jsp";
			}
		</script>
	</head>
	<body>
		<br>
		<form action="WriteXMLString.do">

			<table align="center">
				<tr>
					<td>
						<script type="text/javascript">
							var wins = top.frames[0].window;
							wins.location.href = "menu.jsp";
						</script>
						
					</td>
					<td>
						<input type="button" value="继续添加维度" onclick="addDimention()">
					</td>
					
				</tr>
			</table>
		</form>
	</body>
</html>
