<%@page language="java" import="dbcon.bean,java.util.ArrayList"
	pageEncoding="ISO-8859-1"%>
<%@page language="java" import="java.sql.*"%>
<%@page import="data.web.model.GetTablesBean;"%>
<html>
	<head>
		<title>nodeInfo</title>
	</head>
	<script src="js/tree.js"></script>
	<body bgcolor="#ffffff">
		<%
			String sign = "false";

			response.setHeader("Cache-Control", "no-cache");
			response.setHeader("If-Modified-Since",
					"Tus,23 Oct 2007 01:00:00 GMT");

			String name = (String) request.getParameter("name");
			String url = (String) request.getParameter("url");
			String userName = (String) request.getParameter("userName");
			String passWord = (String) request.getParameter("passWord");
			String connString = (String) request.getParameter("connString");
			String connDriver = (String) request.getParameter("connDriver");
			String hasAll = (String) request.getParameter("hasAll");
			String primaryKey = (String) request.getParameter("primaryKey");
			String column = (String) request.getParameter("column");
			String uniqueMembers = (String) request
					.getParameter("uniqueMembers");
			String allMemberName = (String) request
					.getParameter("allMemberName");
			String type = (String) request.getParameter("type");
			String tableName = (String) request.getParameter("tableName");
			String foreignKey = (String) request.getParameter("foreignKey");
			String source = (String) request.getParameter("source");
			String aggregator = (String) request.getParameter("aggregator");
			String formatString = (String) request.getParameter("formatString");
			String formula = (String) request.getParameter("formula");
			String path = (String) request.getParameter("path");
			String classpath = (String) request.getParameter("classpath");
			String dom = (String) request.getParameter("dom");
			String id = (String) request.getParameter("id");
			String number = (String) request.getParameter("number");
			String nodeType = (String) request.getParameter("nodeType");
			String table = (String) request.getParameter("table");

			String linkuserName = (String) request.getParameter("linkuserName");
			String linkpassWord = (String) request.getParameter("linkpassWord");
			String linkconnString = (String) request
					.getParameter("linkconnString");
			String linkconnDriver = (String) request
					.getParameter("linkconnDriver");
			//		    	bean test = new bean();
			//	try{
			//		test.initializeDataConnection(linkconnDriver, linkconnString,linkuserName, linkpassWord);	
			//	}catch(Exception e){
			//System.out.println("error");
			//		response.sendRedirect("cError.jsp");
			//	}

			//	ArrayList<String> columns = new ArrayList<String>();
			//		if (table != null)
			//	columns = test.getColumns(table);	
			ArrayList<String> columns = new ArrayList<String>();
			GetTablesBean gtlBean = new GetTablesBean();
			try {
				gtlBean.initializeDataConnection(linkconnDriver,
				linkconnString, linkuserName, linkpassWord);
				columns = gtlBean.getColumns(table);
				gtlBean.close();
			} catch (SQLException e) {
				response.sendRedirect("cError.jsp");
			}
		%>
		<script type="text/javascript">

	
	document.onreadystatechange=function(){
		if(document.readyState != 'interactive'&&document.readyState != 'complete'){
		window.location.reload();
		}
		if(document.readyState=='complete'){
			if('<%=name%>'=='null'){
				document.getElementById("thname").style.display='none';
				document.getElementById("inputname").style.display='none';
				document.getElementById("tdname").style.display='none';
			}
			if('<%=url%>'=='null'){
				document.getElementById("thurl").style.display='none';
				document.getElementById("inputurl").style.display='none';
				document.getElementById("tdurl").style.display='none';
			}
			if('<%=userName%>'=='null'){
				document.getElementById("thuserName").style.display='none';
				document.getElementById("inputuserName").style.display='none';
				document.getElementById("tduserName").style.display='none';
			}
			if('<%=passWord%>'=='null'){
				document.getElementById("thpassWord").style.display='none';
				document.getElementById("inputpassWord").style.display='none';
				document.getElementById("tdpassWord").style.display='none';
			}
			if('<%=connString%>'=='null'){
				document.getElementById("thconnString").style.display='none';
				document.getElementById("inputconnString").style.display='none';
				document.getElementById("tdconnString").style.display='none';
			}
			if('<%=connDriver%>'=='null'){
				document.getElementById("thconnDriver").style.display='none';
				document.getElementById("inputconnDriver").style.display='none';
				document.getElementById("tdconnDriver").style.display='none';
			}
			if('<%=hasAll%>'=='null'){
				document.getElementById("thhasAll").style.display='none';
				document.getElementById("inputhasAll").style.display='none';
				document.getElementById("tdhasAll").style.display='none';
			}
			if('<%=primaryKey%>'=='null'){
				document.getElementById("thprimaryKey").style.display='none';
				document.getElementById("inputprimaryKey").style.display='none';
				document.getElementById("tdprimaryKey").style.display='none';
			}
			if('<%=column%>'=='null'){
				document.getElementById("thcolumn").style.display='none';
				document.getElementById("inputcolumn").style.display='none';
				document.getElementById("tdcolumn").style.display='none';
			}
			if('<%=uniqueMembers%>'=='null'){
				document.getElementById("thuniqueMembers").style.display='none';
				document.getElementById("inputuniqueMembers").style.display='none';
				document.getElementById("tduniqueMembers").style.display='none';
			}
			if('<%=allMemberName%>'=='null'){
				document.getElementById("thallMemberName").style.display='none';
				document.getElementById("inputallMemberName").style.display='none';
				document.getElementById("tdallMemberName").style.display='none';
			}
			if('<%=type%>'=='null'){
				document.getElementById("thtype").style.display='none';
				document.getElementById("inputtype").style.display='none';
				document.getElementById("tdtype").style.display='none';
			}
			if('<%=tableName%>'=='null'){
				document.getElementById("thtableName").style.display='none';
				document.getElementById("inputtableName").style.display='none';
				document.getElementById("tdtableName").style.display='none';
			}
			if('<%=foreignKey%>'=='null'){
				document.getElementById("thforeignKey").style.display='none';
				document.getElementById("inputforeignKey").style.display='none';
				document.getElementById("tdforeignKey").style.display='none';
			}
			if('<%=source%>'=='null'){
				document.getElementById("thsource").style.display='none';
				document.getElementById("inputsource").style.display='none';
				document.getElementById("tdsource").style.display='none';
			}
			if('<%=aggregator%>'=='null'){
				document.getElementById("thaggregator").style.display='none';
				document.getElementById("inputaggregator").style.display='none';
				document.getElementById("tdaggregator").style.display='none';
			}
			if('<%=formatString%>'=='null'){
				document.getElementById("thformatString").style.display='none';
				document.getElementById("inputformatString").style.display='none';
				document.getElementById("tdformatString").style.display='none';
			}
			if('<%=formula%>'=='null'){
				document.getElementById("thformula").style.display='none';
				document.getElementById("inputformula").style.display='none';
				document.getElementById("tdformula").style.display='none';
			}
		
		}
	}

	var path = "<%=path%>";
	var classpath = "<%=classpath%>";
	var dom = "<%=dom%>"
	var id = "<%=id%>";
	var number = "<%=number%>";
	var nodeType = "<%=nodeType%>";
	var objxmlDom = window.parent.frames["menu"].xmlDocArr[number].selectSingleNode(path);
	if(nodeType == "Level"||nodeType == "Property"||nodeType == "Measure")
	{
	var columns = new Array(<%=columns.size()%>);
	<% for(int i=0; i<columns.size(); i++)
	{
	%>
	columns[<%=i%>] = "<%=columns.get(i)%>";
	<%}
	%>
	}

    
	
	function modifyNode(){
		
	    var objItem = window.parent.frames["menu"].document.getElementById(id);
	    updateAttribute(objItem);
	    if(objItem.getAttribute("jname")!=="null")
	    {
	    objItem.innerHTML = objItem.jname;
	    objItem.text = objItem.jname;
	    window.parent.frames["menu"].tree.getSelected().text = objItem.jname;
	    var tpath = classpath+"[@name='"+ objItem.text +"']"
	    objItem.setAttribute("path",tpath);
	    }

	    objItem = null; 
	  }
	    
	function updateAttribute(objItem){
	
		if('<%=name%>'!="null")
		{
			objItem.setAttribute("jname",document.getElementById("inputname").value);
			objxmlDom.setAttribute("name",document.getElementById("inputname").value);
		}
		
		if('<%=url%>'!="null")
		{
			objItem.setAttribute("jurl",document.getElementById("inputurl").value);
			objxmlDom.setAttribute("url",document.getElementById("inputurl").value);
		}
		
		if('<%=userName%>'!="null")
		{
			objItem.setAttribute("juserName",document.getElementById("inputuserName").value);
			objxmlDom.setAttribute("userName",document.getElementById("inputuserName").value);
		}
		
		if('<%=passWord%>'!="null")
		{
			objItem.setAttribute("jpassWord",document.getElementById("inputpassWord").value);
			objxmlDom.setAttribute("passWord",document.getElementById("inputpassWord").value);
		}
		
		if('<%=connString%>'!="null")
		{
			objItem.setAttribute("jconnString",document.getElementById("inputconnString").value);
			objxmlDom.setAttribute("connString",document.getElementById("inputconnString").value);
		}
		
		if('<%=connDriver%>'!="null")
		{
			objItem.setAttribute("jconnDriver",document.getElementById("inputconnDriver").value);
			objxmlDom.setAttribute("connDriver",document.getElementById("inputconnDriver").value);
		}
		
		if('<%=hasAll%>'!="null")
		{
			objItem.setAttribute("jhasAll",document.getElementById("inputhasAll").value);
			objxmlDom.setAttribute("hasAll",document.getElementById("inputhasAll").value);
		}
		
		if('<%=primaryKey%>'!="null")
		{
			objItem.setAttribute("jprimaryKey",document.getElementById("inputprimaryKey").value);
			objxmlDom.setAttribute("primaryKey",document.getElementById("inputprimaryKey").value);
		}
		if('<%=column%>'!="null")
		{
			var string = document.getElementById("inputcolumn2").value;
			//string = string.replace(/\"/g,'&quot;');
			objItem.setAttribute("jcolumn",string);
			objxmlDom.setAttribute("column",string);
		}
		if('<%=uniqueMembers%>'!="null")
		{
			objItem.setAttribute("juniqueMembers",document.getElementById("inputuniqueMembers").value);
			objxmlDom.setAttribute("uniqueMembers",document.getElementById("inputuniqueMembers").value);
		}
		
		if('<%=allMemberName%>'!="null")
		{
			objItem.setAttribute("jallMemberName",document.getElementById("inputallMemberName").value);
			objxmlDom.setAttribute("allMemberName",document.getElementById("inputallMemberName").value);
		}
		
		if('<%=type%>'!="null")
		{
			objItem.setAttribute("jtype",document.getElementById("inputtype").value);
			objxmlDom.setAttribute("type",document.getElementById("inputtype").value);
		}
		
		if('<%=tableName%>'!="null")
		{
			objItem.setAttribute("jtableName",document.getElementById("inputtableName").value);
			objxmlDom.setAttribute("tableName",document.getElementById("inputtableName").value);
		}
		
		if('<%=foreignKey%>'!="null")
		{
			objItem.setAttribute("jforeignKey",document.getElementById("inputforeignKey").value);
			objxmlDom.setAttribute("foreignKey",document.getElementById("inputforeignKey").value);
		}
		
		if('<%=source%>'!="null")
		{
			objItem.setAttribute("jsource",document.getElementById("inputsource").value);
			objxmlDom.setAttribute("source",document.getElementById("inputsource").value);
		}
		
		if('<%=aggregator%>'!="null")
		{
			objItem.setAttribute("jaggregator",document.getElementById("inputaggregator").value);
			objxmlDom.setAttribute("aggregator",document.getElementById("inputaggregator").value);
		}
		
		if('<%=formatString%>'!="null")
		{
			objItem.setAttribute("jformatString",document.getElementById("inputformatString").value);
			objxmlDom.setAttribute("formatString",document.getElementById("inputformatString").value);
		}
		
		if('<%=formula%>'!="null")
		{
			objItem.setAttribute("jformula",document.getElementById("inputformula").value);
			objxmlDom.setAttribute("formula",document.getElementById("inputformula").value);
		}
		
	}
