<%@ page session="true" contentType="text/html; charset=ISO-8859-1" %>

<%--

  JPivot / WCF comes with its own "expression language", which simply
  is a path of properties. E.g. #{customer.address.name} is
  translated into:
    session.getAttribute("customer").getAddress().getName()
  WCF uses jakarta commons beanutils to do so, for an exact syntax
  see its documentation.

  With JSP 2.0 you should use <code>#{}</code> notation to define
  expressions for WCF attributes and <code>\${}</code> to define
  JSP EL expressions.

  JSP EL expressions can not be used with WCF tags currently, all
  tag attributes have their <code>rtexprvalue</code> set to false.
  There may be a twin library supporting JSP EL expressions in
  the future (similar to the twin libraries in JSTL, e.g. core
  and core_rt).

  Check out the WCF distribution which contains many examples on
  how to use the WCF tags (like tree, form, table etc).

--%>


<html>
<head>
  <title>JPivot Test Page</title>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <link rel="stylesheet" type="text/css" href="jpivot/table/mdxtable.css">
  <link rel="stylesheet" type="text/css" href="jpivot/navi/mdxnavi.css">
  <link rel="stylesheet" type="text/css" href="wcf/form/xform.css">
  <link rel="stylesheet" type="text/css" href="wcf/table/xtable.css">
  <link rel="stylesheet" type="text/css" href="wcf/tree/xtree.css">
  <%
  	
  	String schemaName = (String)request.getParameter("schemaName");
	String cubeName = (String)request.getParameter("cubeName");
	session.setAttribute("schemaName3", schemaName);
	session.setAttribute("cubeName3", cubeName);
	session.setAttribute("controlTestpage",true);
   %>

</head>

<body>

</body>
   <script type="text/javascript">
   	//function toJpivot(){
   		location.href = "jpivot.jsp";
   	//}
   </script>
</html>
