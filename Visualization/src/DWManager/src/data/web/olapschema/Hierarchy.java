package data.web.olapschema;

import java.util.*;
import org.jdom.*;
import org.jdom.input.*;


public class Hierarchy {

    public Hierarchy() {

    }

    public Hierarchy(Element hieElement) {
        hieName = hieElement.getAttributeValue("name");

        String ha = hieElement.getAttributeValue("hasAll");

        if (ha.equals("true") || ha.equals("false")) {
            hasAll = new Boolean(ha);
        }

        primaryKey = hieElement.getAttributeValue("primaryKey");

        allMemberName = hieElement.getAttributeValue("allMemberName");

        Element tableElement = hieElement.getChild("Table");
        tableName = tableElement.getAttributeValue("name");

        ArrayList<Element>
                leveltList = new ArrayList<Element>(hieElement.
                getChildren("Level"));
        for (int i = 0; i < leveltList.size(); i++) {
            Level level = new Level(leveltList.get(i));
            levelList.add(level);
        }
    }

    private String hieName = new String();

    private Boolean hasAll = false;

    private String allMemberName = null;

    private String primaryKey = null;

    private String tableName = new String();

    private ArrayList<Level> levelList = new ArrayList<Level>();

    public String getHieName() {
        return hieName;
    }

    public void setHieName(String hieName) {
        this.hieName = hieName;
    }

    public Boolean isHasAll() {
        return hasAll;
    }

    public void setHasAll(Boolean hasAll) {
        this.hasAll = hasAll;
    }

    public String getAllMemberName() {
        return allMemberName;
    }

    public void setAllMemberName(String allMemberName) {
        this.allMemberName = allMemberName;
    }

    public String getPrimaryKey() {
        return primaryKey;
    }

    public void setPrimaryKey(String primaryKey) {
        this.primaryKey = primaryKey;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public ArrayList<Level> getLevelList() {
        return levelList;
    }

    public void setLevelList(ArrayList<Level> levelList) {
        this.levelList = levelList;
    }

    public String toXML() {
        String buf = "<Hierarchy name=\"" + hieName + "\" hasAll=\"" + hasAll
                     + "\" ";

        if (primaryKey != null) {
                   buf = buf + "primaryKey=\"" + primaryKey + "\" ";
        }

        if (allMemberName != null&&allMemberName!=""&&hasAll.equals(new Boolean("true"))) {
            buf = buf + "allMemberName=\"" + allMemberName + "\" ";
        }

        buf = buf + ">\n";

        buf = buf + "<Table name=\"" + tableName + "\" />\n";

        for (int i = 0; i < levelList.size(); i++) {
            buf = buf + levelList.get(i).toXML();
        }

        buf = buf + "</Hierarchy>\n";
        return buf;
    }

}
