
var xhr;
function createXMLHttpRequest1() {
	if (window.ActiveXObject) {
		xhr = new ActiveXObject("Microsoft.XMLHTTP");
	} else {
		if (window.XMLHttpRequest) {
			xhr = new XMLHttpRequest();
		}
	}
}
function createQueryString() {
	if (event.srcElement.path) {
		var str1 = event.srcElement.path;
		var str2 = "/Schema/DataSource[@name='DataSource']";
		if (str1 == str2) {
			event.srcElement.path = "/Schema/DataSource";
		}
		var e = document.getElementById(event.srcElement.id);
		if (e.type == "Node") {
			var number = event.srcElement.number;
			var objDom = xmlDocArr[number];
			var objPath = event.srcElement.path;
			if(objDom.selectSingleNode(objPath).name!="null"){
			var jname = objDom.selectSingleNode(objPath).getAttribute("name");
			}
			if(objDom.selectSingleNode(objPath).url!="null"){
			var jurl = objDom.selectSingleNode(objPath).getAttribute("url");
			}
			if(objDom.selectSingleNode(objPath).userName!="null"){
			var juserName = objDom.selectSingleNode(objPath).getAttribute("userName");
			}
			if(objDom.selectSingleNode(objPath).passWord!="null"){
			var jpassWord = objDom.selectSingleNode(objPath).getAttribute("passWord");
			}
			if(objDom.selectSingleNode(objPath).connString!="null"){
			var jconnString = objDom.selectSingleNode(objPath).getAttribute("connString");
			}
			if(objDom.selectSingleNode(objPath).connDriver!="null"){
			var jconnDriver = objDom.selectSingleNode(objPath).getAttribute("connDriver");
			}
			if(objDom.selectSingleNode(objPath).hasAll!="null"){
			var jhasAll = objDom.selectSingleNode(objPath).getAttribute("hasAll");
			}
			if(objDom.selectSingleNode(objPath).primaryKey!="null"){
			var jprimaryKey = objDom.selectSingleNode(objPath).getAttribute("primaryKey");
			}
			if(objDom.selectSingleNode(objPath).column!="null"){
			var jcolumn = objDom.selectSingleNode(objPath).getAttribute("column");
			}
			if(objDom.selectSingleNode(objPath).uniqueMembers!="null"){
			var juniqueMembers = objDom.selectSingleNode(objPath).getAttribute("uniqueMembers");
			}
			if(objDom.selectSingleNode(objPath).allMemberName!="null"){
			var jallMemberName = objDom.selectSingleNode(objPath).getAttribute("allMemberName");
			}
			if(objDom.selectSingleNode(objPath).type!="null"){
			var jtype = objDom.selectSingleNode(objPath).getAttribute("type");
			}
			if(objDom.selectSingleNode(objPath).tableName!="null"){
			var jtableName = objDom.selectSingleNode(objPath).getAttribute("tableName");
			}
			if(objDom.selectSingleNode(objPath).foreignKey!="null"){
			var jforeignKey = objDom.selectSingleNode(objPath).getAttribute("foreignKey");
			}
			if(objDom.selectSingleNode(objPath).source!="null"){
			var jsource = objDom.selectSingleNode(objPath).getAttribute("source");
			}
			if(objDom.selectSingleNode(objPath).aggregator!="null"){
			var jaggregator = objDom.selectSingleNode(objPath).getAttribute("aggregator");
			}
			if(objDom.selectSingleNode(objPath).formatString!="null"){
			var jformatString = objDom.selectSingleNode(objPath).getAttribute("formatString");
			}
			if(objDom.selectSingleNode(objPath).formula!="null"){
			var jformula = objDom.selectSingleNode(objPath).getAttribute("formula");
			}
			var linkuserName = objDom.selectSingleNode("//DataSource").getAttribute("userName");
			var linkpassWord = objDom.selectSingleNode("//DataSource").getAttribute("passWord");
			var linkconnString = objDom.selectSingleNode("//DataSource").getAttribute("connString");
			var linkconnDriver = objDom.selectSingleNode("//DataSource").getAttribute("connDriver");
			var jpath = event.srcElement.path;
			var jclasspath = event.srcElement.classpath;
			var jdom = event.srcElement.dom;
			var jid = event.srcElement.id;
			var jnumber = event.srcElement.number;
			var jnodeType = event.srcElement.nodeType;
		}
	}
	var queryString = "";
	if (jname != null) {
		queryString = queryString + "name=" + jname;
	}
	if (jurl != null) {
		queryString = queryString + "&url=" + jurl;
	}
	if (juserName != null) {
		queryString = queryString + "&userName=" + juserName;
	}
	if (jpassWord != null) {
		queryString = queryString + "&passWord=" + jpassWord;
	}
	if (jconnString != null) {
		queryString = queryString + "&connString=" + jconnString;
	}
	if (jconnDriver != null) {
		queryString = queryString + "&connDriver=" + jconnDriver;
	}
	if (jhasAll != null) {
		queryString = queryString + "&hasAll=" + jhasAll;
	}
	if (jprimaryKey != null) {
		queryString = queryString + "&primaryKey=" + jprimaryKey;
	}
	if (jcolumn != null) {
		queryString = queryString + "&column=" + jcolumn;
	}
	if (juniqueMembers != null) {
		queryString = queryString + "&uniqueMembers=" + juniqueMembers;
	}
	if (jallMemberName != null) {
		queryString = queryString + "&allMemberName=" + jallMemberName;
	}
	if (jtype != null) {
		queryString = queryString + "&type=" + jtype;
	}
	if (jtableName != null) {
		queryString = queryString + "&tableName=" + jtableName;
	}
	if (jforeignKey != null) {
		queryString = queryString + "&foreignKey=" + jforeignKey;
	}
	if (jsource != null) {
		queryString = queryString + "&source=" + jsource;
	}
	if (jaggregator != null) {
		queryString = queryString + "&aggregator=" + jaggregator;
	}
	if (jformatString != null) {
		queryString = queryString + "&formatString=" + jformatString;
	}
	if (jformula != null) {
		queryString = queryString + "&formula=" + jformula;
	}
	if (queryString != "" && jpath != null && jdom != null) {
		queryString = queryString + "&path=" + jpath;
		queryString = queryString + "&classpath=" + jclasspath;
		queryString = queryString + "&dom=" + jdom;
		queryString = queryString + "&id=" + jid;
		queryString = queryString + "&number=" + jnumber;
		queryString = queryString + "&nodeType=" + jnodeType;
		queryString = queryString + "&linkuserName=" + linkuserName;
		queryString = queryString + "&linkpassWord=" + linkpassWord;
		queryString = queryString + "&linkconnString=" + linkconnString;
		queryString = queryString + "&linkconnDriver=" + linkconnDriver;
		//alert(queryString);
		if(jnodeType=="Level"){
			var jtable = xmlDocArr[jnumber].selectSingleNode(jpath).parentNode.selectSingleNode("Table").getAttribute("name");
			queryString = queryString + "&table=" + jtable;
			//alert("Level"+jtable);
		} 
		if(jnodeType=="Property"){
			var jtable = xmlDocArr[jnumber].selectSingleNode(jpath).parentNode.parentNode.selectSingleNode("Table").getAttribute("name");
			queryString = queryString + "&table=" + jtable;
			//alert("Property"+jtable);
		} 
		if(jnodeType=="Measure"){
			var jtable = xmlDocArr[jnumber].selectSingleNode(jpath).parentNode.selectSingleNode("Table").getAttribute("name");
			queryString = queryString + "&table=" + jtable;
			//alert("Measure"+jtable);
		} 
	}
	return queryString;
}
function doRequest() {
	createXMLHttpRequest1();
	var queryString = "";
	queryString = queryString + createQueryString();
    	//alert(queryString);
	if (queryString == "") {
		return;
	}
	xhr.onreadystatechange = handleStateChange;
	xhr.open("POST", "nodeinfo.jsp", true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;");
	xhr.setRequestHeader("Cache-Control", "no-chche");
	xhr.send(queryString);
    	//alert(queryString);
}
function handleStateChange() {
	if (xhr.readyState == 4) {
		if (xhr.status == 200) {
			parseResults();
		}
	}
}
function parseResults() {
	window.parent.frames["right"].document.clear();
	window.parent.frames["right"].document.close();
	window.parent.frames["right"].document.write(xhr.responseText);
}
function getInfo() {
	if (event.srcElement.type == "Node") {
		doRequest();
	}else if (event.srcElement.type == "Collection" && event.srcElement.path == "/Schema/Dimension[@name='Dimension Collection']") {
		return;
	}else if (event.srcElement.type == "Root") {
		doSaveSchemaRequest();
	}
}

function sendSCName(){
	if(tree.getSelected()){
		if(tree.getSelected().nodeType == "Cube"){
			doSCNameRequest();
			//window.parent.frames["right"].open("testpage.jsp?query=salescubeAS");
		}else {
			alert("这不是一个立方体节点，请选择一个立方体节点!")
		}
	}
}
//创建Dimension请求，转向创建Dimension页面
function doAddDimensionRequest() {
	//所在Cube的XPath
	var cubeName = tree.getSelected().text;
	//所在Cube所对应的Schema DOM对象的序号
	var number = tree.getSelected().number
	//Schema所在的相对路径
	var filepath = xmlDocPath[number];
	//Cube所对应的事实表
	var factTable = xmlDocArr[number].selectSingleNode("//Schema/Cube[@name='" + cubeName + "']").childNodes[0].getAttribute("name");
	//创建前保存操作，确保与服务器一致
	createXML(filepath,xmlDocArr[number].xml);
	alert("你正进行创建操作，系统已对你之前的操作进行保存！");
	createXMLHttpRequest1()
	var queryString = "";
	queryString = queryString + createDimensionQueryString();
	if (queryString == "") {
		return;
	}
	
	xhr.onreadystatechange = handleStateChange;
	xhr.open("POST", "connectToDataSource.jsp", true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;");
	xhr.setRequestHeader("Cache-Control", "no-chche");
    	//xhr.setRequestHeader('If-Modified-Since','Thu,06 Apr 2006 01:00:00 GMT');
	xhr.send(queryString);
    	//alert(queryString);
}
//创建Cube请求，转向创建Cube页面
function doAddCubeRequest() {
	var cubeName = tree.getSelected().text;
	//所在Cube所对应的Schema DOM对象的序号
	var number = tree.getSelected().number
	//Schema所在的相对路径
	var filepath = xmlDocPath[number];
	//创建前保存操作，确保与服务器一致
	createXML(filepath,xmlDocArr[number].xml);
	alert("你正进行创建操作，系统已对你之前的操作进行保存！");
	createXMLHttpRequest1()
	var queryString = "";
	queryString = queryString + createCubeQueryString();
	if (queryString == "") {
		return;
	}
	
	xhr.onreadystatechange = handleStateChange;
	
	xhr.open("POST", "addcubelogin.jsp", true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;");
	xhr.setRequestHeader("Cache-Control", "no-chche");
    	//xhr.setRequestHeader('If-Modified-Since','Thu,06 Apr 2006 01:00:00 GMT');
	xhr.send(queryString);
    	//alert(queryString);
}

function doSaveSchemaRequest() {
	createXMLHttpRequest1();
	var queryString = "";
	queryString = queryString + createRootString();
	if (queryString == "") {
		return;
	}
	xhr.onreadystatechange = handleStateChange;
	xhr.open("POST", "saveSchema.jsp", true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;");
	xhr.setRequestHeader("Cache-Control", "no-chche");
    	//xhr.setRequestHeader('If-Modified-Since','Thu,06 Apr 2007 01:00:00 GMT');
	xhr.send(queryString);
    	//alert(queryString);
}

function doSCNameRequest(){
	createXMLHttpRequest1();
	var queryString = "";
	queryString = queryString + SCNameString();
	if (queryString == "") {
		return;
	}
	xhr.onreadystatechange = handleStateChange;
	xhr.open("POST", "testpage.jsp", true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;");
	xhr.setRequestHeader("Cache-Control", "no-chche");
    	//xhr.setRequestHeader('If-Modified-Since','Thu,06 Apr 2007 01:00:00 GMT');
	xhr.send(queryString);
	//alert(queryString);
}

//创建Schema请求，转向创建Schema页面
function doAddSchemaRequest() {
	createXMLHttpRequest1();
	var queryString = "";
	//queryString = queryString + createSchemaQueryString();
	//if (queryString == "") {
	//	return;
	//}
	xhr.onreadystatechange = handleStateChange;
	xhr.open("POST", "createschema.jsp", true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;");
	xhr.setRequestHeader("Cache-Control", "no-chche");
    	//xhr.setRequestHeader('If-Modified-Since','Thu,06 Apr 2006 01:00:00 GMT');
	xhr.send(queryString);
    	//alert(queryString);
}

//发向创建Dimension页面的必要内容
function createDimensionQueryString() {
	
	var queryString0 = "";
	//所在Cube的XPath
	var cubeName = tree.getSelected().text;
	//所在Cube所对应的Schema DOM对象的序号
	var number = tree.getSelected().number
	//Schema所在的相对路径
	var filepath = xmlDocPath[number];
	//Cube所对应的事实表
	var factTable = xmlDocArr[number].selectSingleNode("//Schema/Cube[@name='" + cubeName + "']").childNodes[0].getAttribute("name");


	//setTimeout("alert('请进行下一步操作')", 3000);
	//Schema名字
	var schemaName = xmlDocArr[number].selectSingleNode("//Schema").getAttribute("name");
	//DataSource 地址
	var URL = xmlDocArr[number].selectSingleNode("//DataSource").getAttribute("url");
	//用户名，密码，连接参数
	var userName = xmlDocArr[number].selectSingleNode("//DataSource").getAttribute("userName");
	var passWord = xmlDocArr[number].selectSingleNode("//DataSource").getAttribute("passWord");
	var connString = xmlDocArr[number].selectSingleNode("//DataSource").getAttribute("connString");
	var connDriver = xmlDocArr[number].selectSingleNode("//DataSource").getAttribute("connDriver");
	//发送的字符串
	queryString0 = queryString0 + "cubeName="+ cubeName +"&number=" + number +"&filepath="+ filepath 
	              + "&schemaName=" + schemaName + "&factTable=" + factTable + "&URL="+ URL +"&userName="+ userName +"&passWord="
	              + passWord+ "&connString=" + connString +  "&connDriver=" + connDriver;
	//alert(queryString);
	return queryString0;
}

function createCubeQueryString() {
	
	var queryString0 = "";
	//所在Cube所对应的Schema DOM对象的序号
	var number = tree.getSelected().number
	//Schema所在的相对路径
	var filepath = xmlDocPath[number];
	
	//Schema名字
	var schemaName = xmlDocArr[number].selectSingleNode("//Schema").getAttribute("name");
	//DataSource 地址
	var URL = xmlDocArr[number].selectSingleNode("//DataSource").getAttribute("url");
	//用户名，密码，连接参数
	var userName = xmlDocArr[number].selectSingleNode("//DataSource").getAttribute("userName");
	var passWord = xmlDocArr[number].selectSingleNode("//DataSource").getAttribute("passWord");
	var connString = xmlDocArr[number].selectSingleNode("//DataSource").getAttribute("connString");
	var connDriver = xmlDocArr[number].selectSingleNode("//DataSource").getAttribute("connDriver");
	//发送的字符串
	queryString0 = queryString0 + "number=" + number +"&filepath="+ filepath 
	              + "&schemaName=" + schemaName +"&URL="+ URL +"&userName="+ userName +"&passWord="
	              + passWord+ "&connString=" + connString + "&connDriver=" + connDriver;
	//alert(queryString);
	return queryString0;
}

function createRootString() {
	var str = event.srcElement.path;
	var queryString = "";
	var jpath = event.srcElement.path;
	var jdom = event.srcElement.dom;
	var jid = event.srcElement.id;
	var jnumber = event.srcElement.number;
		queryString = queryString + "path=" + jpath + "&dom=" + jdom + "&id=" + jid + "&number=" + jnumber;
	return queryString;
}
function SCNameString(){
	var obj = tree.getSelected();
	var queryString = "";
	var i = obj.number;
	var path = obj.path+ "[@name='"+ obj.text +"']";
	var objNode = xmlDocArr[i].selectSingleNode(path);
	var objRoot = xmlDocArr[i].selectSingleNode("//Schema");
	queryString = queryString + "schemaName=" + objRoot.getAttribute("name") + "&cubeName=" + objNode.getAttribute("name");
	return queryString;
}

