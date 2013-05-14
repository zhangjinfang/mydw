var xmlHttp;

function createXMLHttpRequest() {
    if (window.ActiveXObject) {
        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    else if (window.XMLHttpRequest) {
        xmlHttp = new XMLHttpRequest();
    }
}

function handleStateChange(){
	if(xmlHttp.readyState == 4){
		if(xmlHttp.status == 200){	
			//alert(xmlHttp.responseText);
			createCol();
		}else{
			alert("request page error");
		}
	}
}

function doRequest(tableName){
	//alert("begin");
	createXMLHttpRequest();
	var queryString = "tableName=" + tableName;
	
	xmlHttp.onreadystatechange = handleStateChange;
	xmlHttp.open("POST","getColTest.jsp",true);
	xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");
    xmlHttp.setRequestHeader ("Cache-Control","no-cache");
	xmlHttp.send(queryString);
	//alert(queryString);
}
function createCol(){
	var column = document.getElementById("column");
	//alert(xmlHttp.responseText);
	
		column.innerHTML = xmlHttp.responseText;
	
}