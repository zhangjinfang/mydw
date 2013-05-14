<%@ page language="java" pageEncoding="GB2312"%>
<html> 
	<head>
		<title>JSP for DelCube</title>
	</head>
	<body>
	<%
	String SchemaName = (String) request.getParameter("schemaName");
	String cubeName = (String) request.getParameter("cubeName");
	session.setAttribute("schemaName",SchemaName);
	session.setAttribute("cubeName",cubeName);
	 %>
			<p>您准备删除立方体<%=cubeName%>,是否确定删除？</p>
			<br>
			是<input type="radio" name="sureRadio" value="0" />
			否<input type="radio" name="sureRadio" value="1" checked />
			<br/>
			<button  onclick="check()">提交</button>
		
		<script type="text/javascript">
    
    function check(){
    	
    	var radio=document.getElementsByName("sureRadio");
    	if(radio[0].checked){
    		window.parent.frames[1].location.href="doDelCube.jsp";
    	}
    	
    }
    
    </script>
	</body> 
</html>

