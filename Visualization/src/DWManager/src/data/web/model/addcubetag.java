package data.web.model;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;

import data.web.olapschema.Util;
import dbcon.bean;

public class addcubetag extends TagSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public int doEndTag() throws JspException {

		System.out.println("doEndTag()");
		// TODO Auto-generated method stub
		String tablename;
		JspWriter out = pageContext.getOut();
		HttpServletRequest request = (HttpServletRequest) pageContext
				.getRequest();
		if ((request.getParameter("tablename") != null)
				&& (!request.getParameter("tablename").equals("a"))) {
			System.out.println("doEndTagIf()");
			tablename = request.getParameter("tablename");

			bean testConnBean = new bean();

			SAXBuilder sb = new SAXBuilder();
			Document myDocument = null;
			try {
				myDocument = sb.build(Util.getWebRootPath()+"/DWServer/conf/DWSchemaSchema.xml");
			} catch (JDOMException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			System.out.println(Util.getWebRootPath()+"/DWServer/conf/DWSchemaSchema.xml");
			Element root = myDocument.getRootElement();
			Element MeasureAggregatorList = root
					.getChild("MeasureAggregatorList");
			ArrayList<Element> ma = new ArrayList<Element>(
					MeasureAggregatorList.getChildren("MeasureAggregator"));

			Element FormatStringList = root.getChild("FormatStringList");

			ArrayList<Element> fs = new ArrayList<Element>(
					FormatStringList.getChildren("FormatString"));

			System.out.println("3");

			// get session attribute
			HttpSession session = request.getSession();
			String connDriver = (String) session.getAttribute("connDriver");
			String connString = (String) session.getAttribute("connString");
			String userName = (String) session.getAttribute("userName");
			String passWord = (String) session.getAttribute("passWord");
			try {
				testConnBean.initializeDataConnection(connDriver, connString,
						userName, passWord);
			} catch (Throwable e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			System.out.println("2");
			// /////////////////////////////////////

			//testConnBean.initializeDataConnection("sun.jdbc.odbc.JdbcOdbcDriver","jdbc:odbc:FoodMart 2000","test","test");
			ArrayList<String> columnlist = testConnBean.getColumns(tablename);
			try {
				for (int i = 0; i < columnlist.size(); i++) {
					out
							.println("<tr><td width='25%'><input type='checkbox' name='columnlist' value='"
									+ columnlist.get(i)
   		 							+ "' id='"
									+ i
									+ "' onclick='cando(this)'>"
									+ columnlist.get(i)
									+ "</input></td>"
									+ "<td width='25%'><select name='function' disabled='true' id='function"
									+ i
									+ "'>");

					setDragbox(out, ma, fs,i);

					out
							.println("</select></td><td width='25%'><input type='text' name='measurename' disabled='true' id='measurename"
									+ i + "'></input></td></tr>");
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		return super.doEndTag();
	}
 
	private void setDragbox(JspWriter out, ArrayList<Element> ma,
			ArrayList<Element> fs,int i) throws IOException{

		for (int j = 0; j < ma.size(); j++) {
			String maStr = ma.get(j).getValue();
			out.println("<option value='" + maStr + "'>" + maStr + "</option>");
		}
		System.out.println("4");

		out.println("</select></td><td width='25%'><select name='format' disabled='true' id='format"
						+ i + "'>");
		System.out.println(fs.get(0).getValue());
		for (int j = 0; j < fs.size(); j++) {
			String funName = fs.get(j).getValue();
			out.println("<option value='" + funName + "'>" + funName
					+ "</option>");
		
		}
	}

}
