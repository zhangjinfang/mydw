//����ű�����һ��·������һ��XML�ļ�
function loadXML(xmlFile) {
	var xmlDoc;
	//�����ΪIE
	if (window.ActiveXObject) 
	{
		xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
		xmlDoc.async = false;
		try 
		{
			xmlDoc.load(xmlFile);
		}
		catch (e) 
		{
			alert("Error!In IE path.");
			alert(xmlDoc.parseError.reason);
		}
	}
	else 
	{
		if (document.implementation && document.implementation.createDocument) 
		{
			xmlDoc = document.implementation.createDocument("", "", null);
			try 
			{
				xmlDoc.load(xmlFile);
			}
			catch (e) 
			{
				alert("Error!Not in IE.");
				alert(xmlDoc.parseError.reason);
			}
		}
		else 
		{
			return null;
		}
	}
	if (xmlDoc == null) 
	{
		alert("Error131");
		window.location.href = "";
	}
	return xmlDoc;
}

