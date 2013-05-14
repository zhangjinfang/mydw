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
	
	//get the IP address of server.
	var serverIP = '<%=request.getServerName()%>';

	if (schemaConfigFile.parseError.errorCode!=0)
	{
	var error = schemaConfigFile.parseError;
	alert(error.reason);
	}
	
	//construct the tree.
	var tree = new WebFXTree(serverIP);	
	tree.setBehavior('classic');
	tree.icon = "images/serveractive.gif";
	tree.openIcon = "images/serveractive.gif";
	
	//����һ���ڵ㡣
	var treeNode_Data = new WebFXTreeItem("���ݲֿ�ģʽ");
	treeNode_Data.type = "Collection"; 
	//����ڵ�����ͣ�������ʹ��tree.getSelected().nodeTypeʱ�����ܵõ��ڵ�����ͣ�������֪ѡ�еĽڵ㡣
	treeNode_Data.nodeType = "Root";
	treeNode_Data.value=null;
	tree.add(treeNode_Data);
	
	//������ݲֿ�ģʽ
	var addSchemaNode=new WebFXTreeItem("������ݲֿ�ģʽ");
	addSchemaNode.nodeType="newSchema";
	treeNode_Data.add(addSchemaNode);
	
		
	//1 ����schema�ڵ�
	//1.1���schemaConfig��schemas�ĺ��ӽڵ���
	var schemaConfigFileLength = schemaConfigFile.selectSingleNode("Schemas").childNodes.length;
	
	//1.2����һ�����schema���ֵ����顣
	var schemaName = new Array(schemaConfigFileLength);
	//1.3����һ�����schema·�������顣
	var schemaPath = new Array(schemaConfigFileLength);
	
	
	//1.4�ڡ����ݹ����ڵ��£�����Schema�ڵ�
	for(var i=0;i<schemaConfigFileLength;i++)
	{
		//��schema���֡�·�����鸳ֵ��
		schemaName[i] = schemaConfigFile.selectSingleNode("Schemas").childNodes[i].getAttribute('name');
		schemaPath[i] = schemaConfigFile.selectSingleNode("Schemas").childNodes[i].getAttribute('filepath');
		
		//loadSchemaNode()���������shemaName,shemaPath������״ͼ�����������ͼӦ����Ϊһ����������
		//��֧�������֧����һ��Schema���������ݣ��������loadSchemaNode()ʱ����
		//����һ��WebFXTreeItem�ڵ㡣
		var schemaNode = loadSchemaNode(schemaName[i],schemaPath[i]);
		//�����м���һ��Schema��
		treeNode_Data.add(schemaNode);
		
	}
	
	//����ϵͳ���ã���ѯ�Ƚڵ�
	
	var treeNode_SystemConfig = new WebFXTreeItem("ϵͳ����"); 
	treeNode_SystemConfig.nodeType="SystemConfig";
	tree.add(treeNode_SystemConfig);
	
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