</script>
		<table border=1>
			<tr>
				<th id=thname>
					name
				<th id=thurl>
					url
				<th id=thuserName>
					userName
				<th id=thpassWord>
					passWord
				<th id=thconnString>
					connString
				<th id=thconnDriver>
					connDriver
				<th id=thhasAll>
					hasAll
				<th id=thprimaryKey>
					primaryKey
				<th id=thcolumn>
					column
				<th id=thuniqueMembers>
					uniqueMembers
				<th id=thallMemberName>
					allMemberName
				<th id=thtype>
					type
				<th id=thtableName>
					tableName
				<th id=thforeignKey>
					foreignKey
				<th id=thsource>
					source
				<th id=thaggregator>
					aggregator
				<th id=thformatString>
					formatString
				<th id=thformula>
					formula
			<tr ALIGN="RIGHT">
				<td id=tdname>
					<input id=inputname value='<%=name%>' />
				<td id=tdurl>
					<input id=inputurl value='<%=url%>' />
				<td id=tduserName>
					<input id=inputuserName value='<%=userName%>' />
				<td id=tdpassWord>
					<input id=inputpassWord value='<%=passWord%>' />
				<td id=tdconnString>
					<input id=inputconnString value='<%=connString%>' />
				<td id=tdconnDriver>
					<input id=inputconnDriver value='<%=connDriver%>' />
				<td id=tdhasAll>
					<select id=inputhasAll value='<%=hasAll%>'>
						<option value='true'>
							true
						</option>
						<option value='false'>
							false
						</option>
					</select>
				<td id=tdprimaryKey>
					<input id=inputprimaryKey value='<%=primaryKey%>' readonly />
				<td id=tdcolumn>
					<input id=inputcolumn2 value='<%=column%>'
						style="position: absolute; border-right: 0; width: 130;" />
					<span style="width: 150; overflow: hidden"><select
							id=inputcolumn style="width: 150; margin-left: -130"
							onChange="inputcolumn2.value=value" />
					</span>
				<td id=tduniqueMembers>
					<select id=inputuniqueMembers value='<%=uniqueMembers%>'>
						<option value='true'>
							true
						</option>
						<option value='false'>
							false
						</option>
				<td id=tdallMemberName>
					<input id=inputallMemberName value='<%=allMemberName%>' />
				<td id=tdtype>
					<select id=inputtype value='<%=type%>' />
						<option value='Numeric'>
							Numeric
						</option>
						<option value='String'>
							String
						</option>
						<option value='Boolean'>
							Boolean
						</option>
						<option value='TimeDimension'>
							TimeDimension
						</option>
					</select>
				<td id=tdtableName>
					<input id=inputtableName value='<%=tableName%>' />
				<td id=tdforeignKey>
					<input id=inputforeignKey value='<%=foreignKey%>' readonly />
				<td id=tdsource>
					<input id=inputsource value='<%=source%>' />
				<td id=tdaggregator>
					<select id=inputaggregator value='<%=aggregator%>'>
				<td id=tdformatString>
					<input id=inputformatString2 value='<%=formatString%>'
						style="position: absolute; border-right: 0; width: 130;" />
					<span style="width: 150; overflow: hidden"><select
							id=inputformatString style="width: 150; margin-left: -130"
							onChange="inputformatString2.value=value" />
					</span>
				<td id=tdformula>
					<input id=inputformula value='<%=formula%>' />
		</table>
		<br>
		<input type="button" onclick="modifyNode();" value="Modify">

		<script type="text/javascript">
