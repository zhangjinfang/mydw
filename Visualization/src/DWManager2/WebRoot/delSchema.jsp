<%@ page language="java" pageEncoding="GB2312"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
 
<html> 
	<head>
		<title>JSP for DelSchemaForm form</title>
	</head>
	<body>
	<%
	String SchemaName = (String) request.getParameter("schemaName");
	 %>
		<html:form action="/delSchema">
			<html:hidden property="schemaName" value="<%=SchemaName%>"/>
			<html:errors property="schemaName"/><br/>
			您准备删除数据仓库模式<%=SchemaName%>,是否确定删除？
			<br>
			是<input type="radio" name="sureRadio" value="0" />
			否<input type="radio" name="sureRadio" value="1" checked />
			<br/>
			<html:button property="" onclick="check(this.form)">提交</html:button>
		</html:form>
		
		<script type="text/javascript">
    
    function check(form){
    	
    	var radio=document.getElementsByName("sureRadio");
    	if(radio[0].checked){
    		form.submit();
    	}
    	
    }
    
    </script>
	</body> 
</html>

