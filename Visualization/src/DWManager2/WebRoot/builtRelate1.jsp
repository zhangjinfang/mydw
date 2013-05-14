<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
<title>test Jquery</title>

<link rel="stylesheet" href="css/flora.all.css" type="text/css" media="screen" title="Flora (Default)" />
<link rel="stylesheet" href="css/style.css" type="text/css" />

<script type="text/javascript" src="js/jquery-latest.pack.js"></script>
<script type="text/javascript" src="js/jquery.dimensions.js"></script>
<script type="text/javascript" src="js/huaxian.js"></script>
<script type="text/javascript" src="js/ui.mouse.js"></script>
<script type="text/javascript" src="js/ui.resizable.js"></script>
<script type="text/javascript" src="js/ui.draggable.js"></script>
<script type="text/javascript" src="js/ui.draggable.ext.js"></script>
</head>
<%@ page import="java.util.*"%>
<%
	   		//String table=request.getParameter("tablelist");
	   		//String cubeName=(String)session.getAttribute("cubename");
	   		String[] tableList=(String[])session.getAttribute("tableList");
	   		//session.setAttribute("cubeName",cubeName);
	   		String str="";
	   		String str2="";
	   		Random rand=new Random();
	   		for(int i=0;i<tableList.length;i++)
	   		{
	   	int left=rand.nextInt(700);
	   	int top=rand.nextInt(200);
	   	left-=left/700*700;
	   	String temp=tableList[i];
	   	str+="<option value='"+temp+"'>"+temp+"</option>\n";
	   	str2+="<div id='"
	   	+temp
	   	+"' class='ui-wrapper table' style='left:"+left+"px;top:"+top+"px' >\n<div id='title' style='float:top'>\n<a herf='#' style='float:right;' onclick='closeTable(this)'>[X] x</a>"
	   	+temp+"<input type='checkbox' style='float:bottom;' onclick='isFact(this)'>事实表</input></div>\n</div>\n";
	   		}
