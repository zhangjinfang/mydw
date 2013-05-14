
<%@ page import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%  
        String table=request.getParameter("tablelist");
        String cubeName=request.getParameter("cubename");
        System.out.println(":有:"+cubeName);
        String[] tableList=table.split("\\$");
        session.setAttribute("cubename",cubeName);
        String a=(String)session.getAttribute("cubename");
        System.out.println(a);
        session.setAttribute("tableList",tableList);
        %>