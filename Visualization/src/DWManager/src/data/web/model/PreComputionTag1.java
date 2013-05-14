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

public class PreComputionTag1 extends TagSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String xmlfile;
	private String xmlfilename;
	private String selected = "";
	private String filepath;

	public int doEndTag() throws JspException {
		JspWriter out = pageContext.getOut();
		HttpServletRequest request = (HttpServletRequest) pageContext
				.getRequest();
		if ((request.getParameter("xmlfilename") != null)
				&& (!request.getParameter("xmlfilename").equals("a"))) {
			xmlfilename = request.getParameter("xmlfilename");
			
			
			/////////////////////////////////////////////////
			SAXBuilder sb = new SAXBuilder();
			Document myDocument = null;			
			try {
				System.out.println(Util.getWebRootPath()+"/DWServer/conf/SchemaConfig.xml");			
				myDocument = sb
				.build(Util.getWebRootPath()+"/DWServer/conf/SchemaConfig.xml");
			} catch (JDOMException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			Element root = myDocument.getRootElement();
			
//System.out.println(((Element) root.getChildren("Schema").get(1)).getAttributeValue("name"));
			
			for(int i=0;i<root.getChildren("Schema").size();i++){
				if((((Element) root.getChildren("Schema").get(i))
							.getAttributeValue("name").trim()).equals(xmlfilename.trim())){
					filepath=((Element) root.getChildren("Schema").get(i))
					.getAttributeValue("filepath");
System.out.println("1--------"+filepath+"------------");						
				}
			}
			/////////////////////////////////////////////////
System.out.println("2--------"+filepath+"------------");				
System.out.println("--------hello------------");				
			SAXBuilder sb1 = new SAXBuilder();
			Document myDocument1 = null;
			try {
				System.out.println(Util.getWebRootPath()+filepath);
				myDocument1 = sb1.build(Util.getWebRootPath()+"/"+ filepath);
System.out.println("3--------"+filepath+"------------");				
			} catch (JDOMException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			Element root1 = myDocument1.getRootElement();
			for (int i = 0; i < root1.getChildren("Cube").size(); i++) {
				try {
					xmlfile = ((Element) root1.getChildren("Cube").get(i))
							.getAttributeValue("name");
					if (request.getParameter("schemaname") != null) {
						if ((request.getParameter("schemaname").trim())
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
