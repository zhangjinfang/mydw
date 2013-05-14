var xmlHttp;
function createXMLHttpRequest() {
    if (window.ActiveXObject) {
        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    else if (window.XMLHttpRequest) {
        xmlHttp = new XMLHttpRequest();
    }
}

function doRequest(){
	createXMLHttpRequest();
	var getTable = "true";
	var driver = document.getElementById("driver").value;
	var connectString = document.getElementById("connectString").value;
	var userName = document.getElementById("userName").value;
	var password = document.getElementById("password").value;
	//use cookies to save the data
	document.cookie = encodeURI("driver=" + driver);
	document.cookie = encodeURI("connectString=" + connectString);
	document.cookie = encodeURI("userName=" + userName);
	document.cookie = encodeURI("password=" + password);
	
	var queryString = "";
	queryString = queryString + "getTable=" + getTable + "&driver=" + driver + "&connectString=" + 
					connectString + "&userName=" + userName + "&password=" + escape(password);				
	xmlHttp.onreadystatechange = handleStateChange;
	xmlHttp.open("POST","table.jsp",true);
	xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");
    xmlHttp.setRequestHeader ("Cache-Control","no-cache");
	xmlHttp.send(queryString);
	
}
function createTable(){
	var win = parent.frames[1].window;
	win.location.href = "table2.jsp";
	var str = xmlHttp.responseText;
	str = str.substring((str.indexOf("^") + 1), str.indexOf("*"));
	var newArray = str.split("&");
	var select;
	select = "<script type='text/javascript' src='js/page.js'></script>";
	select += "<select property='table' onchange='getCol(this.value)'>";
	for(var i = 0; i < newArray.length; i++){
		if(newArray[i].length){
			select += "<option value='" + newArray[i] + "'>" + newArray[i] + "</option>";
		}
	}
	select += "</select>";
	win.document.write("<div id='table'>" + select + "</div>" );
}
function handleStateChange(){
	if(xmlHttp.readyState == 4){
		if(xmlHttp.status == 200){	
			createTable();
		}else{	
		}
	}else{
		
	}
}
function getSubmit(){
	//get the data from forms[0]
	document.forms[1].driver2.value = document.forms[0].driverName.value;
	document.forms[1].connect2.value = document.forms[0].connectString.value;
	document.forms[1].userName2.value = document.forms[0].userName.value;
	document.forms[1].password2.value = document.forms[0].passWord.value;
	document.forms[1].submit();
}
