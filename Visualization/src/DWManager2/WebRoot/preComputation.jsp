<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String schemaName = (String) request.getParameter("schemaName");
	String cubeName = (String) request.getParameter("cubeName");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>Ԥ�������</title>
		
	</head>

	<body>
		<h1>
			Ԥ�������
		</h1>

		<br>
		<html:form action="/preCompute">
			<table align="center">
				<tr>
					<td>
						���ݲֿ�ģʽ���ƣ�<%=schemaName%>
					</td>
					<td>
						<html:hidden property="schemaName" value="<%=schemaName%>"/>

					</td>
				</tr>
				<tr>
				<td>
					���������ƣ�<%=cubeName %>
				</td>
				<td>
					<html:hidden property="cubeName" value="<%=cubeName%>"/>
						

				</td>
				</tr>
				<tr>
					<td>
						Ԥ����洢ģʽ��
					</td>
					<td>
						<select id="olap" onchange="getAlg()">
							<option value="MOLAP">
								MOLAP
							</option>
							<option value="ROLAP">
								ROLAP
							</option>
						</select>
					</td>
					<td>
						<input type="button" value="�߼�" onclick="showolapselect()">
					</td>
				</tr>
			</table>
			<div id="selectDiv" style="display: none;">
				<table align="center">
					<tr>
						<td>
							Ԥ�����㷨��
						</td>
						<td>
							<html:select property="alg" onchange="getqryAlg()" >
								</html:select>
						</td>
					</tr>
					<tr>
						<td>
							��ѯ�㷨��
						</td>
						<td>
							<html:select property="qryAlg" >
							</html:select>
						</td>
					</tr>
				</table>
			</div>
			<center>
				<input type="button" onclick="submitForm(this.form)"  value="��  ��" />
			</center>
			<hr>
		   �ύ�����
		<div id="checkResult">
			</div>
		</html:form>


		<script type="text/javascript">
		
		var dsource = "DWServer/conf/system-config.xml";
		
		var xmlDoc = loadXML(dsource);
		
		if (xmlDoc.parseError.errorCode!=0)
   		{
       		var error = xmlDoc.parseError;
       		alert(error.reason);
   		}
		var precomputationalgorithm1 = xmlDoc.selectSingleNode("ConfigurationSettings/AlgorithmsStragy/PrecomputationAlgorithms/MOLAP");
		var precomputationalgorithm2 = xmlDoc.selectSingleNode("ConfigurationSettings/AlgorithmsStragy/PrecomputationAlgorithms/ROLAP");
		var domlength1 = precomputationalgorithm1.childNodes.length;
		var domlength2 = precomputationalgorithm2.childNodes.length;
	
		var olapobj = document.getElementById("olap");
	
		if(olapobj.value=="MOLAP"){
			
			var obj = document.getElementById("alg");
			
			obj.length = domlength1;
	
			for (i=0;i<=domlength1-1;i++)
			{
				obj.options[i].value = xmlDoc.selectSingleNode("//PrecomputationAlgorithms/MOLAP").childNodes[i].nodeName;
	    		obj.options[i].text = xmlDoc.selectSingleNode("//PrecomputationAlgorithms/MOLAP").childNodes[i].nodeName;
			}
			
			var obj2 = document.getElementById("qryAlg")
			var relations = xmlDoc.selectSingleNode("//Relations")
			var relationlen = relations.childNodes.length;
			var qrylength = 0;
			for (i=0;i<=relationlen-1;i++)
			{	
				if(relations.childNodes[i].nodeName==obj.value)
				{
					qrylength = qrylength + 1;
					obj2.length = qrylength;
					obj2.options[qrylength-1].value =relations.childNodes[i].text;
					obj2.options[qrylength-1].text =relations.childNodes[i].text;
				}
			}
		}
	
		
		function getAlg(){
		
			var olapobj = document.getElementById("olap");
	
			if(olapobj.value=="MOLAP"){

			var obj = document.getElementById("alg")
			for (i=0;i<=obj.length-1;i++)
			{
				obj.removeChild(obj.options[i]);
			}
			obj.length = domlength1;
			for (i=0;i<=domlength1-1;i++)
			{
				obj.options[i].value = xmlDoc.selectSingleNode("//PrecomputationAlgorithms/MOLAP").childNodes[i].nodeName;
	   	 		obj.options[i].text = xmlDoc.selectSingleNode("//PrecomputationAlgorithms/MOLAP").childNodes[i].nodeName;
			}
			var obj2 = document.getElementById("qryAlg")
			var relations = xmlDoc.selectSingleNode("//Relations")
			var relationlen = relations.childNodes.length;
			var qrylength = 0;
			for (i=0;i<=relationlen-1;i++)
			{	
				if(relations.childNodes[i].nodeName==obj.value)
				{
					qrylength = qrylength + 1;
					obj2.length = qrylength;
					obj2.options[qrylength-1].value =relations.childNodes[i].text;
					obj2.options[qrylength-1].text =relations.childNodes[i].text;
				}
			}
		}else if(olapobj.value=="ROLAP"){
			var obj = document.getElementById("alg")
			for (i=0;i<=obj.length-1;i++)
			{
				obj.removeChild(obj.options[i]);
			}
			obj.length = domlength2;
			for (i=0;i<=domlength2-1;i++)
			{
				obj.options[i].value = xmlDoc.selectSingleNode("//PrecomputationAlgorithms/ROLAP").childNodes[i].nodeName;
	    		obj.options[i].text = xmlDoc.selectSingleNode("//PrecomputationAlgorithms/ROLAP").childNodes[i].nodeName;
			}
			var obj2 = document.getElementById("qryAlg")
			var relations = xmlDoc.selectSingleNode("//Relations")
			var relationlen = relations.childNodes.length;
			var qrylength = 0;
			for (i=0;i<=relationlen-1;i++)
			{	
				if(relations.childNodes[i].nodeName==obj.value)
				{
					qrylength = qrylength + 1;
					obj2.length = qrylength;
					obj2.options[qrylength-1].value =relations.childNodes[i].text;
					obj2.options[qrylength-1].text =relations.childNodes[i].text;
				}
			}
		}
	
	}
	
	
		function getqryAlg()
		{
			var obj2 = document.getElementById("qryAlg")
			var relations = xmlDoc.selectSingleNode("//Relations")
			var relationlen = relations.childNodes.length;
			var qrylength = 0;
			for (i=0;i<=relationlen-1;i++)
			{	
				if(relations.childNodes[i].nodeName==obj.value)
				{
					qrylength = qrylength + 1;
					obj2.length = qrylength;
					obj2.options[qrylength-1].value =relations.childNodes[i].text;
					obj2.options[qrylength-1].text =relations.childNodes[i].text;
				}
			}
		}
		
		
	function showolapselect()
	{
		var objdiv = document.getElementById("selectDiv");
		
		if(objdiv.style.display=="none"){
			objdiv.style.display="block"
		}else if(objdiv.style.display=="block"){
			objdiv.style.display="none"
		} 
	}
	

function submitForm(form){
		
      var result="���ڽ���Ԥ���㣬���Ե�";
      var resultDiv = document.getElementById("checkResult");
	  resultDiv.innerHTML ="<b>"+result+"</b>"+"::"+"<img src=images/loading.gif >";
	
	  form.submit();
  }

//����ű�����һ��·������һ��XML�ļ�
function loadXML(xmlFile) {
	var xmlDoc;
	//�����ΪIE
	if (window.ActiveXObject) 
	{
		xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
		xmlDoc.async = false;
		try 
		{
			xmlDoc.load(xmlFile);
		}
		catch (e) 
		{
			alert("Error!In IE path.");
			alert(xmlDoc.parseError.reason);
		}
	}
	else 
	{
		if (document.implementation && document.implementation.createDocument) 
		{
			xmlDoc = document.implementation.createDocument("", "", null);
			try 
			{
				xmlDoc.load(xmlFile);
			}
			catch (e) 
			{
				alert("Error!Not in IE.");
				alert(xmlDoc.parseError.reason);
			}
		}
		else 
		{
			return null;
		}
	}
	if (xmlDoc == null) 
	{
		alert("Error131");
		window.location.href = "";
	}
	return xmlDoc;
}
</script>
	
	</body>
</html>
