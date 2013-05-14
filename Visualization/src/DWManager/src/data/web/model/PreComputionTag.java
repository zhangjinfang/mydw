package data.web.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;
import data.web.olapschema.Util;

public class PreComputionTag extends TagSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String xmlfile;
	private String selected = "";

	public int doEndTag() throws JspException {
		JspWriter out = pageContext.getOut();
		HttpServletRequest request = (HttpServletRequest) pageContext
				.getRequest();
		if ((request.getParameter("xmlname") != null)
				&& (!request.getParameter("xmlname").equals("a"))) {
			SAXBuilder sb = new SAXBuilder();
			Document myDocument = null;
			try {
		System.out.println(Util.getWebRootPath()+"/DWServer/conf/SchemaConfig.xml");
				myDocument = sb.build(Util.getWebRootPath()+"/DWServer/conf/SchemaConfig.xml");
			} catch (JDOMException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			Element root = myDocument.getRootElement();
			for (int i = 0; i < root.getChildren("Schema").size(); i++) {
				try {
					xmlfile = ((Element) root.getChildren("Schema").get(i))
							.getAttributeValue("name");
					if (request.getParameter("xmlfilename") != null) {
						if ((request.getParameter("xmlfilename").trim())
								.equals(xmlfile.trim())) {
							selected = "selected";
						}
					}
					out.println("<option value='" + xmlfile + "'" + selected
							+ ">" + xmlfile + "</option>");
					selected = "";
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return super.doEndTag();
	}
	
}
