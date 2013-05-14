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
	//���涨��һ��tree�������������showTree()���ص�WebFXTree
	//���͵Ľڵ㣬��������壬�����tree.getSelected()����֡�treeû�ж��塱�Ĵ���
	var localConfigFile=getLocalConfigFile();
	var tree=showTree(); //���� ���������ﻹû�а�����ʾ������
	
	function showTree()
{
	//ָ��SchemaConfig.xml ����ļ���·����
	var schemaConfigFilePath = "DWServer/conf/SchemaConfig.xml";
	//��������ļ���
	var schemaConfigFile = loadXML(schemaConfigFilePath);
	var pathDocLength =schemaConfigFile.selectSingleNode("//Schemas").childNodes.length;
	    var schemaname='<%=request.getParameter("schemaName")%>';
	    for(i=0;i<=pathDocLength-1;i++)
		{
				var name = schemaConfigFile.selectSingleNode("Schemas").childNodes[i].getAttribute("name");
				if(name==schemaname)
				{
				schemaConfigFilePath=schemaConfigFile.selectSingleNode("Schemas").childNodes[i].getAttribute("filepath");
				break;
				}
		}
	//get the IP address of server.
	var serverIP = '<%=request.getServerName()%>';

	if (schemaConfigFile.parseError.errorCode!=0)
	{
	var error = schemaConfigFile.parseError;
	alert(error.reason);
	}
	
	//construct the tree.
	var tree = new WebFXTree(schemaname+"���ݲֿ�ģʽ");	
	tree.setBehavior('classic');
	tree.icon = "images/home.png";
	tree.openIcon = "images/home.png";
	
	//����һ���ڵ㡣
	

	
	//������ݲֿ�ģʽ
	// var addSchemaNode=new WebFXTreeItem("������ݲֿ�ģʽ");
	// addSchemaNode.nodeType="newSchema";
	//treeNode_Data.add(addSchemaNode);
	
		
	//1 ����schema�ڵ�
	//1.1���schemaConfig��schemas�ĺ��ӽڵ���

	
	//1.4�ڡ����ݹ����ڵ��£�����Schema�ڵ�
		var schemaNode = loadSchemaNode(schemaname,schemaConfigFilePath);
		//�����м���һ��Schema��
		tree.add(schemaNode);
		
	
	//����ϵͳ���ã���ѯ�Ƚڵ�
	

	
	return tree;

}
	</script>
	
	<div id="tree0" onclick="clickTreeEvent()" ><!-- ����ͨ��
	clickTree.txt����ű��е�doRequest(o)�����������Ӧ�û������ڵ�Ĳ�����
	�����룭1ʱ��ͨ��������tab.jsp�еõ����� o��ֵ�� 
	��һ���¼���˫���¼�:��˫������Դ���ʱ,��������Դ�༭ҳ��,���߳���ϵͳ����ҳ����༭������ҳ��-->
		<script>	
			document.write(tree);//��ʾ����
		</script>		
	</div>
	</body>
 


</html>