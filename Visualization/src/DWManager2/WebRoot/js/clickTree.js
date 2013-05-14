 //本脚本主要是在tab.jsp中点击tab时用到。它根据用户的操作生成一个Session。
 //还有一个重要的作用是刷新变量o，使tab不处于“元数据”时，点击左边的树节点，不会
 //刷新content框架的内容。
 
var xhr;
var treeSel;

function createXMLHttpRequest() {/*创建XMLHttpRequest对象.以异步的方式与服务器
通信，从服务器获取需要的数据*/
	if (window.ActiveXObject) {
		xhr = new ActiveXObject("Microsoft.XMLHTTP");
	} else {
		if (window.XMLHttpRequest) {
			xhr = new XMLHttpRequest();
		}
	}
}
	
//////单击左端树状图激发的事件.
function clickTreeEvent()
{
	var treeSel=tree.getSelected();
	if(treeSel.nodeType=="DataSource")
	{
		clickDSNode();
	}
	else if(treeSel.nodeType=="SystemConfig")
	{
		clickSCNode();
	}
	else if(treeSel.nodeType=="preCom")
	{
		clickPreComNode();
	}
	else if(treeSel.nodeType=="query")
	{
		clickQueryNode();
	}
	else if(treeSel.nodeType=="newSchema"){
		clickNewSchema();
	}
	else if(treeSel.nodeType=="delSchema"){
		clickDelSchema();
	}
	else if(treeSel.nodeType=="Dimensions"){
	    clickDimensions();
	}
	else if(treeSel.nodeType=="Dimension"){
	    clickDimension();
	}
	else if(treeSel.nodeType=="Cubes"){
	    clickCubes();
	}
	else if(treeSel.nodeType=="Cube"){
	    clickCube();
	    
		//var schemaName=treeSel.parentNode.value;
		//var cubeName=treeSel.value;
		//window.open("editCube.jsp?selSchName="+schemaName+"&selCubeName="+cubeName);
	}
	else 
		return;
}

//删除数据仓库模式
function clickDelSchema(){
	
    createXMLHttpRequest();
	xhr.onreadystatechange = writeResText;
	xhr.open("POST","delSchema.jsp",true);
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");
    xhr.setRequestHeader ("Cache-Control","no-cache");
    
    var schemaName=treeSel.parentNode.value;
    var queryString="";
    queryString=queryString+"schemaName="+schemaName;
    xhr.send(queryString);

}

//在右端页面弹出新增schema页面
function clickNewSchema(){
	createXMLHttpRequest();
	xhr.onreadystatechange = writeResText;
	xhr.open("POST","newSchema.jsp",true);
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");
    xhr.setRequestHeader ("Cache-Control","no-cache");
    var queryString="";
    xhr.send(queryString);
}

//在右端页面弹出jpivot查询数据页面
function clickQueryNode(){
 	createXMLHttpRequest();
	xhr.onreadystatechange = writeResText;
	xhr.open("POST","jpivot.jsp",true);
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");
    xhr.setRequestHeader ("Cache-Control","no-cache");
    
    var schemaName=treeSel.parentNode.parentNode.parentNode.value;
    var cubeName=treeSel.parentNode.value;
    
    var queryString="";
    queryString=queryString+"schemaName="+schemaName+"&cubeName="+cubeName;
    xhr.send(queryString);

}

//在右端页面弹出预计算页面
function clickPreComNode(){

	createXMLHttpRequest();
	xhr.onreadystatechange = writeResText;
	xhr.open("POST","preComputation.jsp",true);
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");
    xhr.setRequestHeader ("Cache-Control","no-cache");
    
    var schemaName=treeSel.parentNode.parentNode.parentNode.value;
    var cubeName=treeSel.parentNode.value;
    
    var queryString="";
    queryString=queryString+"schemaName="+schemaName+"&cubeName="+cubeName;
    xhr.send(queryString);

}

//在右端页面弹出系统配置页面
function clickSCNode(){

	createXMLHttpRequest();
	xhr.onreadystatechange = writeResText;
	xhr.open("POST","system-config.jsp",true);
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");
    xhr.setRequestHeader ("Cache-Control","no-cache");
    var queryString="";
    xhr.send(queryString);
}


//在右端页面弹出数据源页面
function clickDSNode(){
	createXMLHttpRequest();
	xhr.onreadystatechange = writeResText;
	xhr.open("POST","editDS.jsp",true);
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");
    xhr.setRequestHeader ("Cache-Control","no-cache");
    
    var schemaName=treeSel.parentNode.value;
    var queryString = "";
    queryString=queryString+"selSchName="+schemaName;
	xhr.send(queryString);
	
}


//在右端页面显示所有共享维度页面
function clickDimensions(){
    createXMLHttpRequest();
	xhr.onreadystatechange = writeResText;
	xhr.open("POST","dimensions.jsp",true);
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");
    xhr.setRequestHeader ("Cache-Control","no-cache");
    
    var schemaName=treeSel.parentNode.value;
    var queryString = "";
    queryString=queryString+"schemaName="+schemaName;
	xhr.send(queryString);
}


//在右端页面显示具体共享维度页面
function clickDimension(){
    createXMLHttpRequest();
	xhr.onreadystatechange = writeResText;
	xhr.open("POST","dimension.jsp",true);
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");
    xhr.setRequestHeader ("Cache-Control","no-cache");
    
    var schemaName=treeSel.parentNode.parentNode.value;
    var dimensionName=treeSel.value;
    var queryString = "";
    queryString=queryString+"schemaName="+schemaName+"&dimensionName="+dimensionName;
	xhr.send(queryString);
}


//在右端页面显示立方体页面
function clickCubes(){
    createXMLHttpRequest();
	xhr.onreadystatechange = writeResText;
	xhr.open("POST","cubes.jsp",true);
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");
    xhr.setRequestHeader ("Cache-Control","no-cache");
    
    var schemaName=treeSel.parentNode.value;
    var queryString = "";
    queryString=queryString+"schemaName="+schemaName;
	xhr.send(queryString);
}


//在右端页面显示立方体元数据页面
function clickCube(){
    createXMLHttpRequest();
	xhr.onreadystatechange = writeResText;
	xhr.open("POST","cube.jsp",true);
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");
    xhr.setRequestHeader ("Cache-Control","no-cache");
    
    var schemaName=treeSel.parentNode.parentNode.value;
    var cubeName=treeSel.value;
    var queryString = "";
    queryString=queryString+"schemaName="+schemaName+"&cubeName="+cubeName;
	xhr.send(queryString);
}


function writeResText(){
	if (xhr.readyState == 4) {
		if (xhr.status == 200) {
			window.parent.frames["content"].document.clear();
			window.parent.frames["content"].document.close();
			
			window.parent.frames["content"].document.write(xhr.responseText);
		}
	}
}



