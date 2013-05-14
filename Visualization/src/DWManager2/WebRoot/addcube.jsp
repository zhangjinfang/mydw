<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>选表</title>

<link rel="stylesheet" href="css/flora.all.css" type="text/css" media="screen" title="Flora (Default)" />
<link rel="stylesheet" href="css/style.css" type="text/css" />

<script type="text/javascript" src="js/jquery-latest.pack.js"></script>

<script>

$(function(){
$("#s1 option:first,#s2 option:first").attr("selected",true);

$("#s1").dblclick(function(){
  var alloptions = $("#s1 option");
  var so = $("#s1 option:selected");
  so.get(so.length-1).index == alloptions.length-1?so.prev().attr("selected",true):so.next().attr("selected",true);
  $("#s2").append(so);
});

$("#s2").dblclick(function(){
  var alloptions = $("#s2 option");
  var so = $("#s2 option:selected");
  so.get(so.length-1).index == alloptions.length-1?so.prev().attr("selected",true):so.next().attr("selected",true);
  $("#s1").append(so);
});

$("#add").click(function(){
  var alloptions = $("#s1 option");
  var so = $("#s1 option:selected");
  so.get(so.length-1).index == alloptions.length-1?so.prev().attr("selected",true):so.next().attr("selected",true); 
  $("#s2").append(so);
});

$("#remove").click(function(){
  var alloptions = $("#s2 option");
  var so = $("#s2 option:selected"); 
  so.get(so.length-1).index == alloptions.length-1?so.prev().attr("selected",true):so.next().attr("selected",true);
  $("#s1").append(so);
});

$('#submit').click(function(){
  var name=cubename.value;
  var tab=$('#s2').children();
  var size=tab.size();
  var tablelist="";
  if(name=="") alert("新建立方体名称不能为空，请输入新建立方体名称");  
  else{if(size==0) alert("所需要的表不能为空，请从左边方框选择所需要的表");
         else{for(i=0;i<size-1;i++){
         tablelist+=($('#s2').children().eq(i).val()+"$");
         };
         tablelist+=$('#s2').children().eq(size-1).val();
         var urlstr="tablelist.jsp?cubename="+name+"&tablelist="+tablelist;
         urlstr=encodeURI(urlstr);
         $.ajax({url: urlstr,
          type: 'GET',
             dataType: 'html',//html or xml返回的数据是html还是xml对象
             timeout: 60000, //超时时间设置，这里我们设置的是20秒 20 000毫秒
             error: function(){alert('error');
             },
             success: function(){
             }
          });
          
         window.parent.frames[1].location.href="builtRelate.jsp";
         };
  };
});
});

</script>

</head>
<%@ page import="data.web.model.GetTablesBean,java.util.*"%>
<% GetTablesBean gtb=new GetTablesBean();
    		String driverName = session.getAttribute("connDriver").toString();
			String connectString = session.getAttribute("connString").toString();
			String userName = session.getAttribute("userName").toString();
			String password = session.getAttribute("passWord").toString();
	gtb.initializeDataConnection(driverName, connectString,userName, password);
	   		ArrayList<String> newArray = new ArrayList<String>();
	   		newArray=gtb.getTables();
	   		String str="";
	   		for(int i=0;i<newArray.size();i++)
	   		{
	   			String temp=newArray.get(i);
	   			str+="<option value='"+temp+"'>"+temp+"</opttion>";
	   		}
%>
<body class="flora" >
<h2>第一步</h2>
<div align="center" style="  border-bottom: 2px solid #bbb;" >
<p width=400>输入新建立方体名称：</p>
<input id="cubename" type="text" ></input>
<br><br><br>
<p>从要包含在数据源视图中的关系数据库中选择对象</p>
<table width="500" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="200"><select name="s1" size="15" multiple="multiple" id="s1" style=" width:200px;">
	  <%= str%>
    </select></td>
    <td width="60" align="center">
    <input type="button" name="add" id="add" value="->" /><br />
	<input type="button" name="remove" id="remove" value="<-" /> </td>
    <td width="200"><select name="s2" size="15" multiple="multiple" id="s2" style=" width:200px;">
    </select></td>
  </tr>
</table><br><br><br>
</div>
<div align="right">
<button id="submit" >下一步</button> 
</div>
</body>
</html>