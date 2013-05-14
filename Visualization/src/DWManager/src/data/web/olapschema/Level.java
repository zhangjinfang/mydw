package data.web.olapschema;

import java.util.*;
import org.jdom.*;
import org.jdom.input.*;

public class Level {
	private String name = new String();
	private String column = new String();
	private Boolean uniqueMembers=false;

        private ArrayList<Property> propList=new ArrayList<Property>();

        public Level(){

        }

        public Level(Element levelElement){

            name=levelElement.getAttributeValue("name");

            column=levelElement.getAttributeValue("column");

            String ums=levelElement.getAttributeValue("uniqueMembers");

            if(ums.equals("true")||ums.equals("false"))
                uniqueMembers=new Boolean(ums);

            ArrayList<Element> proptList = new ArrayList<Element>(levelElement.getChildren("Property"));

            for(int i=0;i<proptList.size();i++){
                Property prop=new Property(proptList.get(i));
                propList.add(prop);
            }
        }

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getColumn() {
		return column;
	}

	public void setColumn(String column) {
		this.column = column;
	}

	public Boolean isUniqueMembers() {
		return uniqueMembers;
	}

	public void setUniqueMembers(Boolean uniqueMembers) {
		this.uniqueMembers = uniqueMembers;
	}

	public ArrayList<Property> getPropList() {
		return propList;
	}

	public void setPropList(ArrayList<Property> propList) {
		this.propList = propList;
	}

	public String toXML(){
		String buf="<Level name=\""+name+"\" column=\""+column+"\" uniqueMembers=\""+uniqueMembers+"\">\n";

		for(int i=0;i<propList.size();i++){
			buf=buf+propList.get(i).toXML();
		}
		buf=buf+"</Level>\n";

		return buf;
	}

	public static void main(String args[]){
		Level level=new Level();
		level.setName("name");
		level.setColumn("column");
		level.setUniqueMembers(false);

		Property prop=new Property();
		prop.setName("pname");
		prop.setColumn("pvalue");
		ArrayList<Property> propList=new ArrayList<Property>();
		propList.add(prop);

		level.setPropList(propList);

		System.out.println(level.toXML());
	}
}