%>
<script type="text/javascript">
var from_x=null;
var from_y=null;
var to_x=null;
var to_y=null;
var isDrawing=false;
var fromColumn=null;
var fromTable=null;
var toColumn=null;
var toTable=null;
var lineNum=0;
var tableNum=1;
var lineList=new Array();
var tablePositionList=new Array();
tablePositionList.push(new Array([0,0]))
var deleteLineList=new Array();
var ifTest=true;
function draw(dd)
{
	$(dd).toggleClass("selectCol");
	if(isDrawing)
	{	
		if(fromColumn==null||fromTable==null)
		{
			fromColumn=$(dd).attr("type");
			fromTable=$(dd).parent().parent().attr("type");
		    //alert("column:"+fromColumn+"\ntabel:"+fromTable);
		}
		else
		{
			toColumn=$(dd).attr("type");
			toTable=$(dd).parent().parent().attr("type");
			if(toTable==fromTable)
			{
				fromColumn=toColumn;
			}
			else
			{
				if(deleteLineList.length==0)
				{
				var lineId=lineNum;lineNum+=1;
				// alert("column:"+toColumn+"\ntabel:"+toTable+"\nid:"+lineId);
				var line=new Array();
				line.push(lineId);
				line.push(fromColumn);
				line.push(fromTable);
				line.push(toColumn);
				line.push(toTable);
				//var graphic = new FlowGraphic();
	        	var arrow =graphic.drawLine(lineId,0,0,0,0);
				lineList.push(line);
				doDraw2($("line[id='"+lineId+"']").click(function(){
				$("line[strokecolor='red']").attr('strokecolor','black');
				$(this).attr('strokecolor','red');
				//var tl=$(this).attr('id');
				$("button[id='delLine']").show();
				//var tablefrom=$("div.table[type='"+lineList[tl][2]+"']").attr('id');
				//$("div.property[id='from']").text(tablefrom+"."+$("div."+tablefrom+"_column[type='"+lineList[tl][1]+"']").attr('id'));
				//var tableto=$("div.table[type='"+lineList[tl][4]+"']").attr('id')
				//$("div.property[id='to']").text(tableto+"."+$("div."+tableto+"_column[type='"+lineList[tl][3]+"']").attr('id'));
				//$("div.properties").show('fast');
				//msg(lineList[tl][1]+":"+lineList[tl][3]);
				resetProperties();
				}));
				}
				else
				{
					var lineId=deleteLineList.pop();
					lineList[lineId][1]=fromColumn;
					lineList[lineId][2]=fromTable;
					lineList[lineId][3]=toColumn;
					lineList[lineId][4]=toTable;
					doDraw2($("line[id='"+lineId+"']").removeClass("delLine"));
				}
				fromColumn=null;fromTable=null;toColumn=null;toTable=null;
			}
		}
	}
};
</script>
<script type="text/javascript">
	function setUp(jq){
	jq.appendTo("#main");
	};
	function dragEnd(e,ui)
	{	
		var num=$(this).attr("type");
		tablePositionList[num][0]=ui.position.left;
		tablePositionList[num][1]=ui.position.top;
		var begin=new Date();
		doDraw2($("line"));
		var end=new Date();
		var use=end.getTime()-begin.getTime();
		msg(lineNum+":"+use);
};
function resetProperties()
{
	var toDel=$("line[strokecolor='red']");
	if(toDel.size()==0)$("div.properties").hide('fast');
	else 
	{	
		var tl=toDel.attr('id');
		var tablefrom=$("div.table[type='"+lineList[tl][2]+"']");
		$("div.property[id='from']").text(tablefrom.attr('id')+"."+tablefrom.find("div.column[type='"+lineList[tl][1]+"']").attr('id'));
		var tableto=$("div.table[type='"+lineList[tl][4]+"']");
		$("div.property[id='to']").text(tableto.attr('id')+"."+tableto.find("div.column[type='"+lineList[tl][3]+"']").attr('id'));
		$("div.properties").show('fast');
		msg(lineList[tl][1]+":"+lineList[tl][3]);
	}
}
function msg(message)
{
	if(ifTest)
	$('#msg').attr('value',message);
}
function doDraw2(jqLine)
{
	if(lineNum>0)
	{
	jqLine.each(function(){
	var thisLine=$(this);
	var id=thisLine.attr('id');
	var fromCol=lineList[id][1];
	var fromTab=lineList[id][2];
	var toCol=lineList[id][3];
	var toTab=lineList[id][4];
	from_x=tablePositionList[fromTab][0];
	from_y=tablePositionList[fromTab][1]+10+fromCol*15;
	to_x=tablePositionList[toTab][0];
	to_y=tablePositionList[toTab][1]+10+toCol*15;
	if(to_x<from_x)to_x+=150;else from_x+=150;
	thisLine.attr('from',from_x+'px,'+from_y+'px,')
			.attr('to',to_x+'px,'+to_y+'px,');
	});
	}
}
function deleteLine(thisButton)
{
	$(thisButton).hide();
	var toDel=$("line[strokecolor='red']");
	toDel.attr('strokecolor','black');
	doDeleteLine(toDel);
}
function doDeleteLine(jqlineToDel)
{
	jqlineToDel.each(function(){
	var delId=$(this).addClass("delLine").attr('strokecolor','black').attr('id');
	/* 第二种算法*/
	var i=1;
	for(i=1;i<5;i++)
	{
		lineList[delId][i]=0;
	}
	deleteLineList.push(delId);
	/*  第一种算法
	var i=1;
	for(i=1;i<5;i++)
	{
		lineList[delId][i]=lineList[lineNum-1][i];
	}
	$("line[id='"+(lineNum-1)+"']").remove();
	lineList.pop();lineNum--;
	*/
	});
	doDraw2(jqlineToDel);
	resetProperties();
}
function isFact(thisCheck)
{
	var table=$(thisCheck).parent().parent();
	if($(thisCheck).attr("checked"))
	{msg("check");
	$('.factTable').removeClass('factTable').find("input[type='checkbox']").attr('checked','');
	table.addClass("factTable");}
	else
	table.removeClass("factTable");
}
function closeTable(thisTable)
{
	var check=$(thisTable).next();
	if(check.attr('checked'))
	{	
		check.attr('checked','').parent().parent().removeClass("factTable");
	}
	var table=$(thisTable).parent().parent();
	table.hide('fast');
	var tableType=table.attr('type');
	var i=0;
	var lineStr="line#";
	var lineToDel=new Array();
	for(i=0;i<lineNum;i++)
	{
		var tempLine=lineList[i];
		if(tempLine[2]==tableType||tempLine[4]==tableType)
			lineToDel.push(i);
	}
	if(lineToDel.length>0)
	{lineStr+=lineToDel.join(',line#');
	msg(lineStr);
	doDeleteLine($(lineStr));
	}
}
function doDraw()
{	
		var i=0;
		//var allLine=$("line");
		for(i=0;i<lineList.length;i++)
		{
			var line=lineList[i];
			lineId=line[0];
			fromColumn=line[1];
			fromTable=line[2];
			toColumn=line[3];
			toTable=line[4];
			var type=$("div."+fromTable+"_column[id='"+fromColumn+"']" ).attr("type");
			var start=$("div.table[id='"+fromTable+"']");
			from_x=start.css("posLeft");
			from_y=start.css("posTop")+type*15;
			//alert("type:"+type+"\nx:"+from_x+"\ny:"+from_y);
			var type1=$("div."+toTable+"_column[id='"+toColumn+"']" ).attr("type");
			var end=$("div.table[id='"+toTable+"']");
			to_x=end.css("posLeft");
			to_y=end.css("posTop")+type1*15;
			//alert("type1:"+type1+"\nx:"+to_x+"\ny:"+to_y);
			//alert($('#'+lineList[i][0]).attr("from")+"-"+$('#'+lineList[i][0]).attr("to"))
			//allLine.filter("#"+lineId).attr('from',from_x+'px,'+from_y+'px,')
			//.attr('to',to_x+'px,'+to_y+'px,');
			fromColumn=null;fromTable=null;toColumn=null;toTable=null;
		}
};
function next()
{
	var factTable=$('.factTable');
	var dem=new Array();
	if(factTable.size()==0)alert("请指定事实表");
	else
	{	
		var j=0;
		for(j=0;j<lineList.length;j++)
		{
			var type=lineList[j][2];
			if(type!=0)
			{
				var table=$("div.table[type='"+type+"']");
				var column1=table.find(".column").eq(lineList[j][1]-1);
				var column2=$(".factTable").find(".column").eq(lineList[j][3]-1);
				dem.push(table.attr('id'));
				dem.push(column1.attr('id'));
				dem.push(column2.attr('id'));
			}
		}
		if(dem.length==0)alert('请建立关系');
		else{
		var demStr=dem.join("$");
		var tableName=factTable.attr('id');
		var columnList=factTable.find('.column');
		var column=new Array();
		var i=0;
		for(i=0;i<columnList.size();i++)
		{	
			column.push(columnList.eq(i).attr('id'));
		}
		var columnStr=column.join("$");
		var urlStr="builtRelateHandle.jsp?factTable="+tableName+"&columnList="+columnStr+"&demList="+demStr;
		urlStr=encodeURI(urlStr);
		$.ajax({url: urlStr,
          type: 'GET',
             dataType: 'html',//html or xml返回的数据是html还是xml对象
             timeout: 60000,//超时时间设置，这里我们设置的是20秒 20 000毫秒
             error: function(){alert('error');
             },
             success: function(html){
            window.parent.frames[1].location.href=html;
             }
          });
		}
	}
}

