package data.web.olapschema;

import java.io.File;
import java.io.IOException;
import java.util.*;
import java.io.*;

import org.jdom.Document;
import org.jdom.*;
import org.jdom.input.*;

public class Schema {

	private LinkedHashMap<String, Dimension> dimTable = new LinkedHashMap<String, Dimension>();

	private LinkedHashMap<String, Cube> cubeTable = new LinkedHashMap<String, Cube>();

	private String DataSourceUrl = new String();

	private String userName = new String();

	private String passWord = new String();

	private String schemaName = new String();

	private String connString = new String();
	
	private String connDriver=new String();

	public Schema() {

	}

	public Schema(File schemaFile) {
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

		schemaName = root.getAttributeValue("name");

		// 构造DataSource
		Element dsElement = root.getChild("DataSource");
		DataSourceUrl = dsElement.getAttributeValue("url");
		userName = dsElement.getAttributeValue("userName");
		passWord = dsElement.getAttributeValue("passWord");
		connString = dsElement.getAttributeValue("connString");
		connDriver = dsElement.getAttributeValue("connDriver");
		
		// 构造Dimension
		ArrayList<Element> dimList = new ArrayList<Element>(root
				.getChildren("Dimension"));
		for (int i = 0; i < dimList.size(); i++) {
			Dimension dim = new Dimension(dimList.get(i));
				dimTable.put(dim.getDimName(), dim);
		}

		// 构造Cube
		ArrayList<Element> cubeList = new ArrayList<Element>(root
				.getChildren("Cube"));
		for (int i = 0; i < cubeList.size(); i++) {
			Cube cube = new Cube(cubeList.get(i));
				cubeTable.put(cube.getCubeName(), cube);
		}
	}

	public LinkedHashMap<String, Dimension> getDimTable() {
		return dimTable;
	}

	public void setDimTable(LinkedHashMap<String, Dimension> dimTable) {
		this.dimTable = dimTable;
	}

	public LinkedHashMap<String, Cube> getCubeTable() {
		return cubeTable;
	}

	public void setCubeTable(LinkedHashMap<String, Cube> cubeTable) {
		this.cubeTable = cubeTable;
	}

	public String getDataSourceUrl() {
		return DataSourceUrl;
	}

	public void setDataSourceUrl(String dataSourceUrl) {
		DataSourceUrl = dataSourceUrl;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public String getSchemaName() {
		return schemaName;
	}

	public void setSchemaName(String schemaName) {
		this.schemaName = schemaName;
	}

	public String getConnString() {
		return connString;
	}

	public void setConnString(String connString) {
		this.connString = connString;
	}

	public String toXML() {
		String buf = "<?xml version=\"1.0\" encoding=\"gb2312\" ?>\n";
		buf = buf + "<Schema name=\"" + schemaName + "\">\n";
		buf = buf + "<DataSource url=\"" + DataSourceUrl + "\" userName=\""
				+ userName + "\" passWord=\"" + passWord + "\" connString=\""
				+ connString + "\" connDriver=\""+connDriver+"\" />\n";

		ArrayList<Dimension> dimList = new ArrayList<Dimension>(dimTable
				.values());
		for (int i = 0; i < dimList.size(); i++) {
			if(dimList.get(i)!=null)
			buf = buf + dimList.get(i).toXML();
		}

		ArrayList<Cube> cubeList = new ArrayList<Cube>(cubeTable.values());
		for (int i = 0; i < cubeList.size(); i++) {
			if(cubeList.get(i)!=null)
			buf = buf + cubeList.get(i).toXML();
		}

		buf = buf + "</Schema>\n";

		return buf;

	}

        public void outToFile(String path){
            File outFile=new File(path);
                try {
                    FileOutputStream fos = new FileOutputStream(outFile);
                    fos.write(toXML().getBytes());
                } catch (FileNotFoundException ex) {
                    ex.printStackTrace();
                } catch (IOException ex) {
                    ex.printStackTrace();
                }

        }

	public static void main(String args[]) {

		File file = new File("C:/aaa.xml");

		Schema s = new Schema(file);

		System.out.println(s.toXML());

                s.outToFile("C:/bbb.xml");

	}

	public String getConnDriver() {
		return connDriver;
	}

	public void setConnDriver(String connDriver) {
		this.connDriver = connDriver;
	}

}
