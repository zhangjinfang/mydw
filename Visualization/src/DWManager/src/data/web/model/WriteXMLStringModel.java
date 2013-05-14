package data.web.model;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;
import org.jdom.*;
import org.jdom.input.*;
import org.jdom.output.*;
import data.web.olapschema.Util;

public class WriteXMLStringModel {

	String configFileURL = "";
	String schemaName = "";
	String filePath = "";
	//SchemaName.xml��Path
	String outputPath = "";
	
	String xmlString = "";
	String fileName = "";
	
	public void setOutPutPath(){
		Util util = new Util();
		this.outputPath = util.getWebRootPath();
	}

	public WriteXMLStringModel(String configFileURL, String schemaName,
			String filepath, String xmlString, String fileName) {
		this.configFileURL = configFileURL;
		this.schemaName = schemaName;
		this.filePath = filepath;
		this.xmlString = xmlString;
		this.fileName = fileName;
	}
	//�Ӵ���·��configFileURL��ȡSchemaConfig�ĸ��ڵ�
	public Element getXMLRootFromDisk() throws JDOMException, IOException {
		SAXBuilder builder = new SAXBuilder();
		Document doc = builder.build(configFileURL);
		Element root = doc.getRootElement();
		return root;
	}
	//�ж�SchemaConfig���Ƿ������Ϊname��Schema,���ڷ���true���򷵻�false
	public boolean isExist(Element root) {
		Element root_ = (Element) root.clone();
		// root_ = root_.getChild("Schemas");
		List list = root_.getChildren();
		String name = "";
		for (int i = 0; i < list.size(); i++) {
			name = ((Element) list.get(i)).getAttributeValue("name");
			if (name.equals(schemaName)) {
				return true;
			}
		}
		return false;
	}
	//���½���Schema��Ϣ��ӵ�SchemaConfig
	public boolean addToConfig(Element root) {
		Element root_ = (Element) root.clone();
		Element schema = new Element("Schema");
		Attribute attribute = new Attribute("name", schemaName);
		schema.setAttribute(attribute);
		attribute = new Attribute("filepath", fileName);
		schema.setAttribute(attribute);
		root_.addContent(schema);
		Document doc = new Document(root_);
		XMLOutputter outPut = new XMLOutputter();
		try {
			FileWriter writer = new FileWriter(filePath);
			outPut.output(doc, writer);
			return true;
		} catch (IOException e) {
			return false;
		}
	}
	//��XMLString��outputPath·��д������
	
	public boolean writeToDisk(String xmlString) {
		setOutPutPath();
		outputPath = outputPath + schemaName + ".xml";
		try {
			BufferedWriter out = new BufferedWriter(new FileWriter(outputPath));
			out.write(xmlString);
			out.close();
			return true;
		} catch (IOException e) {
			return false;
		}
	}
}
