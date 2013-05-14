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
	var driver2 = document.forms[1].driver2.value;
	var connect2 = document.forms[1].connect2.value;
	var userName2 = document.forms[1].userName2.value;
	var password2 = document.forms[1].password2.value;
	var queryString = "";
	queryString = queryString + "driver2=" + driver2 + "&connect2=" + connect2 + "&userName2=" + 
					userName2 + "&password2=" + escape(password2);				
	xmlHttp.onreadystatechange = handleStateChange;
	xmlHttp.open("POST","test.jsp",true);
	xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");
    xmlHttp.setRequestHeader ("Cache-Control","no-cache");
	xmlHttp.send(queryString);
	
}
function getResult(){
	//alert(xmlHttp.responseText);
	var result = document.getElementById("result");
	result.innerHTML = xmlHttp.responseText;
}
function handleStateChange(){
	if(xmlHttp.readyState == 4){
		if(xmlHttp.status == 200){	
			getResult();
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
	//document.forms[1].submit();
	doRequest();
}
function getSubmit1(){
	//get the data from forms[0]
	document.forms[1].driver2.value = document.forms[0].driver.value;
	document.forms[1].connect2.value = document.forms[0].connectionstring.value;
	document.forms[1].userName2.value = document.forms[0].username.value;
	document.forms[1].password2.value = document.forms[0].password.value;
	//document.forms[1].submit();
	doRequest();
}
