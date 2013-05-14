<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="css/screen.css" />
  <link rel="stylesheet" href="css/jquery.treeview.css" />
  <style>
  h2 { padding: 5px; margin: 5px; border-bottom: 2px solid #bbb; line-height: 7px; font-size: 14px; margin-top: 5px; margin-bottom: 0px; color: #333; }
  
  </style>
  <script src="js/jquery.js" type="text/javascript"></script>
  <script src="js/jquery.treeview.js" type="text/javascript"></script>
  <%
  	String[] dementions=(String[])session.getAttribute("dementions");
  	String demOption=new String();
  	for(int i=0;i<dementions.length;i+=3)
  	{
  		demOption+="<option primaryKey='"+dementions[i+1]+"' foreignKey='"+dementions[i+2]+"' value='"+dementions[i]+"'>"+
  		dementions[i]+"</option>";
  	}
   %>
  <script type="text/javascript">
  $(document).ready(function(){
  var table= $('select.table').val();
  $.ajax({url: "getCol2.jsp?table="+table,
          type: 'GET',
             dataType: 'html',//html or xml返回的数据是html还是xml对象
             timeout: 60000,//超时时间设置，这里我们设置的是20秒 20 000毫秒
             error: function(){alert('error');
             },
             success: function(html){
               $("div.columnList").append(html);
             }
          });
  $('#wholeTree').treeview({
		});
		});
	function addNote()
	{
		var jTable=$('select.table');
		var table=jTable.val();
		var column=$("select.column[id='"+table+"']").val();
		var jOption=jTable.find("option[value='"+table+"']");
		if(column==null)alert("请选择列");
		else{
		var name=table+"."+column;
		var t=$("<li ><span name='"+name+"' class='demension' foreignKey='"+jOption.attr('foreignKey')+"'><div onclick='clickDemension(this)'>"+name+"</div></span>"+
    		"<ul>"+
    			"<li><span tableName='"+table+"' hasAll='ture' name='"+name+"' class='hierarchy' primaryKey='"+jOption.attr('primaryKey')+"'><div onclick='clickHierarchy(this)'>"+name+"</div></span>"+
    				"<ul>"+
    					"<li><span uniquemembers='false' nameColumn='"+column+"' name='"+name+"' class='level'><div onclick='clickLevel(this)'>"+name+"</div></span></li>"+
    				"</ul>"+
    			"</li>"+
    		"</ul>"+
    	"</li>").appendTo('#wholeTree');
    	$("#wholeTree").treeview({
				add: t
			});
			}
	}
	function	addNote2()
	{
		var table=$('select.table').val();
		var column=$("select.column[id='"+table+"']").val();
		var name=table+"."+column;
		var newNote="";
		var item=$('div.spanselected').parent().parent();
		if(item.find('ul').size()==0)
		{
			newNote="<ul>"+
    					"<li><span uniquemembers='false' nameColumn='"+column+"' name='"+name+"' class='level'><div onclick='clickLevel(this)'>"+name+"</div></span></li>"+
    				"</ul>";
    		var t=$(newNote).appendTo(item);
    		$("#wholeTree").treeview({
    			add:item
			});	
		}
	}
	
	function   del()
	{
	 var item1=$('div.spanselected').parent().attr("class");
	 var item2=$('div.spanselected').parent().parent().parent().parent().children().eq(1).attr("class");
	 if(item1=='demension'){$('div.spanselected').parent().parent().remove();}
	 else if(item1=='level')
	 {
	  if(item2!='hierarchy'){$('div.spanselected').parent().parent().parent().remove();}
	 }
	}
	
	function clickDemension(thisItem)
	{
		$("div.spanselected").removeClass("spanselected");
		$(thisItem).addClass("spanselected");
		$('input#hasAll,input#nameColumn,input#uniquemembers').parent().hide();
		$('#name').val($(thisItem).parent().attr('name')).parent().show();
	}
	function clickHierarchy(thisItem)
	{
		$("div.spanselected").removeClass("spanselected");
		$(thisItem).addClass("spanselected");
		$('input#nameColumn,input#uniquemembers').parent().hide();
		$('#name').val($(thisItem).parent().attr('name')).parent().show();
		$('#hasAll').val($(thisItem).parent().attr('hasAll')).parent().show();
	}
	function clickLevel(thisItem)
	{
		$("div.spanselected").removeClass("spanselected");
		$(thisItem).addClass("spanselected");
		$('input#hasAll').parent().hide();
		$('input#name').val($(thisItem).parent().attr('name')).parent().show();
		$('input#nameColumn').val($(thisItem).parent().attr('nameColumn')).parent().show();
		$('input#uniquemembers').val($(thisItem).parent().attr('uniquemembers')).parent().show();
	}
	function change(thisItem)
	{
		var item=$(thisItem);
		//var id=item.attr('id');
		var id=thisItem.id;
		var thisSpan=$("div.spanselected");
		var thisClass=thisSpan.parent().attr("class");
		thisSpan.parent().attr(id,thisItem.value);
		if(id=='name')
		{
			thisSpan.text(thisItem.value);
			if(thisClass=='demension')
			{	
				thisSpan.parent().next().find('.hierarchy')
				.attr(id,thisItem.value)
				.children().text(thisItem.value);
			}
			else if(thisClass=='hierarchy')
			{
				thisSpan.parent().parent().parent().prev()
				.attr(id,thisItem.value)
				.children().text(thisItem.value);
			}
		}
	}
	function getColumn()
	{
		var table= $('select.table').val();
		var column=$("select.column[id='"+table+"']");
		if(column.size()==0)
		{
		$("select.column").hide();
		$.ajax({url: "getCol2.jsp?table="+table,
          type: 'GET',
             dataType: 'html',//html or xml返回的数据是html还是xml对象
             timeout: 60000,//超时时间设置，这里我们设置的是20秒 20 000毫秒
             error: function(){alert('error');
             },
             success: function(html){
               $("div.columnList").append(html);
             }
          });
          }
          else {$("select.column").hide();column.show();}
	}
	function next()
	{
		var tree=$(".demension");
		var dementions=new Array();
		if(tree.size()==0)alert("请建立维度");
		else
		{
			//alert("有"+tree.size()+"棵树")
			var i=0;
			for(i=0;i<tree.size();i++)
			{
				var demInfo=new Array();
				var dem=tree.eq(i);
				var name=dem.attr("name");
				var foreignKey=dem.attr("foreignKey");
				var hierarchy=dem.parent().find(".hierarchy");
				var hierarchyName=hierarchy.attr("name");
				var allMemberName="All "+hierarchyName;
				var hasAll=hierarchy.attr("hasAll");
				var primaryKey=hierarchy.attr("primaryKey");
				var tableName=hierarchy.attr("tableName");
				demInfo.push(name);
				demInfo.push(foreignKey);
				demInfo.push(hierarchyName);
				demInfo.push(hasAll);
				demInfo.push(allMemberName);
				demInfo.push(primaryKey);
				demInfo.push(tableName);
				var levels=hierarchy.parent().find(".level");
				var j=0;
				for(j=0;j<levels.size();j++)
				{
					var level=levels.eq(j);
					var levelName=level.attr("name");
					var column=level.attr("nameColumn");
					var uniqueMembers=level.attr("uniquemembers");
					demInfo.push(levelName);
					demInfo.push(column);
					demInfo.push(uniqueMembers);
				}
				var str=demInfo.join("^");
				dementions.push(str);
				//alert("第"+i+"棵:"+str);
			}
			var urlStr="dimentionHandle.jsp?demention="+dementions.join("$");
			urlStr=encodeURI(urlStr);
			//alert(urlStr);
			$.ajax({url: urlStr,
         	 type: 'GET',
             dataType: 'html',//html or xml返回的数据是html还是xml对象
             timeout: 60000,//超时时间设置，这里我们设置的是20秒 20 000毫秒
             error: function(){alert('error');
             },
             success: function(html){
             window.parent.frames[0].location.reload();
             window.parent.frames[1].location.href="finish.jsp";
             }
          });
			
		}
	}
  </script>
  </head>
  <body class='flora'>
    <h2>第四步：添加维度和层次</h2>
    <div id='addDec' style="height:auto;padding:10px;border-bottom: 2px solid #bbb;">
    <table >
    <tr valign="top" >
    <td  >
    <div id='tableList' style="width:350px;height:150px;" >
    <div><button id='addNewDec' onclick='addNote()'>添加新维度</button>
    <button id='addTo' onclick='addNote2()'>添加层次</button>
    <button id='del' onclick='del()'>删除</button>
    </div>
    <div>
    <select class='table' style="width:100%" onchange='getColumn()'>
    <%=demOption %>
    </select>
    </div>
    <div class='columnList'>
    </div>
    </div>
    </td>
    <td  rowspan='2'>
    <div id="decTree" style="border:1px solid black;font-size: 70%;overflow:auto;padding:10px;background:white;width:350px;height:370;">
    <ul class='filetree' id="wholeTree"><div>维度</div>
    </ul>
    </div>
    </td>
    </tr>
    <tr valign="top">
    <td >
    <div id='properties' style='font-size: 70%;height:150px;width:350px;border:1px solid black;'>
    <div style='background:#00FFFF'>属性:</div>
    <div style='display:none'>name:<input id='name' type='text' onchange="change(this)"></input></div>
    <div style='display:none'>hasAll:<input id='hasAll' type='text' onchange="change(this)"></input></div>
    <div style='display:none'>Column:<input id='nameColumn' type='text' onchange="change(this)"></input></div>
    <div style='display:none'>uniquemembers:<input id='uniquemembers' type='text' onchange="change(this)"></input></div>
    </div>
    </td>
    </tr>
    </table>
    </div>
    <div align="right">
    <button id='next' onclick='next()'>完成</button>
    </div>
  </body>
</html>
