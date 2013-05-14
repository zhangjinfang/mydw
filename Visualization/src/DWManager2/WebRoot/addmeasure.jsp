<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>创建度量值</title>
  </head>
      <link rel="stylesheet" href="css/flora.all.css" type="text/css" media="screen" title="Flora (Default)" />
      <link rel="stylesheet" href="css/style.css" type="text/css" />
      
      <script type="text/javascript" src="js/jquery-latest.pack.js"></script>
      
      <script type="text/javascript">
     $(document).ready(function() {
        $("tab tr:nth-child(even)").addClass("striped");
      });
    </script>
   <style>
      body,td {
       font-size: 10pt;
      }
      table {
        background-color: green;
       border: 1px black solid;
        border-collapse: collapse;
      }
      th {
        border: 1px outset silver;
        background-color: coral;
        color: white;
      }
      tr {
        background-color: white;
        margin: 1px;
      }
      tr.striped {
        background-color: coral;    
      }
     td {
       padding: 1px 8px;
      }
   </style>
<%@ page import="java.util.*"%>
<%      String factTableName=session.getAttribute("factTable").toString();
        String[] columns=(String[])session.getAttribute("columns");
        String str="";
	   		for(int i=0;i<columns.length;i++)
	   		{
	   			String temp=columns[i];
	   			str+="<option value='"+temp+"'>"+temp+"</option>";
	   		}
%>

<script>

$(function()
{ $('#column').dblclick(function()
  {
   var col=document.getElementById("column");
   var val=col.value;
   var str3="";
   str3=$("<tr>"
+"<td><input type='text' value='"+val+"' id='"+val+"_columns' readonly >"
+"</input></td>"
+"<td><select id='"+val+"_function'>"
+"<option value='sum'>总和</option>"
+"<option value='count'>数目</option>"
+"<option value='avg'>平均值</option>"
+"<option value='max'>最大值</option>"
+"<option value='min'>最小值</option>"
+"<option value='distinct'>不显示重复</option>"
+"<option value='medium'>中间值</option>"
+"</select>"		 
+"</td>"
+"<td><select id='"+val+"_format'>"
+"<option value='standar'>标准</option>"
+"<option value='# ###.00'>#，###.00</option>"
+"<option value='# ###'>#，###</option>"
+"</select>"	     
+"</td>"
+"<td><input id='"+val+"_name' type='Text' value='"+val+"'></td>"
+"<td><button id='delete' onclick='$(this).parent().parent().remove()'>删除</button></td>"
+"</tr>").appendTo("#tab");

  });
  
  $('#next').click(function(){
     var ttdd=document.getElementsByTagName('td');
     var size=ttdd.length;
     var str="";
     for(i=0;i<size-2;i++)
     {if((i+1)%5!=0)
      {var vv=ttdd[i].childNodes[0].id;
       var value=document.getElementById(vv).value;
       str+=value+"$";
      }
      }
      var vv=ttdd[size-2].childNodes[0].id;
      var value=document.getElementById(vv).value;
      str+=value;
       var urlStr="addmeasure2.jsp?measures="+str;
			$.ajax({url: urlStr,
         	 type: 'GET',
             dataType: 'html',//html or xml返回的数据是html还是xml对象
             timeout: 60000,//超时时间设置，这里我们设置的是20秒 20 000毫秒
             error: function(){alert('error');
             },
             success: function(html){
             window.parent.frames[1].location.href="dimention.jsp";
             }
          });
   });  
});

</script>

  <body class="flora">
  <h2>第三步：设置度量的属性(双击表名添加度量值)</h2>
  <div id='description' style='padding:10px;height:auto;border-bottom: 2px solid #bbb;'>
    
    <select id="column" multiple="multiple" size="10" >
    <%= str%>
    </select> 
    <div style="position:absolute;left:320px;top:190px;">    
    </div>
    <br><br><br>
    <table id="tab" >
      <tr>
        <th>列名</th>
        <th>函数</th>
        <th>格式</th>
		<th>名称(不能为空)</th>
		<th>删除</th>
      </tr>
    </table>
    </div>
    <div align="right">               
    <button id="next" >下一步</button>
    </div>
  </body>
</html>

