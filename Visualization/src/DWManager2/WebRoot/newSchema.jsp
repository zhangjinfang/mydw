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
		&nbsp;&nbsp;&nbsp;&nbsp;����������Ҫ���������ݲֿ�ģʽ���֣�
	</h4>
    <html:form action="/addSchema">
     
    <td>
    <html:text property="schemaName"  />
	<html:errors property="schemaName" />
	</td>
	
	<tr>
	<html:button property="" onclick="check(this.form)">�ύ</html:button>
	<html:reset property="reset">����</html:reset>
	</tr>
    </html:form>
    
    <script type="text/javascript">
    
    function check(form){
    	if(document.getElementById("schemaName").value=="")
		{
		     alert("���ݲֿ�ģʽ���ֲ���Ϊ��,�����������ݲֿ�ģʽ����!");
		}
		else if(document.getElementById("schemaName").value.indexOf(" ")!=-1){
			alert("���ݲֿ�ģʽ���ֲ��ܺ��пո�,�����������ݲֿ�ģʽ����!");
		}
		else{
    		form.submit();
    	}
    }
    
    </script>
  </body>
</html:html>
