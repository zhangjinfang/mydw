package data.web.olapschema;

import org.jdom.*;
import org.jdom.input.*;

public class DimensionUsage {

    private String name = new String();
    private String source = new String();
    private String foreignKey = null;

    public DimensionUsage() {

    }

    public DimensionUsage(Element duElement) {
        name = duElement.getAttributeValue("name");
        source = duElement.getAttributeValue("source");
        foreignKey = duElement.getAttributeValue("foreignKey");
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getForeignKey() {
        return foreignKey;
    }

    public void setForeignKey(String foreignKey) {
        this.foreignKey = foreignKey;
    }

    public String toXML() {
        String buf = "<DimensionUsage name=\"" + name + "\" source=\"" + source +
                     "\" ";

        if (foreignKey != null) {
            buf = buf + "foreignKey=\"" + foreignKey + "\" ";
        }
        buf = buf + "/>\n";

        return buf;
    }
}
