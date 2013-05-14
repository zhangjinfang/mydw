<%@ page language="java" pageEncoding="GB2312"%>

<html>
	<head>
		<title>file upload and data source configure</title>
	</head>

	<body><div align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		 
			 
			 
			<br><br><br><br><br><br><br><input type="button" value="上传数据文件 " onclick="popuploadWin()">  &nbsp; &nbsp; &nbsp; &nbsp;  <input type="button" value="配置ODBC" onclick="popNewWin()"> 
 
	 
	</div></body>
<script type="text/javascript">
	function popNewWin() 
	{
       var newWin;
       newWin=window.open("createOdbc.jsp", "", "status,width=200,height=200,top=300,left=300,menubar=no,toolbar=no,location=no,scrollbars=no");
    }
    function popuploadWin()
    {
    	var newWin;
    	newwin=window.open("uploadfile.html","","");
    }
 
    
    
</script>


	

</html>

