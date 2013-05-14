	
	var dsource = "DWServer/conf/system-config.xml";
		 
	var xmlDoc = checkXMLDocObj(dsource);
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
	
	function createXMLHttpRequest3(){
		if(window.ActiveXObject){
			xmlHttp = new ActiveXObject('Microsoft.XMLHTTP');
			}else if(window.XMLHttpRequest){
				xmlHttp = new XMLHttpRequest();
			}
	}
	
	function sendRequest(xmlcontent,dsource){
		createXMLHttpRequest3();
		var queryString = "";
		xmlHttp.open("POST","CreateXML.jsp",true);
		xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");
    	xmlHttp.setRequestHeader("Cache-Control","no-chche");
		xmlHttp.onreadystatechange = getXML;
		queryString = queryString + "xmlcontent=" + xmlcontent + "&filepath=" + dsource;
		xmlHttp.send(queryString);
	}
	
	function getXML(){
    	if(xmlHttp.readyState == 4){
    		if(xmlHttp.status == 200){
    			var src = xmlHttp.responseText;
    			alert(src);
    		}
    	}
 	}



	
	
	