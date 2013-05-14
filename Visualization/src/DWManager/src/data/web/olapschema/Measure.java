package data.web.olapschema;

import org.jdom.*;
import org.jdom.input.*;

public class Measure {

    public Measure() {

    }

    public Measure(Element measureElement) {
        name = measureElement.getAttributeValue("name");
        colmn = measureElement.getAttributeValue("column");
        function = measureElement.getAttributeValue("aggregator");
        format = measureElement.getAttributeValue("formatString");
    }

    private String colmn = new String();
    private String format = new String();
    private String name = new String();
    private String function = new String();

    public String getColmn() {
        return colmn;
    }

    public void setColmn(String colmn) {
        this.colmn = colmn;
    }

    public String getFormat() {
        return format;
    }

    public void setFormat(String format) {
        this.format = format;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFunction() {
        return function;
    }

    public void setFunction(String function) {
        this.function = function;
    }

    public String toXML() {

        colmn=colmn.replaceAll("\"","&quot;");
        String buf = "<Measure name=\"" + name + "\" column=\"" + colmn +
                     "\" aggregator=\"" + function + "\" ";
        if(format!=null)
        buf = buf + "formatString=\"" +
              format + "\" ";
        buf = buf + "/>\n";

        return buf;
    }

}
