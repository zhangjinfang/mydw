	function getParameter(param)
	{
	 	var query = window.location.search;
	 	var iLen = param.length;
	 	var iStart = query.indexOf(param);
	 	if (iStart == -1)
	 	{
	  	    return "";
	    }
	 	iStart += iLen + 1;
	 	var iEnd = query.indexOf("&", iStart);
	 	if (iEnd == -1)
	 	{
	 	 	return query.substring(iStart);
	 	}
	 	return query.substring(iStart, iEnd);
	}
	
	function loadXML(xmlFile)
	{
        var xmlDoc;
        if(window.ActiveXObject)
        {
            xmlDoc = new ActiveXObject('Microsoft.XMLDOM');
            xmlDoc.async = false;
            try
            {
        	    xmlDoc.load(xmlFile);
            }
            catch(e)
            {
            alert("parseError.reason1!");
        	    alert(xmlDoc.parseError.reason);	
            }
        }
        else if (document.implementation&&document.implementation.createDocument)
        {
            xmlDoc = document.implementation.createDocument('','',null);     
       	    try
            {
        	    xmlDoc.load(xmlFile);
            }
            catch(e)
            {
            	alert("parseError.reason2!");
        	    alert(xmlDoc.parseError.reason);	
            }
        }
        else
        {
            return null;
        }
        return xmlDoc;
	}
	
	function checkXMLDocObj(xmlFile)
	{
        var xmlDoc = loadXML(xmlFile);
        if(xmlDoc==null)
        {
            alert('Error131:锟斤拷锟斤拷锟斤拷锟斤拷支锟斤拷xml锟侥硷拷锟斤拷取,锟斤拷锟角憋拷页锟斤拷锟街癸拷锟侥诧拷锟斤拷,锟狡硷拷使锟斤拷IE5.0锟斤拷锟较匡拷锟皆斤拷锟斤拷锟斤拷锟斤拷!');
            window.location.href="";
        }
        return xmlDoc;
	}

	 var switchTree=function(pNode,tree2,path,dom,number)
	 {
		var tNode,i;
		var treeNode;
		var type;
		var jname;
		var jurl; 
		var juserName;
		var jpassWord;
		var connString;
		var connDriver;
		var jhasAll;
		var jprimaryKey;
		var jcolumn;
		var juniqueMembers;
		var jallMemberName;
		var jtype;
		var jtableName;
		var jforeignKey;
		var jsource;
	    var jaggregator;
		var jformatString;
		var jformula;
		var epath;
		
		treeNode = tree2;
		epath = path+pNode.nodeName;
		path += pNode.nodeName+"/"; 
		for(i=0;tNode=pNode.childNodes[i];i++)
	  	{
			if(tNode.nodeType==3) continue;
			if(tNode.nodeType==8) continue;

			showName = getName(tNode);

			if(tNode==pNode.firstChild)
			{	
				var treeNode1 = new WebFXTreeItem(showName); 
				var treeNode2 = new WebFXTreeItem(tNode.getAttribute('name')||tNode.nodeName);
				treeNode1.type = "Collection";
				treeNode1.path=path+tNode.nodeName;
				treeNode2.type = "Node";
				treeNode2.path = path+tNode.nodeName;
				treeNode2.dom = dom;
				treeNode2.number = number;
				treeNode2.nodeType = tNode.nodeName;
				checkIcon(treeNode2);
				if(pNode.getAttribute('url')!=null)
				{
					treeNode2.parentPath = epath +"[@url='"+ pNode.getAttribute('url') +"']";
				}else
				{
				treeNode2.parentPath = epath +"[@name='"+ pNode.getAttribute('name') +"']";
				}
				getAttValue(treeNode2,tNode);
				treeNode.add(treeNode1);	
				treeNode1.add(treeNode2);							
				switchTree(tNode,treeNode2,path,dom,number);
				treeNode = treeNode1;				
			}
			else if(i>0 && tNode.nodeName!=pNode.childNodes[i-1].nodeName){
				var treeNode1 = new WebFXTreeItem(showName); 
				var treeNode2 = new WebFXTreeItem(tNode.getAttribute('name')||tNode.nodeName); 
				treeNode1.type = "Collection";
				treeNode1.path=path+tNode.nodeName;
				treeNode2.type = "Node";
				treeNode2.nodeType = tNode.nodeName;
				checkIcon(treeNode2);
				treeNode2.dom = dom;
				treeNode2.number = number;
				treeNode2.path=path+tNode.nodeName;
				treeNode2.parentPath = epath +"[@name='"+ pNode.getAttribute('name') +"']";
				getAttValue(treeNode2,tNode);
				tree2.add(treeNode1);
				treeNode1.add(treeNode2);										
				switchTree(tNode,treeNode2,path,dom,number);
				treeNode = treeNode1;	
			}
            else	
            {   
                var taction = path+tNode.nodeName+"/iteminfo.html";                         
			    var treeNode1 = new WebFXTreeItem(tNode.getAttribute('name')||tNode.nodeName); 
			    treeNode1.type = "Node";
			    treeNode1.path=path+tNode.nodeName;
			    treeNode1.nodeType = tNode.nodeName;
			    checkIcon(treeNode1);
			    treeNode1.dom = dom;
			    treeNode1.number = number;
			    treeNode1.parentPath = epath +"[@name='"+ pNode.getAttribute('name') +"']";
			    getAttValue(treeNode1,tNode);
			    treeNode.add(treeNode1);
			    switchTree(tNode,treeNode1,path,dom,number);
			}		    
	  	}
	 }
	 
	function addNode() 
	{
		if (tree.getSelected()) {
			
			//tree.getSelected().add(new WebFXTreeItem('New'));
			alert(tree.getSelected().path);
		}
	}
	
	function getAttValue(Node,tNode){
		Node.jname = tNode.getAttribute("name");
		Node.jurl = tNode.getAttribute("url");
		Node.juserName = tNode.getAttribute("userName");
		Node.jpassWord = tNode.getAttribute("passWord");
		Node.jconnString = tNode.getAttribute("connString");
		Node.jconnDriver = tNode.getAttribute("connDriver");
		Node.jhasAll = tNode.getAttribute("hasAll");
		Node.jprimaryKey = tNode.getAttribute("primaryKey");
		Node.jcolumn = tNode.getAttribute("column");
		Node.juniqueMembers = tNode.getAttribute("uniqueMembers");
		Node.jallMemberName = tNode.getAttribute("allMemberName");
		Node.jtype = tNode.getAttribute("type");
		Node.jtableName = tNode.getAttribute("tableName");
		Node.jforeignKey = tNode.getAttribute("foreignKey");
		Node.jsource = tNode.getAttribute("source");
		Node.jaggregator = tNode.getAttribute("aggregator");
		Node.jformatString = tNode.getAttribute("formatString");
		Node.jformula = tNode.getAttribute("formula");
	}

	function getName(tNode){
		var showName;
		if(tNode.nodeName=="DataSource"){
			showName = "数据源"
		}
		if(tNode.nodeName=="Dimension" && tNode.parentNode.nodeName=="Schema"){
			showName = "共享维度";
		}else if(tNode.nodeName=="Dimension" && tNode.parentNode.nodeName=="Cube"){
			showName = "维度";
		}
		if(tNode.nodeName=="Hierarchy"){
			showName = "层次结构";
		}
		
		if(tNode.nodeName=="Table"){
			showName = "表";
		}		
		if(tNode.nodeName=="Level"){
			showName = "级别";
		}
		if(tNode.nodeName=="Property"){
			showName = "属性";
		}
		if(tNode.nodeName=="Cube"){
			showName = "立方体";
		}
		if(tNode.nodeName=="DimensionUsage"){
			showName = "引用维度";
		}
		if(tNode.nodeName=="Measure"){
			showName = "度量";
		}
		if(tNode.nodeName=="CalculatedMember"){
			showName = "计算成员";
		}
		return showName;
	}

	function checkIcon(treeNode){
		if(treeNode.nodeType=="Cube"){
			treeNode.icon = "images/cube.gif";
			treeNode.openIcon = "images/cube.gif";
		}
		if(treeNode.nodeType=="Dimension"){
			treeNode.icon = "images/dimension.gif";
			treeNode.openIcon = "images/dimension.gif";
		}
		if(treeNode.nodeType=="DimensionUsage"){
			treeNode.icon = "images/dimensionprivate.gif";
			treeNode.openIcon = "images/dimensionprivate.gif";
		}
		if(treeNode.nodeType=="DataSource"){
			treeNode.icon = "images/server.gif";
			treeNode.openIcon = "images/server.gif";
		}
		if(treeNode.nodeType=="Level"){
			treeNode.icon = "images/sourcelevel.gif";
			treeNode.openIcon = "images/sourcelevel.gif";
		}
		if(treeNode.nodeType=="Property"){
			treeNode.icon = "images/column.gif";
			treeNode.openIcon = "images/column.gif";
		}
		if(treeNode.nodeType=="Measure"){
			treeNode.icon = "images/nameset.gif";
			treeNode.openIcon = "images/nameset.gif";
		}
	}
	//刷新一个Schema
	function reloadTree(){
		if(tree.getSelected()){
			//通过点击Schema节点，获得一个树上的Schema进行刷新
			//可通过修改，变成点击Schema节点的子孙节点，获得一个树上的Schema进行刷新
			var node = tree.getSelected();
			while(node.nodeType != "Schema" && node.parentNode)
			{
				node = node.parentNode;
			}
			if(node.nodeType == "Schema"){
				var i = node.number;
				var length = node.childNodes.length;
				for(k=0;k<length;k++){
					node.childNodes[0].remove();
				}
				var xmlpath = pathDoc.selectSingleNode("Schemas").childNodes[i].getAttribute("filepath");
			
				var xmlDoc = checkXMLDocObj(xmlpath);
			
				if (xmlDoc.parseError.errorCode!=0)	{
	        		var error = xmlDoc.parseError;
	        		alert(error.reason);
	    		}
				xmlDocArr[i] = xmlDoc;
				xmlDocPath[i] = xmlpath;
				var vRootNode = xmlDocArr[i].documentElement;
				Node1 = tree.getSelected();
				Node2 = Node0;
				Node0 = Node1;
				switchTree(vRootNode,Node0,"",Node1.dom,Node1.number);
				Node0 = Node2;

				}
				
		}
	}
    
	

	

	

