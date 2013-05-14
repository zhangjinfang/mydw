<%@ page language="java" pageEncoding="GB2312"%>

<html>
	<head>

		<title></title>
		<!-- The xtree script file -->
		
		<script src="js/xtree.js"></script>
		<script src="js/loadXML.js"></script>
		
		<script src="js/loadSchemaNode.txt"></script>
		
		<script src="js/clickTree.txt"></script>

		 
		<!-- Modify this file to change the way the tree looks -->
		<link type="text/css" rel="stylesheet" href="css/content.css" />
		<link type="text/css" rel="stylesheet" href="css/xtree.css" />

		<style>
		body {
		background: white;
		color: black;
		width: 120px;
		}
   
		input {
		width: 120px;
		}
		</style>
		
	</head>
	
	<body>
	<script>
	//下面定义一个tree变量，用来存放showTree()返回的WebFXTree
	//类型的节点，如果不定义，后面的tree.getSelected()会出现“tree没有定义”的错误
	var localConfigFile=getLocalConfigFile();
	var tree=showTree(); //生成 树，但这里还没有把它显示出来。
	
	function showTree()
{
	//指定SchemaConfig.xml 这个文件的路径。
	var schemaConfigFilePath = "DWServer/metadata/wuliu2.xml";
	//读入这个文件。
	var schemaConfigFile = loadXML(schemaConfigFilePath);
	
	//get the IP address of server.
	var serverIP = '<%=request.getServerName()%>';

	if (schemaConfigFile.parseError.errorCode!=0)
	{
	var error = schemaConfigFile.parseError;
	alert(error.reason);
	}
	
	//construct the tree.
	var tree = new WebFXTree("华新");	
	tree.setBehavior('classic');
	tree.icon = "images/home.png";
	tree.openIcon = "images/home.png";
	
	//加入一个节点。
	var treeNode_Data = new WebFXTreeItem("华新数据仓库模式");
	treeNode_Data.type = "Collection"; 
	//定义节点的类型，这样当使用tree.getSelected().nodeType时，就能得到节点的类型，进而得知选中的节点。
	treeNode_Data.nodeType = "Root";
	treeNode_Data.value=null;
	tree.add(treeNode_Data);
	
	//添加数据仓库模式
	// var addSchemaNode=new WebFXTreeItem("添加数据仓库模式");
	// addSchemaNode.nodeType="newSchema";
	//treeNode_Data.add(addSchemaNode);
	
		
	//1 加入schema节点
	//1.1获得schemaConfig中schemas的孩子节点数

	
	//1.4在“数据管理”节点下，加入Schema节点
		var schemaNode = loadSchemaNode("sales",schemaConfigFilePath);
		//向树中加入一个Schema。
		treeNode_Data.add(schemaNode);
		
	
	//加入系统配置，查询等节点
	

	
	return tree;

}
	</script>
	
	<div id="tree0" onclick="clickTreeEvent()" ><!-- 这里通过
	clickTree.txt这个脚本中的doRequest(o)这个函数来响应用户对树节点的操作。
	当传入－1时，通过操作从tab.jsp中得到变量 o的值。 
	另一个事件是双击事件:当双击数据源结点时,出现数据源编辑页面,或者出现系统配置页面与编辑立方体页面-->
		<script>	
			document.write(tree);//显示树。
		</script>		
	</div>
	</body>
 


</html>