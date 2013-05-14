package data.web.olapschema;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.*;
import java.io.*;

import org.jdom.*;
import org.jdom.input.*;
import org.jdom.output.*;


public class Util {
	
	public static String getWebInfPath(){
		String path=new Util().getClass().getResource("/").getPath();
		
		File file=new File(path);
		
		String parent=file.getParent();
	
		parent=parent.replaceAll("%20", " ");
		return parent;
	}
	
	public static String getWebRootPath(){
		
		File file=new File(getWebInfPath());
		
		String parent=file.getParent();
		
		parent=parent.replaceAll("%20", " ");
		
		return parent;
		
	}
	
	//找到返回schemaName对应的路径，否则返回null
	public static String getSchemaFilePath(String schemaName){
	 	
		String schemaFilePath=getWebRootPath()+"/DWServer/conf/SchemaConfig.xml";
		
		File schemaFile=new File(schemaFilePath);
		
		SAXBuilder builder = new SAXBuilder();
		Document doc = null;
		try {
			doc = builder.build(schemaFile);
		} catch (JDOMException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Element root = doc.getRootElement();
		
		ArrayList<Element> schemaElements=new ArrayList<Element>(root.getChildren("Schema"));

		for(int i=0;i<schemaElements.size();i++){
			if(schemaElements.get(i).getAttributeValue("name").equals(schemaName))
				return schemaElements.get(i).getAttributeValue("filepath");
		}
		
		return null;
	}
	
	//成功返回true，否则返回false
	public static boolean setSchemaFilePath(String schemaName,String path){
		
		if(getSchemaFilePath(schemaName)!=null)
			//找到重名，返回false
			return false;
		
		String schemaFilePath=getWebRootPath()+"/DWServer/conf/SchemaConfig.xml";
		
		File schemaFile=new File(schemaFilePath);
		
		SAXBuilder builder = new SAXBuilder();
		Document doc = null;
		try {
			doc = builder.build(schemaFile);
		} catch (JDOMException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Element root = doc.getRootElement();
		
		Element schemaE=new Element("Schema");
		schemaE.setAttribute("name", schemaName);
		schemaE.setAttribute("filepath", path);
		
		root.addContent(schemaE);
		
		//output
		XMLOutputter outp = new XMLOutputter();

		try {
			outp.output(doc, new FileOutputStream(schemaFile));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 

		return true;
	}
	
	public static void main(String args[]){
		
		System.out.println(getWebInfPath());
		
		System.out.println(getSchemaFilePath("FoodMart 2000"));
	}
}
