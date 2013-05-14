package data.web.olapschema;

import java.util.*;

import org.jdom.*;
import org.jdom.input.*;


public class Dimension {

    private String dimName = new String();
    private String foreignKey = null;
    private String type=null;

    private ArrayList<Hierarchy> hieList = new ArrayList<Hierarchy>();

    public Dimension() {

    }

    public Dimension(Element dimElement) {

        dimName = dimElement.getAttributeValue("name");
        foreignKey=dimElement.getAttributeValue("foreignKey");
        type=dimElement.getAttributeValue("type");

        ArrayList<Element>
                hierarchyList = new ArrayList<Element>(dimElement.
                getChildren("Hierarchy"));

        for (int i = 0; i < hierarchyList.size(); i++) {
            Hierarchy hie = new Hierarchy(hierarchyList.get(i));
            hieList.add(hie);
        }
    }

    public String getType(){
        return type;
    }

    public void setType(String type){
        this.type=type;
    }

    public String getDimName() {
        return dimName;
    }

    public void setDimName(String dimName) {
        this.dimName = dimName;
    }

    public String getForeignKey() {
        return foreignKey;
    }

    public void setForeignKey(String foreignKey) {
        this.foreignKey = foreignKey;
    }

    public ArrayList<Hierarchy> getHieList() {
        return hieList;
    }

    public void setHieList(ArrayList<Hierarchy> hieList) {
        this.hieList = hieList;
    }

    public String toXML() {
        String buf = "<Dimension name=\"" + dimName + "\" ";

        if (foreignKey != null) {
            buf = buf + "foreignKey=\"" + foreignKey + "\" ";
        }

        if(type!=null)
            buf=buf+"type=\"" + type + "\" ";

        buf = buf + ">\n";

        for (int i = 0; i < hieList.size(); i++) {
            buf = buf + hieList.get(i).toXML();
        }

        buf = buf + "</Dimension>\n";
        return buf;
    }

}
