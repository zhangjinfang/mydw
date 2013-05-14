<%@ page contentType="text/html;charset=gb2312" language="java"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/mytag.tld" prefix="mytag"%>
<html:html>
<head>
	<script src="js/tree.js"></script>
	<script src="js/createXML.js"></script>
	<script type="text/javascript">
	function access1(selects){        
		var values = selects.options[selects.selectedIndex].value;
        if(values != "" ){ 
			document.write(values);     
			location="yujisuanjsp1.do?xmlfilename="+values+"&xmlname=true"; 
		}      
	}
    function access2(form){
        var selects = document.getElementById("schemaname");
        var values = selects.options[selects.selectedIndex].value;
        var selects2 = document.getElementById("cubename");           
		var values2 = selects2.options[selects2.selectedIndex].value;
        if(values == "-1" ){ 
			alert("请选择数据仓库模式名称！");
		}		 		               
		else if(values2 == "-1" ){ 
			alert("请选择立方体名称！");
		}
		else{
		    checkResult();
		    alert("local-config done!");
		    form.submit();
		}      
	}


 
  function checkResult(){
      var result="正在进行预计算，请稍等";
      var resultDiv = document.getElementById("checkResult");
	  resultDiv.innerHTML ="<b>"+result+"</b>"+"::"+"<img src=images/loading.gif >";
	  
	  //预计算信息写入local-config.xml
	  var dsource = "DWServer/conf/local-config.xml";
	  var localDoc = checkXMLDocObj(dsource);
	  if (localDoc.parseError.errorCode!=0)
   	  {
      	var error = localDoc.parseError;
       	alert(error.reason);
   	  }
 
   	  var schemaName = document.getElementById("schemaname").value;
   	  var cubeName = document.getElementById("cubename").value;
   	  var preAlgorithm = document.getElementById("alg").value;
   	  var preqryAlgorithm = document.getElementById("QryAlg").value;
   	  //liu li heng
   	  var queryAlgorithm=document.getElementById("QryAlg").value;
   	  
   	  var schemas = localDoc.selectSingleNode("//Config").childNodes;
   	  var root = localDoc.selectSingleNode("//Config");
   	  var length = schemas.length;
	  var isnew = 0;
	  for(i=0;i<length;i++){
	  		var objSchema = localDoc.selectSingleNode("//Config").childNodes[i];
	  		if(objSchema.nodeName == schemaName){
	  			//alert("k");
	  			isnew = 1;
	  			//Schema已经存在的写入过程
	  			var cubeslength = objSchema.childNodes.length;
	  			for(k=0;k<cubeslength;k++){
	  				var objCube = objSchema.childNodes[k];
	  				if(objCube.nodeName == cubeName){
	  					//alert("z");
	  					isnew = 1;
	  					//Schema和Cube已经存在的写入过程
	  					objCube.selectSingleNode("Alg").text = preAlgorithm;
	  					//liu li heng
	  					objCube.selectSingleNode("QryAlg").text = preqryAlgorithm;
	  					//alert(localDoc.xml);
	  					createXML(dsource,localDoc.xml);
	  					return;
	  				}
	  			}
	  			objSchema.appendChild(addCubeByName(localDoc,cubeName,preAlgorithm,queryAlgorithm));
	  			//alert(localDoc.xml);
	  			createXML(dsource,localDoc.xml);
	  			return;
	  		}
	  }
	  if(isnew==0){
	  alert(isnew)
	  //新写入的过程
	  var newSchema = localDoc.createElement(schemaName);
	  root.appendChild(newSchema);
	  newSchema.appendChild(addCubeByName(localDoc,cubeName,preAlgorithm,queryAlgorithm));
	  //alert(localDoc.xml);
	  createXML(dsource,localDoc.xml);
	  }
  }
	//添加CUBE DOM 对象
	function addCubeByName(localDoc,cubeName,preAlgorithm,queryAlgorithm){
		var newCube = localDoc.createElement(cubeName);
		
		var newAlgorithm = localDoc.createElement("Alg");
		newAlgorithm.text = preAlgorithm
		
		var newQAlgorithm = localDoc.createElement("QryAlg");
		newQAlgorithm.text=queryAlgorithm;
		
		newCube.appendChild(newAlgorithm);
		newCube.appendChild(newQAlgorithm);
		
		return newCube;
	}
</script>

	<title>预计算操作</title>
</head>
<body>
	<h1>
		预计算操作
	</h1>
	<br>
	<html:form action="yujisuan.do">
		<table align="center">
			<tr>
				<td>
					数据仓库模式名称：
				</td>
				<td>
					<html:select property="schemaname" onchange="access1(this)"
						id="schemaName">
						<html:option value="-1">--请选择--</html:option>
						<mytag:yujisuan />
					</html:select>
					<a id="href1"></a>
				</td>
			</tr>
			<tr>
				<td>
					立方体名称：
				</td>
				<td>
					<html:select property="cubename" onchange="" id="xmlname">
						<html:option value="-1">--请选择--</html:option>
						<mytag:yujisuan1 />
					</html:select>

				</td>
			</tr>
			<tr>
				<td>
					预计算存储模式：
				</td>
				<td>
				    <select id="olap" onchange="getAlg()">
				    <option value="MOLAP">MOLAP</option>
				    <option value="ROLAP">ROLAP</option>
				    </select>
				</td>
				<td><input type="button" value="高级" onclick="showolapselect()"></td>
			</tr>
		</table>
		<div id="selectDiv" style="display:none;">
		<table align="center">
			<tr>
				<td>
					预计算算法：
				</td>
				<td>
				    <html:select property="alg" onchange="getqryAlg()">
				    </html:select>
				</td>
			</tr>
			<tr>
				<td>
					查询算法：
				</td>
				<td>
				    <select id="QryAlg">
				    </select>
				</td>
			</tr>
		</table>
		</div>
		<center>
			<input type="button" onclick="access2(this.form)" value="提  交"/>
		</center>
		<hr>
		   提交结果：
		<div id="checkResult">
		</div>
	</html:form>
	<script type="text/javascript">	
	var dsource = "DWServer/conf/system-config.xml";
		
	var xmlDoc = checkXMLDocObj(dsource);
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

		var obj = document.getElementById("alg")
		obj.length = domlength1;
		for (i=0;i<=domlength1-1;i++)
		{
		obj.options[i].value = xmlDoc.selectSingleNode("//PrecomputationAlgorithms/MOLAP").childNodes[i].nodeName;
	    obj.options[i].text = xmlDoc.selectSingleNode("//PrecomputationAlgorithms/MOLAP").childNodes[i].nodeName;
		}
		
		var obj2 = document.getElementById("QryAlg")
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
		var obj2 = document.getElementById("QryAlg")
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
		var obj2 = document.getElementById("QryAlg")
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
		var obj2 = document.getElementById("QryAlg")
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
</script>
</body>
</html:html>