if(nodeType == "Level"||nodeType == "Property"||nodeType == "Measure"){
	var selectobj1 = document.getElementById("inputcolumn");
	var size = columns.length;
	selectobj1.length = size;
	for(i=0; i<selectobj1.length;i++)
	{
		selectobj1.options[i].value = columns[i];
		selectobj1.options[i].text = columns[i];
	}
}
if(nodeType == "Measure"){
	var dsource = "DWServer/conf/DWSchemaSchema.xml"
	var infoDoc = checkXMLDocObj(dsource)
	if (infoDoc.parseError.errorCode!=0)
   	{
       	var error = infoDoc.parseError;
       	alert(error.reason);
   	}
   	var aggregatorlist = infoDoc.selectSingleNode("//MeasureAggregatorList");
   	var formatStringlist = infoDoc.selectSingleNode("//FormatStringList");
   	var listlength1 = aggregatorlist.childNodes.length;
   	var listlength2 = formatStringlist.childNodes.length;
   	var selectobj2 = document.getElementById("inputaggregator");
   	selectobj2.length = listlength1;
   	var selectobj3 = document.getElementById("inputformatString");
   	selectobj3.length = listlength2;
   	for(i=0; i<selectobj2.length;i++)
	{
		selectobj2.options[i].value = aggregatorlist.childNodes[i].text;
		selectobj2.options[i].text = aggregatorlist.childNodes[i].text;
	}
	for(i=0; i<selectobj3.length;i++)
	{
		selectobj3.options[i].value = formatStringlist.childNodes[i].text;
		selectobj3.options[i].text = formatStringlist.childNodes[i].text;
	}
}

document.getElementById("inputaggregator").value='<%=aggregator%>';
document.getElementById("inputuniqueMembers").value='<%=uniqueMembers%>';
document.getElementById("inputtype").value='<%=type%>';
document.getElementById("inputhasAll").value='<%=hasAll%>';

</script>
	</body>
</html>