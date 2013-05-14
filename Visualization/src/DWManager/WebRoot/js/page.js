var xmlHttp;
var col;
var totalName = "";


function addNewCube(){
	var win = parent.frames[1].window;
	var cubeName = document.getElementById("name").value;
	if(cubeName.length < 1){
		alert("please input a cube name!");
		win.location.href = "create.jsp";
	}else{
		win.location.href = "connectToDataSource.jsp?cubeName=";
	}
}

function addMeasures(){
	var fWin =opener.parent.frames[3].window;
	fWin.location.href = "createMeasures.jsp";
	var selectedTable = fWin.document.getElementById("tableName");
	var selectedColumn = fWin.document.getElementById("columnName");
	var table = document.getElementById("table").value;
	var checkboxValue = document.all("checkbox1");
	var str = "";
	if(checkboxValue.length < 20){
		for(var i = 0; i < checkboxValue.length; i++){
			if(checkboxValue[i].checked){
				str += "&" + checkboxValue[i].value;
			}
		}
	}
	selectedTable.innerHTML = table;
	var newArray = str.split("&");
	var temp = "<select name='selected'>";
	for(var i = 0; i < newArray.length; i++){
		temp += "<option>" + newArray[i] + "</option>";
	}
	temp += "</select>";
	selectedColumn.innerHTML = temp;
}



function addTable(){
	doRequest();
}

function getCol(select){
	doRequest(select);
}

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
			createColTable();
		}
	}
}

function doRequest(select){
	createXMLHttpRequest();
	col = select;
	var getCol = select;
	
	var cookieString = decodeURI(document.cookie);
	var cookieArray = cookieString.split("; ");
	var queryString = "";
	queryString = "getCol=" + getCol;
	for(var i = 0; i < cookieArray.length; i++){
		queryString += "&" + cookieArray[i];
	}
	//alert(queryString);
	xmlHttp.onreadystatechange = handleStateChange;
	xmlHttp.open("POST","getCol.jsp",true);
	xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");
    xmlHttp.setRequestHeader ("Cache-Control","no-cache");
	xmlHttp.send(queryString);
}
//use the colName to create a checkbox
function createColTable(){
	var column = col;
	var newWin = window.open("",column,"width=100,height=400,scrollbars=yes");
	newWin.focus();
	var box;   //use to create the new window data
	box = "<script type='text/javascript' src='js/page.js'></script>"  
	box += "<form method='POST' action='createMeasures.jsp'>";
	box += "<table>";
	box += "<tr><td><input type='hidden' name='table' value='" + column + "'>";
	box += "<tr><td>Table Name:</td>" + "<td>" + column + "</td></tr>";
	box += "<tr><td><hr></td><td><hr></td></tr>";
	var str = xmlHttp.responseText;
	str = str.substring(str.indexOf("^"), str.indexOf("*"));
	var newArray = str.split("&");
	for(var i = 1; i < newArray.length; i++){
		box += "<tr><td><input type='checkbox' value='" + newArray[i] + "' name='checkbox1' id='c" + i.toString() + "'>" + newArray[i] + "</td></tr>";
	}
	box += "<tr><td><input type='button' value='submit' onclick='addMeasures()'/></td>";
	box += "<td><input type='button' value='cancel' onclick='window.close()'/></td></tr></table>";
	box += "</form>";
	newWin.document.write(box);
}
function createColTable1(){
	var column = col;
	var newWin = "";
}
function creatMArray(row,col){ 
	var indx=0;	
	this.length=(row*10)+col	
	for(var x=1;x<=row;x++)
		for(var y=1;y<=col;y++)
			indx=(x*10)+y;
	this[indx]="";
}

