function createXML(filepath,doc){
		var xmlcontent = doc;
		sendRequest(xmlcontent,filepath);
	}
	function createXMLHttpRequest2(){
		if(window.ActiveXObject){
			xmlHttp = new ActiveXObject('Microsoft.XMLHTTP');
			}else if(window.XMLHttpRequest){
				xmlHttp = new XMLHttpRequest();
			}
	}
	
	function sendRequest(xmlcontent,filepath){
		createXMLHttpRequest2();
		var queryString = "";
		xmlHttp.open("POST","CreateXML.jsp",true);
		xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");
    	xmlHttp.setRequestHeader("Cache-Control","no-chche");
		xmlHttp.onreadystatechange = getXML;
		//alert(xmlcontent);
		queryString = queryString + "xmlcontent=" + xmlcontent + "&filepath=" + filepath;
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