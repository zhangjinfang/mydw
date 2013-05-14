<%@ page language="java" pageEncoding="GB2312"%>
<html>
<head>
<title>system_config</title>
<script src="js/loadXML.js"></script>
<script src="js/createXML.js"></script>
</head>
<body>
<div id = "bg" >
<table border="1">
<tr><td width=250px;>数据的路径:<td><input id=DataDir>
<tr><td>预计算线程数:<td><input id=PreCmptThreadNum>
<tr><td>BlocktupleSize<td><input id=BlocktupleSize>
<tr><td>PrecmptQueryTime<td><input id=PrecmptQueryTime>
<tr><td>QryQueryTime<td><input id=QryQueryTime>
</table>
<div>
<br>

<input style="position:relative; padding:5px; display:block;"type="button" value="确定" onclick="submitXML()">
</div>
</div>

<script language="Javascript">
	
	var dsource = "DWServer/conf/system-config.xml";
	
	var xmlDoc = loadXML(dsource);

	if (xmlDoc.parseError.errorCode!=0)
   	{
       	var error = xmlDoc.parseError;
       	alert(error.reason);
   	}
   	var DataDir = xmlDoc.selectSingleNode("ConfigurationSettings/DataDir");
	var PreCmptThreadNum = xmlDoc.selectSingleNode("ConfigurationSettings/PreCmptThreadNum");
	var BlocktupleSize = xmlDoc.selectSingleNode("ConfigurationSettings/BlocktupleSize");
	var PrecmptQueryTime = xmlDoc.selectSingleNode("ConfigurationSettings/PrecmptQueryTime");
	var QryQueryTime = xmlDoc.selectSingleNode("ConfigurationSettings/QryQueryTime");
	
	document.getElementById("DataDir").value = DataDir.text;
	document.getElementById("PreCmptThreadNum").value = PreCmptThreadNum.text;
	document.getElementById("BlocktupleSize").value = BlocktupleSize.text;
	document.getElementById("PrecmptQueryTime").value = PrecmptQueryTime.text;
	document.getElementById("QryQueryTime").value = QryQueryTime.text;
	
	
	function submitXML()
	{   
		DataDir.text = document.getElementById("DataDir").value;
		PreCmptThreadNum.text = document.getElementById("PreCmptThreadNum").value;
		BlocktupleSize.text = document.getElementById("BlocktupleSize").value;
		PrecmptQueryTime.text = document.getElementById("PrecmptQueryTime").value;
		QryQueryTime.text = document.getElementById("QryQueryTime").value;
		var xmlcontent = xmlDoc.xml;
		sendRequest(xmlcontent,dsource);
	}
	

 	
 	//这个脚本根据一个路径读入一个XML文件,由于不能读取js/loadXML.txt下的loadXML函数，所以在此写下同样的一个
	function loadXML(xmlFile) {
	var xmlDoc;
	//浏览器为IE
	if (window.ActiveXObject) 
	{
		xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
		xmlDoc.async = false;
		try 
		{
			xmlDoc.load(xmlFile);
		}
		catch (e) 
		{
			alert("Error!In IE path.");
			alert(xmlDoc.parseError.reason);
		}
	}
	else 
	{
		if (document.implementation && document.implementation.createDocument) 
		{
			xmlDoc = document.implementation.createDocument("", "", null);
			try 
			{
				xmlDoc.load(xmlFile);
			}
			catch (e) 
			{
				alert("Error!Not in IE.");
				alert(xmlDoc.parseError.reason);
			}
		}
		else 
		{
			return null;
		}
	}
	if (xmlDoc == null) 
	{
		alert("Error131");
		window.location.href = "";
	}
	return xmlDoc;
}
</script>
</body>
</html>