package data.web.olapschema;

import org.jdom.*;
import org.jdom.input.*;

public class CalculatedMember {

    public CalculatedMember(){

    }

    public CalculatedMember(Element calMemElement){
        name=calMemElement.getAttributeValue("name");
        dimension=calMemElement.getAttributeValue("dimension");
        formula=calMemElement.getAttributeValue("formula");
    }

	private String name=null;
	private String dimension=null;
	private String formula=null;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDimension() {
		return dimension;
	}
	public void setDimension(String dimension) {
		this.dimension = dimension;
	}
	public String getFormula() {
		return formula;
	}
	public void setFormula(String formula) {
		this.formula = formula;
	}

	public String toXML(){

		String buf="<CalculatedMember ";
		if(name!=null)
                    buf=buf+"name=\""+name+"\" ";
		if(dimension!=null)
                    buf=buf+"dimension=\""+dimension+"\" ";
		if(formula!=null){
                    formula=formula.replaceAll("\"","&quot;");
                    buf = buf + "formula=\"" + formula + "\" ";
		}
		buf=buf+"/>\n";

		return buf;
	}
}
