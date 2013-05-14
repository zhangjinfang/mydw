 //���ű���Ҫ����tab.jsp�е��tabʱ�õ����������û��Ĳ�������һ��Session��
 //����һ����Ҫ��������ˢ�±���o��ʹtab�����ڡ�Ԫ���ݡ�ʱ�������ߵ����ڵ㣬����
 //ˢ��content��ܵ����ݡ�
 
var xhr;
var treeSel;

function createXMLHttpRequest() {/*����XMLHttpRequest����.���첽�ķ�ʽ�������
ͨ�ţ��ӷ�������ȡ��Ҫ������*/
	if (window.ActiveXObject) {
		xhr = new ActiveXObject("Microsoft.XMLHTTP");
	} else {
		if (window.XMLHttpRequest) {
			xhr = new XMLHttpRequest();
		}
	}
}
	
//////���������״ͼ�������¼�.
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

//ɾ�����ݲֿ�ģʽ
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

//���Ҷ�ҳ�浯������schemaҳ��
function clickNewSchema(){
	createXMLHttpRequest();
	xhr.onreadystatechange = writeResText;
	xhr.open("POST","newSchema.jsp",true);
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");
    xhr.setRequestHeader ("Cache-Control","no-cache");
    var queryString="";
    xhr.send(queryString);
}

//���Ҷ�ҳ�浯��jpivot��ѯ����ҳ��
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

//���Ҷ�ҳ�浯��Ԥ����ҳ��
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

//���Ҷ�ҳ�浯��ϵͳ����ҳ��
function clickSCNode(){

	createXMLHttpRequest();
	xhr.onreadystatechange = writeResText;
	xhr.open("POST","system-config.jsp",true);
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");
    xhr.setRequestHeader ("Cache-Control","no-cache");
    var queryString="";
    xhr.send(queryString);
}


//���Ҷ�ҳ�浯������Դҳ��
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


//���Ҷ�ҳ����ʾ���й���ά��ҳ��
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


//���Ҷ�ҳ����ʾ���干��ά��ҳ��
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


//���Ҷ�ҳ����ʾ������ҳ��
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


//���Ҷ�ҳ����ʾ������Ԫ����ҳ��
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



