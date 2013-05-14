<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page language="java" import="java.sql.*"%>
<%@ page import="data.web.model.GetTablesBean;"%>
    <%
            	System.out.println("start!");
            	
				
				
				
				
            	String driverName = (String)session.getAttribute("connDriver");
            	String connectString = (String)session.getAttribute("connString");
            	String userName =(String)session.getAttribute("userName");
            	String password =(String)session.getAttribute("passWord");
            	String table = (String)request.getParameter("table");
        		GetTablesBean gtlBean = new GetTablesBean();
        		ArrayList<String> newArray = new ArrayList<String>();
        		try {
        	gtlBean.initializeDataConnection(driverName, connectString,
        	   		userName, password);
        	System.out.println("ini");
        	newArray = gtlBean.getColumns(table);
        	 	    gtlBean.close();
        	System.out.println("get:"+table);
        		} catch (SQLException e) {
        	}
        	String tablelist="<select class='column' id='"+table+"'  size=8;multiple='multiple' style='width:100%'>\n";
        	for(int i=0;i<newArray.size();i++)
        	{
        		String temp=newArray.get(i);
        		System.out.println(temp);
        		tablelist+="<option value='"+temp+"'>"
        		+temp+"</option>\n";
        	} 
        	tablelist+="</select>\n";
    %>
  <%=tablelist %>
