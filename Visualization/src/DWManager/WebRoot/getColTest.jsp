<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page language="java" import="java.sql.*"%>
<%@page import="data.web.model.GetTablesBean;"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <%
    	String driverName = session.getAttribute("driverName").toString();
    	String connectString = session.getAttribute("connectString").toString();
    	String userName = session.getAttribute("userName").toString();
    	String password = session.getAttribute("password").toString();
    	String getCol = request.getParameter("tableName").toString();
//    	GetAllTheTableNames bean = new GetAllTheTableNames(driverName, connectString, userName, password, "false", getCol);
//    	getCol = bean.getCols();  
//    	String[] newArray = getCol.split("&");
		GetTablesBean gtlBean = new GetTablesBean();
		ArrayList<String> newArray = new ArrayList<String>();
		
		try {
			gtlBean.initializeDataConnection(driverName, connectString,
	   		userName, password);
			
			newArray = gtlBean.getColumns(getCol);
			gtlBean.close();
		} catch (SQLException e) {
			response.sendRedirect("cError.jsp");
		}
		
 //   	String[] measureColumn_array = (String[])session.getAttribute("measureColumn_array");
   // 	boolean hasSameColumn = false;
  //  	for(int i = 0; i < measureColumn_array.length; i++){
  //  		for(int j = 0; j < newArray.length; j++){
  //  			if(measureColumn_array[i].equals(newArray[j]))
  //  			hasSameColumn = true;
  //  		}
 //   	}
    	String checkboxString = "<table>";
    	for(int i = 0; i < newArray.size(); i++){
    		checkboxString += "<tr><td><input type='checkbox' name='column' value='" + newArray.get(i) + "'></td><td>" + newArray.get(i) + "</td></tr>";
    	}
    	checkboxString += "</table>";
    	//if(!hasSameColumn){
    //		checkboxString = "false";
    //	}
     %>
    <title>My JSP 'getColTest.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  
     <%=checkboxString %>
     
  </body>
</html>
