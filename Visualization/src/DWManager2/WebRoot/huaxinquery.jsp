<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>

<%@ taglib uri="/WEB-INF/mytag.tld" prefix="mytag"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String schemaName = (String) request.getParameter("schemaName");
	
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>�������ѯ</title>
		
	</head>

	<body>
		<h1>
			�������ѯ
		</h1>
	
       <center>
     
		<br>
	
					
						���ݲֿ�ģʽ���ƣ�<%=schemaName%> 
				 
					 
					 
					 
				         <br><br>����������     �� 
					<select ID="cubename" >
						<option value="-1">--��ѡ��--</option>
						<mytag:yujisuan1 />
					</select>
					<br>
				    <input type="button" onclick="query()"  value="�� ѯ" />
			</center>
		   
		   <script type="text/javascript">	
			function query(){
			// var select = document.getElementById("schemaName");
			 var values = '<%=schemaName%>';
			 var selects2 = document.getElementById("cubename");           
		     var values2 = selects2.options[selects2.selectedIndex].value;
		     if(values2!=""){
		     location="jpivot.jsp?schemaName="+values+"&cubeName="+values2; 
		     }
			}
			</script>	
	</body>
</html>
