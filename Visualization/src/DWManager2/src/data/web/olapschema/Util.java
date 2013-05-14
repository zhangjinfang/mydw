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
	
	//����SchemaConfig.xml�ļ����ҵ�����schemaName��Ӧ��·�������򷵻�null
	public static String getSchemaFilePath(String schemaName)throws JDOMException,IOException{
	 	
		String schemaFilePath=getWebRootPath()+"/DWServer/conf/SchemaConfig.xml";
		
		File schemaFile=new File(schemaFilePath);
		
		SAXBuilder builder = new SAXBuilder();
		Document doc = null;
		try {
			doc = builder.build(schemaFile);
		} catch (JDOMException e) {
			
			e.printStackTrace();
			throw e;
		} catch (IOException e) {

			e.printStackTrace();
			throw e;
		}
		Element root = doc.getRootElement();
		
		ArrayList<Element> schemaElements=new ArrayList<Element>(root.getChildren("Schema"));

		for(int i=0;i<schemaElements.size();i++){
			if(schemaElements.get(i).getAttributeValue("name").equals(schemaName))
				return schemaElements.get(i).getAttributeValue("filepath");
		}
		
		return null;
	}
	
	//schemaName��Ӧ��·����ŵ�SchemaConfig.xml�ļ��У��ɹ�����true�����򷵻�false
	public static boolean setSchemaFilePath(String schemaName,String path) throws JDOMException,IOException{
		
		if(getSchemaFilePath(schemaName)!=null)
			//�ҵ�����������false
			return false;
		
		String schemaFilePath=getWebRootPath()+"/DWServer/conf/SchemaConfig.xml";
		
		File schemaFile=new File(schemaFilePath);
		
		SAXBuilder builder = new SAXBuilder();
		Document doc = null;
		try {
			doc = builder.build(schemaFile);
		} catch (JDOMException e) {
			
			e.printStackTrace();
			throw e;
		} catch (IOException e) {
			
			e.printStackTrace();
			throw e;
		}
		Element root = doc.getRootElement();
		
		Element schemaE=new Element("Schema");
		schemaE.setAttribute("name", schemaName);
		schemaE.setAttribute("filepath", path);
		
		root.addContent(schemaE);
		
		//output
		XMLOutputter outp = new XMLOutputter();
		Format format=Format.getPrettyFormat();
		format.setEncoding("utf-8");
		outp.setFormat(format);
		FileOutputStream fos=null;
		try {
			fos=new FileOutputStream(schemaFile);
			outp.output(doc, fos);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			throw e;
		} catch (IOException e) {
			e.printStackTrace();
			throw e;
		} finally{
			if(fos!=null){
				fos.flush();
				fos.close();
			}
		}

		return true;
	}
	
	/**
	 * ɾ��schemaName��Ӧ��·������ŵ�SchemaConfig.xml�ļ��У��ɹ�����true�����򷵻�false
	 * @param schemaName
	 * @return
	 * @throws JDOMException
	 * @throws IOException
	 */
	public static boolean delSchemaFilePath(String schemaName) throws JDOMException, IOException{
		
		String schemaFilePath=getWebRootPath()+"/DWServer/conf/SchemaConfig.xml";
		
		File schemaFile=new File(schemaFilePath);
		
		SAXBuilder builder = new SAXBuilder();
		Document doc = null;
		try {
			doc = builder.build(schemaFile);
		} catch (JDOMException e) {
			
			e.printStackTrace();
			throw e;
		} catch (IOException e) {
			
			e.printStackTrace();
			throw e;
		}
		Element root = doc.getRootElement();
		
		List<Element> schemasList=root.getChildren();
		
		for(int i=0;i<schemasList.size();i++){

			if(schemasList.get(i).getAttributeValue("name").equals(schemaName)){
				
				root.removeContent(schemasList.get(i));
			}

		}
		
		//output
		XMLOutputter outp = new XMLOutputter();
		Format format=Format.getPrettyFormat();
		format.setEncoding("gb2312");
		outp.setFormat(format);
		FileOutputStream fos=null;
		try {
			fos=new FileOutputStream(schemaFile);
			outp.output(doc, fos);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			throw e;
		} catch (IOException e) {
			e.printStackTrace();
			throw e;
		} finally{
			if(fos!=null){
				fos.flush();
				fos.close();
			}
		}
		
		return true;
	}
	
	/**
	 * ɾ��local-config.xml�ļ���schemaName��Ӧ�Ľڵ㣬��ɾ��schema��ʱ��ʹ��
	 * @param schemaName
	 * @return
	 */
	public static boolean delLocalConfigNode(String schemaName)throws JDOMException,IOException,FileNotFoundException{
		
		String LCFilePath=getWebRootPath()+"/DWServer/conf/local-config.xml";
		
		File LCFile=new File(LCFilePath);
		
		SAXBuilder builder = new SAXBuilder();
		Document doc = null;
		try {
			doc = builder.build(LCFile);
		} catch (JDOMException e) {
			e.printStackTrace();
			throw e;
		} catch (IOException e) {
			
			e.printStackTrace();
			throw e;
		}
		
		Element root = doc.getRootElement();
	
		root.removeChildren(schemaName);

		XMLOutputter outp = new XMLOutputter();
		Format format=Format.getPrettyFormat();
		format.setEncoding("gb2312");
		outp.setFormat(format);
		FileOutputStream fos=null;
		try {
			 fos=new FileOutputStream(LCFile);

			outp.output(doc, fos);
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
			throw e;
		} catch (IOException e) {
			
			e.printStackTrace();
			throw e;
		} finally{
			if(fos!=null){
				fos.flush();
				fos.close();
			}
		}
		
		return true;
	}
	
	
	/**
	 * ɾ��local-config.xml�ļ���schemaName��cubeName��Ӧ�Ľڵ㣬��Ԥ���㲻�ɹ�ʱ��ʹ��
	 * @param schemaName
	 * @param cubeName
	 * @return
	 */
	public static boolean delLocalConfigNode(String schemaName,String cubeName)throws JDOMException,IOException,FileNotFoundException{
		
		String LCFilePath=getWebRootPath()+"/DWServer/conf/local-config.xml";
		
		File LCFile=new File(LCFilePath);
		
		SAXBuilder builder = new SAXBuilder();
		Document doc = null;
		try {
			doc = builder.build(LCFile);
		} catch (JDOMException e) {
			e.printStackTrace();
			throw e;
		} catch (IOException e) {
			
			e.printStackTrace();
			throw e;
		}
		
		Element root = doc.getRootElement();
		Element schemaNode=root.getChild(schemaName);
		//�����ڽڵ㣬�˳�
		if(schemaNode==null)
			return false;
		
		Element cubeNode=schemaNode.getChild(cubeName);
		//�����ڽڵ㣬�˳�
		if(cubeNode==null)
			return false;
		
		schemaNode.removeChildren(cubeName);
		
		XMLOutputter outp = new XMLOutputter();
		Format format=Format.getPrettyFormat();
		format.setEncoding("gb2312");
		outp.setFormat(format);
		FileOutputStream fos=null;
		try {
			 fos=new FileOutputStream(LCFile);

			outp.output(doc, fos);
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
			throw e;
		} catch (IOException e) {
			
			e.printStackTrace();
			throw e;
		} finally{
			if(fos!=null){
				fos.flush();
				fos.close();
			}
		}
		
		return true;
	}
	
	/**
	 * local-config.xml�ļ���schemaName��cubeName��Ӧ�Ľڵ��Changed��ֵ����Ϊchanged�����������ڱ��޸ĵ�ʱ��ʹ��
	 * @param schemaName
	 * @param cubeName
	 * @param changed
	 * @return
	 * @throws JDOMException
	 * @throws IOException
	 * @throws FileNotFoundException
	 */
	public static boolean setLocalConfigChanged(String schemaName,String cubeName,String changed)throws JDOMException,IOException,FileNotFoundException{
		
		String LCFilePath=getWebRootPath()+"/DWServer/conf/local-config.xml";
		
		File LCFile=new File(LCFilePath);
		
		SAXBuilder builder = new SAXBuilder();
		Document doc = null;
		try {
			doc = builder.build(LCFile);
		} catch (JDOMException e) {
			e.printStackTrace();
			throw e;
		} catch (IOException e) {
			
			e.printStackTrace();
			throw e;
		}
		
		Element root = doc.getRootElement();
		Element schemaNode=root.getChild(schemaName);
		//�����ڽڵ㣬�˳�
		if(schemaNode==null)
			return false;
		
		Element cubeNode=schemaNode.getChild(cubeName);
		//�����ڽڵ㣬�˳�
		if(cubeNode==null)
			return false;
		
		cubeNode.removeChildren("Changed");
		Element changeElement=new Element("Changed");
		changeElement.addContent(changed);
		cubeNode.addContent(changeElement);
		
		XMLOutputter outp = new XMLOutputter();
		Format format=Format.getPrettyFormat();
		format.setEncoding("gb2312");
		outp.setFormat(format);
		
		FileOutputStream fos=null;
		try {
			fos=new FileOutputStream(LCFile);

			outp.output(doc, fos);
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
			throw e;
		} catch (IOException e) {
			
			e.printStackTrace();
			throw e;
		} finally{
			if(fos!=null){
				fos.flush();
				fos.close();
			}
		}
		
		return true;
	}
	
	/**
	 * local-config.xml�ļ�����schemaName��cubeName��Ӧ�Ľڵ㣬����schemaName��cubeName��Ӧ�Ľڵ㣬�Ƚ���ɾ��
	 * @param schemaName
	 * @param cubeName
	 * @param alg
	 * @param qryAlg
	 * @return
	 * @throws JDOMException
	 * @throws IOException
	 * @throws FileNotFoundException
	 */
	public static boolean addLocalConfigNode(String schemaName,String cubeName,String alg,String qryAlg)throws JDOMException,IOException,FileNotFoundException{
		
String LCFilePath=getWebRootPath()+"/DWServer/conf/local-config.xml";
		
		File LCFile=new File(LCFilePath);
		
		SAXBuilder builder = new SAXBuilder();
		Document doc = null;
		try {
			doc = builder.build(LCFile);
		} catch (JDOMException e) {
			e.printStackTrace();
			throw e;
		} catch (IOException e) {
			
			e.printStackTrace();
			throw e;
		}
		
		Element root = doc.getRootElement();
		Element schemaNode=root.getChild(schemaName);
		//������schema�ڵ�
		if(schemaNode==null){
			
			schemaNode=new Element(schemaName);
			root.addContent(schemaNode);
		}
		
		Element cubeNode=schemaNode.getChild(cubeName);
		
		//����cube�ڵ㣬ɾ��
		if(cubeNode!=null){
	
			schemaNode.removeChildren(cubeName);
		}
		
		Element newCubeNode=new Element(cubeName);
		
		newCubeNode.addContent(new Element("Alg").addContent(alg));
		newCubeNode.addContent(new Element("QryAlg").addContent(qryAlg));
		newCubeNode.addContent(new Element("Changed").addContent("0"));
		
		schemaNode.addContent(newCubeNode);
		//���
		XMLOutputter outp = new XMLOutputter();
		Format format=Format.getPrettyFormat();
		format.setEncoding("gb2312");
		outp.setFormat(format);
		
		FileOutputStream fos=null;
		try {
			fos=new FileOutputStream(LCFile);
			
			outp.output(doc, fos);
			
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
			throw e;
		} catch (IOException e) {
			
			e.printStackTrace();
			throw e;
		} 
		finally{
			if(fos!=null){
				fos.flush();
				fos.close();
			}
		}
		
		return true;
	}
	
	public static void main(String args[]){
		
		try {
			Util.addLocalConfigNode("FoodMart2000", "Sales", "alg", "qryAlg");
		} catch (FileNotFoundException e1) {
			
			e1.printStackTrace();
		} catch (JDOMException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
//		try {
//			
//			System.out.println(Util.setLocalConfigChanged("FoodMart2000", "Sales","1"));
//		} catch (JDOMException e) {
//			
//			e.printStackTrace();
//		} catch (IOException e) {
//			
//			e.printStackTrace();
//		}
	}
}