/*
           */

	$(document).ready(function(){
	//$('#main').draggable();
		$("select[id='select']").dblclick(function(){
		var value=document.getElementById("select");
		var jq=$("div.table[id='"+value.value+"']");
	    //var jq=$("#"+value.value);
	    if(jq.find("div.columnList").size()==0)
	{jq.resizable({minWidth:'1',minHeight:'1'})
	.draggable({containment:'parent',handle:'#title',scroll:false,opacity:0.7,stop:dragEnd}).show('fast')
	.attr('type',tableNum);
	tableNum+=1;
	var position=new Array();
	var p_left=jq.css("posLeft");
	var p_top=jq.css("posTop");
	position.push(p_left);
	position.push(p_top);
	tablePositionList.push(position);
	$.ajax({url: "getCol.jsp?table="+value.value,
          type: 'GET',
             dataType: 'html',//html or xml返回的数据是html还是xml对象
             timeout: 60000,//超时时间设置，这里我们设置的是20秒 20 000毫秒
             error: function(){alert('error');
             },
             success: function(html){
               $("div.table[id='"+value.value+"']").append(html);
             }
          });}
          else {jq.show('fast');msg("显示table")}
          });
	$("button[id='draw']").click(function(){
	isDrawing=true;
	$(this).hide().next().show();
	});
	$("button[id='doNotDraw']").click(function(){
	isDrawing=false;
	fromColumn=null;fromTable=null;toColumn=null;toTable=null;
	$(this).hide().prev().show();
	});
	});
		
</script>
<body class="flora">
<h2>请建立表的关系，双击表名可以展开表。</h2><button id="draw">建立关系</button><button id="doNotDraw" style="display:none;">不建立了</button><button id='delLine' style="display:none;" onclick="deleteLine(this)">删除关系</button>
<input id="msg" type="text" size='100'></input>
<button id="next" onclick='next()'>下一步</button>
<div id="main2" class="playground" >
<div id='main' class="tableGround" >
<%=str2 %></div>
</div>
<script type="text/javascript">
var graphic = new FlowGraphic();
</script>
<select id="select" multiple="multiple" size="8" style="position: absolute; margin-right: 0px; margin-left: 0px; margin-bottom: 0px; margin-top: 0px">
<%= str%>
</select>
<div class='properties' style="display:none;float:right;width:200px;height:100px;background:white;border:1px solid black">
<div style='background:#50A029;'>属性</div>
<div>from:<div class='property' id='from'></div></div>
		<div>to:<div class='property' id='to'></div></div>
		</div>
		</body>
</html>