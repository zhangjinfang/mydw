package data.web.olapschema;

import java.util.*;
import org.jdom.*;
import org.jdom.input.*;

public class Property {

    public Property() {

    }

    public Property(Element PropElement) {
        name = PropElement.getAttributeValue("name");
        column = PropElement.getAttributeValue("column");
        type=PropElement.getAttributeValue("type");
    }

    private String name = new String();
    private String column = null;
    private String type = null;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
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

    public String toXML() {

        String buf = "<Property name=\"" + name + "\" ";
        if (column != null) {
            buf = buf + "column=\"" + column + "\" ";
        }
        if (type != null) {
            buf = buf + "type=\"" + type + "\" ";
        }

        buf = buf + "/>\n";
        return buf;
    }
}
