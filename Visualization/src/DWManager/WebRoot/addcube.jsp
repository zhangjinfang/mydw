<%@ page language="java" pageEncoding="GB18030"%>
<%@ include file="/taglibs.jsp"%>
<html:html>
<head>
	<title>add cube</title>
 
	<script type="text/javascript">
<!--
    var f=0;
	function showColumn(selects1){
		var values1 = selects1.options[selects1.selectedIndex].value;
		//alert(values1);                
		if(values1 != ""){
		  if(values1=="a"){
		  values1="s";
		  }          
		location="addcubejsp.do?tablename="+values1; 
		}       
	}
//-->
<!--
	function cando(selects){
		var i = selects.id;
		if(selects.checked==true){
		     f=f+1;
		     var i1="function"+i;
		     var i2="format"+i;
		     var i3="measurename"+i;
             document.getElementById(i1).disabled=false;
             document.getElementById(i2).disabled=false; 
             document.getElementById(i3).disabled=false;
        }else{
             f=f-1
             var i1="function"+i;
		     var i2="format"+i;
		     var i3="measurename"+i;
             document.getElementById(i1).disabled=true;
             document.getElementById(i2).disabled=true; 
             document.getElementById(i3).disabled=true;
             document.getElementById(i1).value=document.getElementById(i1).options[0].value;
             document.getElementById(i2).value=document.getElementById(i2).options[0].value; 
             document.getElementById(i3).value="";
        }                
	}
//-->
<!--    
	    function check(thisform){
		if(document.getElementById("factortable").value=="a"){
		     alert("factortable不能为空，请选择factortable!");
        }else
        if(f==0){
		     alert("measure不能为空，请至少输入一个measure!");
        }else
        if(document.getElementById("cubename").value==""){
		     alert("cubename不能为空，请输入cubename!");
        }else
        {
             thisform.submit();
        }                
	}
//-->
</script>
<%
	response.setHeader("Cache-Control","no-cache");	
	response.setHeader("If-Modified-Since","Tus,23 Oct 2007 01:00:00 GMT");

	String filepath = (String)request.getParameter("filepath");
	String schemaName = (String)request.getParameter("schemaName");
	String url = (String)request.getParameter("URL");
	String userName = (String)request.getParameter("userName");
	String passWord = (String)request.getParameter("passWord");
	String connString = (String)request.getParameter("connString");
	String connDriver = (String)request.getParameter("connDriver");
	if(filepath!=null){
	session.setAttribute("filepath",filepath);
	session.setAttribute("schemaName",schemaName);
	session.setAttribute("url",url);
	session.setAttribute("userName",userName);
	session.setAttribute("passWord",passWord);
	session.setAttribute("connString",connString);
	session.setAttribute("connDriver",connDriver);
	}
%>
<head>
<body>
<%=(String)session.getAttribute("filepath") %>
	<html:form action="addcube.do">
		<h4>
			&nbsp;&nbsp;&nbsp;&nbsp;请选择创建measure所需要事实表：
		</h4>
		<div>
			<center>
				<table>
					<tr>
						<td>
							Factortable
						</td>
						<td>
							<html:select property="factortable" onchange="showColumn(this)">
								<option value="a">
									---请选择---
								</option>
								<mytag:addcube1/>					
							</html:select>
						</td>
					<tr>
				</table>
			</center>
		</div>
		<hr>
		<h4>
			&nbsp;&nbsp;&nbsp;&nbsp;请选择所需要的事实表列名来创建measure：
		</h4>
		<div>
			<center>
			<table>
			<tr>
			<th width="25%">measure</th>
			<th width="25%">function</th>
			<th width="25%">format</th>
			<th width ="25%">name</th>
			</tr>
				<mytag:addcube/>				
				</table>
			</center>
		</div>
		<hr>
		<h4>
			&nbsp;&nbsp;&nbsp;&nbsp;请输入你所要增加的cube名字：
		</h4>
		<div>
			<center>
				<table>
					<tr>
						<td>
							Cube Name
						</td>
						<td>
							<html:text property="cubename"></html:text>
						</td>
					</tr>
				</table>
			</center>
		</div>
		<hr>
		<h4>
			&nbsp;&nbsp;&nbsp;&nbsp;点击add按钮增加一个cube：
		</h4>
		<center><html:button property="" onclick="check(this.form)">add</html:button></center>
	</html:form>
	<div id="sId"></div>
</body>
</html:html>