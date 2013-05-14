<%@ page language="java"  pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    

  </head>
  
  <body>
    预计算结果为：<%=(String)session.getAttribute("message") %> <br>

    <script type="text/javascript">
    window.parent.frames["tree"].location.reload();
    </script>
    
  </body>
</html>
