package data.web.form;

import javax.servlet.http.*;

import org.apache.struts.action.*;

public class WriteXMLStringForm extends ActionForm{
	
	String xmlString = "";
	String jndiName = "";

	public String getJndiName() {
		return jndiName;
	}

	public void setJndiName(String jndiName) {
		this.jndiName = jndiName;
	}

	public String getXmlString() {
		return xmlString;
	}

	public void setXmlString(String xmlString) {
		this.xmlString = xmlString;
	}

	@Override
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		xmlString = (String)session.getAttribute("xmlString");
		if(xmlString.length() < 1){
			errors.add("xmlStringRequired", new ActionMessage("xmlString.output.required"));
		}
		return errors;
	}
	
}
