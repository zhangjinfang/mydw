<%@ page language="java" import="com.jspsmart.upload.*" %>
<%@ page contentType="text/html;charset=GB2312" %>

<html>
<head>
<title>文件上传</title>
</head>
<body>

<h2>文件上传</h2>

<jsp:useBean id="mySmartUpload" scope="page" class="com.jspsmart.upload.SmartUpload"/>
<%
//计算文件上传个数
int count=0;

//SmartUpload的初始化，使用这个jspsmart一定要在一开始就这样声明
mySmartUpload.initialize(pageContext);

//依据form的内容上传
mySmartUpload.upload();

//将上传的文件一个一个取出来处理
for (int i=0;i<mySmartUpload.getFiles().getCount();i++)
{
//取出一个文件
com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(i);

//如果文件存在，则做存档操作
if (!myFile.isMissing()) {

//将文件存放于绝对路径的位置
myFile.saveAs("C:\\upload\\" + myFile.getFileName(),

mySmartUpload.SAVE_PHYSICAL);

//显示此上传文件的详细信息
out.println("FieldName = " + myFile.getFieldName() + "<BR>");
out.println("Size = " + myFile.getSize() + "<BR>");
out.println("FileName = " + myFile.getFileName() + "<BR>");
out.println("FileExt = " + myFile.getFileExt() + "<BR>");
out.println("FilePathName = " + myFile.getFilePathName() + "<BR>");
out.println("ContentType = " + myFile.getContentType() + "<BR>");
out.println("ContentDisp = " + myFile.getContentDisp() +"<BR>");
out.println("TypeMIME = " + myFile.getTypeMIME() +"<BR>");
out.println("SubTypeMIME = " + myFile.getSubTypeMIME() + "<BR>");
count ++;
}
}

// 显示应该上传的文件数目
out.println("<BR>" + mySmartUpload.getFiles().getCount() + " files could be uploaded.<BR>");

// 显示成功上传的文件数目
out.println(count + "file(s) uploaded.");
%>
<input type="button" value="关闭" onclick="closeWin()">
    <script type="text/javascript">
    function closeWin()
    {
    window.close();
    }
    </script>

</body>
</html>