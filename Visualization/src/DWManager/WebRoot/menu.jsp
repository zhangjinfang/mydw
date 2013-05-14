<%@ page language="java" import="java.util.*,java.io.File,java.io.IOException,java.util.*,java.io.*,org.jdom.Document,org.jdom.*,org.jdom.input.*" pageEncoding="GB18030"%>
<html>
	<head>
		<title></title>
		<script src="js/xtree.js"></script>
		<script src="js/getInfo.js"></script>
		<script src="js/createXML.js"></script>
		<script src="js/menu.js"></script>
		<script src="js/rightcilckmenu.js"></script>
		<link type="text/css" rel="stylesheet" href="css/content.css"/>
		<link type="text/css" rel="stylesheet" href="css/xtree.css"/>
		<style>
input {
	width: 120px;
}
</style>

<script type="text/javascript">
<!--
	function delNode() {
		if (tree.getSelected()) {
			if(tree.getSelected().nodeType == "Schema")
			{
				var objNode = pathDoc.selectSingleNode("//Schemas/Schema[@name='"+ tree.getSelected().text + "']");
				objNode.parentNode.removeChild(objNode);
				createXML(dsource,pathDoc.xml);
				setTimeout("window.location.reload()", 1000);
			}else
			if(tree.getSelected().type == "Node"){
				var obj = tree.getSelected();
				var i = obj.number;
				var path = obj.path+ "[@name='"+ obj.text +"']";
				//alert(path);
				var objNode = xmlDocArr[i].selectSingleNode(path);
				//alert(objNode.xml);
				objNode.parentNode.removeChild(objNode);
				tree.getSelected().remove();
				window.parent.frames["right"].document.clear();
				window.parent.frames["right"].document.close();
				window.parent.frames["right"].document.write("");
			}else{
				alert("this is a Collection or a Root\nit can not be deleted\nplease choose a Node")
			}
		}
	}
	
	function showXML(){
		if (tree.getSelected()) {
			if(tree.getSelected().nodeType == "Schema")
			{
				var obj = tree.getSelected();
				var number = obj.number;
			}
			alert(xmlDocPath[number]);
		//window.parent.frames["right"].document.clear();
		//window.parent.frames["right"].document.close();
		//window.parent.frames["right"].document.write("");
		window.parent.frames["right"].document.location.href=xmlDocPath[number];
	}
	}

-->
</script>
		

	</head>

	<body>
	<div id = "bg" >
		<div>
			<img src="images/downAll.gif"
				onclick="tree.expandAll();"
				alt="展开所有" width=15 height=15 border=1>
			<img src="images/upAll.gif" 
				onclick="tree.collapseAll();"
				alt="折叠所有" width=15 height=15 border=1>
			<img src="images/delete.gif"
				onclick="delNode();"
				alt="删除当前节点" width=15 height=15 border=1>
			<img src="images/read_write_cube.gif"
				onclick="sendSCName();"
				alt="获取jpivot连接" width=15 height=15 border=1>
			&nbsp;
		</div>
		
		<div id="menu" class="skin1" onMouseover="highlight()" onMouseout="lowlight()" style="z-index: 100;  left: 148px; top: 160px; ">
		<div id="menuAdd" class="menuitems" onclick="hidemenu();addNew();">
		</div>
		<div id="linktojp" style="display:none"class="menuitems" onclick="hidemenu();sendSCName();">连接JPivot
		</div>
		<div id="linktoxml" style="display:none"class="menuitems" onclick="hidemenu();showXML();">显示XML
		</div>
		</div>	
		
		<hr>
		<div id = "tree"
			style="position: fixed; border: 1px solid gray; width: 250px; top: auto; left: 20px; height:400px; padding: 5px; overflow: auto;"
			onclick="getInfo();">
			<script src="js/tree.js"></script>
			<script type="text/javascript">
			
			//以相对路径读取配置文档			
			var dsource = "DWServer/conf/SchemaConfig.xml";
		    var pathDoc = checkXMLDocObj(dsource);
		    //获取服务器端的IP地址
			var serverIP = '<%=request.getServerName()%>';
			if (pathDoc.parseError.errorCode!=0)
	    		{
	        		var error = pathDoc.parseError;
	        		alert(error.reason);
	    		}
			var tree = new WebFXTree(serverIP);	
			tree.setBehavior('classic');
			tree.icon = "images/serveractive.gif";
			tree.openIcon = "images/serveractive.gif";
			var Node0 = new WebFXTreeItem("元数据管理");
			Node0.type = "Collection"; 
			Node0.nodeType = "Root";
			tree.add(Node0);
					
			
			var pathDocLength = pathDoc.selectSingleNode("//Schemas").childNodes.length;
			var xmlDocArr = new Array(pathDocLength);
			var xmlDocPath = new Array(pathDocLength);
			//读入schema XML文档，并以DOM对象进行保存，以i作为序号标志
			for(i=0;i<=pathDocLength-1;i++)
			{
			var xmlpath = pathDoc.selectSingleNode("Schemas").childNodes[i].getAttribute("filepath");
			var xmlDoc = checkXMLDocObj(xmlpath);
			
			if (xmlDoc.parseError.errorCode!=0)
	    	{
	        	var error = xmlDoc.parseError;
	        	alert(error.reason);
	    	}
			
			xmlDocArr[i] = xmlDoc;
			xmlDocPath[i] = xmlpath;
			
			var vRootNode = xmlDocArr[i].documentElement;
			Node1 = new WebFXTreeItem(vRootNode.getAttribute('name'));
			Node1.type = "Root";
			Node1.nodeType = "Schema"
			Node1.dom = "xmlDocArr["+i+"]";
			Node1.number = i;
			Node1.icon = "images/database.gif";
			Node1.openIcon = "images/database.gif";
			Node0.add(Node1);
			Node2 = Node0;
			Node0 = Node1;
			switchTree(vRootNode,Node0,"",Node1.dom,Node1.number);
			Node0 = Node2;
			}
			
			Node1 = new WebFXTreeItem("预计算","yujisuanjsp.do?xmlname=true"); 
			Node1.type = "Management";
			tree.add(Node1);
			Node1 = new WebFXTreeItem("系统配置","system-config.html"); 
			Node1.type = "Management";
			tree.add(Node1);
			Node1 = new WebFXTreeItem("查询"); 
			Node1.type = "Management";
			tree.add(Node1);
			document.write(tree);
			
			var action = "";
			
		if (document.all && window.print) {
			document.getElementById("tree").oncontextmenu = showmenu;
			document.getElementById("bg").onclick = hidemenu;
		}
		</script>
		</div>
		<br>
		</div>
	</body>
</html>


