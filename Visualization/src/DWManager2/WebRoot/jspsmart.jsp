<%@ page language="java" import="com.jspsmart.upload.*" %>
<%@ page contentType="text/html;charset=GB2312" %>

<html>
<head>
<title>�ļ��ϴ�</title>
</head>
<body>

<h2>�ļ��ϴ�</h2>

<jsp:useBean id="mySmartUpload" scope="page" class="com.jspsmart.upload.SmartUpload"/>
<%
//�����ļ��ϴ�����
int count=0;

//SmartUpload�ĳ�ʼ����ʹ�����jspsmartһ��Ҫ��һ��ʼ����������
mySmartUpload.initialize(pageContext);

//����form�������ϴ�
mySmartUpload.upload();

//���ϴ����ļ�һ��һ��ȡ��������
for (int i=0;i<mySmartUpload.getFiles().getCount();i++)
{
//ȡ��һ���ļ�
com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(i);

//����ļ����ڣ������浵����
if (!myFile.isMissing()) {

//���ļ�����ھ���·����λ��
myFile.saveAs("C:\\upload\\" + myFile.getFileName(),

mySmartUpload.SAVE_PHYSICAL);

//��ʾ���ϴ��ļ�����ϸ��Ϣ
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

// ��ʾӦ���ϴ����ļ���Ŀ
out.println("<BR>" + mySmartUpload.getFiles().getCount() + " files could be uploaded.<BR>");

// ��ʾ�ɹ��ϴ����ļ���Ŀ
out.println(count + "file(s) uploaded.");
%>
<input type="button" value="�ر�" onclick="closeWin()">
    <script type="text/javascript">
    function closeWin()
    {
    window.close();
    }
    </script>

</body>
</html>