<!-- 
var menuskin = "skin1"; 
var display_url = 0; 

function showmenu() 
{	
	if(tree.getSelected().nodeType == "Root"){
		document.getElementById("linktojp").style.display = "none";
		document.getElementById("linktoxml").style.display = "none";
		var   sWidth,sHeight;
		sWidth=document.body.scrollWidth;
		sHeight=document.body.scrollHeight;
		var bgObj=document.createElement("div");
		bgObj.setAttribute( "id","bgDiv"); 
	    bgObj.style.position= "absolute"; 
	    bgObj.style.top= "0"; 
	    bgObj.style.background= "#777"; 
	    bgObj.style.filter= "progid:DXImageTransform.Microsoft.Alpha(style=3,opacity=25,finishOpacity=75"; 
	    bgObj.style.opacity= "0.6"; 
	    bgObj.style.left= "0"; 
	    bgObj.style.width=sWidth + 20 + "px"; 
	    bgObj.style.height=sHeight + 50 + "px"; 
	    bgObj.style.zIndex   =   "500"; 
	    document.getElementById("bg").appendChild(bgObj);
		var PopObj = document.getElementById("menu");
		PopObj.style.zIndex = bgObj.style.zIndex + 1;
		document.getElementById("menuAdd").innerHTML = "新建Schema";

		//激发创建Schema
		action = "addSchema";
	}else if(tree.getSelected().nodeType == "Schema"){
		document.getElementById("linktojp").style.display = "none";
		document.getElementById("linktoxml").style.display = "none";
		var   sWidth,sHeight;
		sWidth=document.body.scrollWidth;
		sHeight=document.body.scrollHeight;
		var bgObj=document.createElement("div");
		bgObj.setAttribute( "id","bgDiv"); 
	    bgObj.style.position= "absolute"; 
	    bgObj.style.top= "0"; 
	    bgObj.style.background= "#777"; 
	    bgObj.style.filter= "progid:DXImageTransform.Microsoft.Alpha(style=3,opacity=25,finishOpacity=75"; 
	    bgObj.style.opacity= "0.6"; 
	    bgObj.style.left= "0"; 
	    bgObj.style.width=sWidth + 20 + "px"; 
	    bgObj.style.height=sHeight + 50 + "px"; 
	    bgObj.style.zIndex   =   "500"; 
	    document.getElementById("bg").appendChild(bgObj);
		var PopObj = document.getElementById("menu");
		PopObj.style.zIndex = bgObj.style.zIndex + 1;
		document.getElementById("menuAdd").innerHTML = "新建立方体";
		
		//激发创建Cube
		action = "addCube";
	}else if (tree.getSelected().nodeType == "Cube"){
		document.getElementById("linktojp").style.display = "block";
		document.getElementById("linktoxml").style.display = "none";
		var   sWidth,sHeight;
		sWidth=document.body.scrollWidth;
		sHeight=document.body.scrollHeight;
		var bgObj=document.createElement("div");
		bgObj.setAttribute( "id","bgDiv"); 
	    bgObj.style.position= "absolute"; 
	    bgObj.style.top= "0"; 
	    bgObj.style.background= "#777"; 
	    bgObj.style.filter= "progid:DXImageTransform.Microsoft.Alpha(style=3,opacity=25,finishOpacity=75"; 
	    bgObj.style.opacity= "0.6"; 
	    bgObj.style.left= "0"; 
	    bgObj.style.width=sWidth + 20 + "px"; 
	    bgObj.style.height=sHeight + 50 + "px"; 
	    bgObj.style.zIndex   =   "500"; 
	    document.getElementById("bg").appendChild(bgObj);
		var PopObj = document.getElementById("menu");
		PopObj.style.zIndex = bgObj.style.zIndex + 1;
		document.getElementById("menuAdd").innerHTML = "新建维度";
		
		//激发创建Dimension
		action = "addDimension";
	}else{
		return false;
	}
	var rightedge = document.body.clientWidth-event.clientX;
	var bottomedge = document.body.clientHeight-event.clientY;
	if (rightedge <menu.offsetWidth)
		menu.style.left = document.body.scrollLeft + event.clientX - menu.offsetWidth;
	else
		menu.style.left = document.body.scrollLeft + event.clientX;
	if (bottomedge <menu.offsetHeight)
		menu.style.top = document.body.scrollTop + event.clientY - menu.offsetHeight;
	else
		menu.style.top = document.body.scrollTop + event.clientY;
	menu.style.visibility = "visible";
	return false;
}

function hidemenu() 
{
	menu.style.visibility = "hidden";
	if(document.getElementById("bgDiv")){
	var bgObj=document.getElementById("bgDiv");
	bgObj.parentNode.removeChild(bgObj);
	}
}

function highlight() 
{
	if (event.srcElement.className == "menuitems")
	{
		event.srcElement.style.backgroundColor = "highlight";
		event.srcElement.style.color = "white";
		if (display_url)
			window.status = event.srcElement.url;
   	}
}

function lowlight() 
{
	if (event.srcElement.className == "menuitems") 
	{
		event.srcElement.style.backgroundColor = "";
		event.srcElement.style.color = "black";
		window.status = "";
   	}
}

function menuclick() 
{
	var seltext=window.document.selection.createRange().text
	if (event.srcElement.className == "menuitems") 
	{
		if (event.srcElement.getAttribute("target") != null)
		window.open(event.srcElement.url, event.srcElement.getAttribute("target"));
		else
		window.location = event.srcElement.url;
   	}
}

//添加Schema,Cube,Dimension
function addNew(){
	if(action == "addSchema"){
		doAddSchemaRequest();
	}
	if(action == "addCube"){
		doAddCubeRequest();
		//alert("doAddCubeRequest()")
	}
	if(action == "addDimension"){
		doAddDimensionRequest();
		//alert("doAddDimensionRequest()")
	}
}
//-->