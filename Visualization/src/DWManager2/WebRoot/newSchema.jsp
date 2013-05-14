<%@ page language="java" pageEncoding="GB2312"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html locale="true">
  <head>
    <html:base />
    
    <title>addSchema.jsp</title>

  </head>
  
  <body>
  
  <h4>
		&nbsp;&nbsp;&nbsp;&nbsp;请输入你所要创建的数据仓库模式名字：
	</h4>
    <html:form action="/addSchema">
     
    <td>
    <html:text property="schemaName"  />
	<html:errors property="schemaName" />
	</td>
	
	<tr>
	<html:button property="" onclick="check(this.form)">提交</html:button>
	<html:reset property="reset">重置</html:reset>
	</tr>
    </html:form>
    
    <script type="text/javascript">
    
    function check(form){
    	if(document.getElementById("schemaName").value=="")
		{
		     alert("数据仓库模式名字不能为空,请再输入数据仓库模式名字!");
		}
		else if(document.getElementById("schemaName").value.indexOf(" ")!=-1){
			alert("数据仓库模式名字不能含有空格,请再输入数据仓库模式名字!");
		}
		else{
    		form.submit();
    	}
    }
    
    </script>
  </body>
</html:html>
