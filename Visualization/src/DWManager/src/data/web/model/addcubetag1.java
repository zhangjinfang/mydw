package data.web.model;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import dbcon.bean;

public class addcubetag1 extends TagSupport {
 
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String tablename;

	public int doEndTag() throws JspException {

		// TODO Auto-generated method stub

		JspWriter out = pageContext.getOut();
		HttpServletRequest request = (HttpServletRequest) pageContext
				.getRequest();
		System.out.println("sdfasdf");
		if ((request.getParameter("tablename") != null)
				&& (!request.getParameter("tablename").equals("a"))) {

			System.out.println("sdfasdfsadfasdfasdf");
			tablename = request.getParameter("tablename");
			bean test = new bean();
			
			///////////////////////////////////////
			HttpSession session = request.getSession();
			String connDriver=(String)session.getAttribute("connDriver");
			String connString=(String)session.getAttribute("connString");
			String userName=(String)session.getAttribute("userName");
			String passWord=(String)session.getAttribute("passWord");
            System.out.println(connDriver+connString+userName+passWord);
			try {
				test.initializeDataConnection(connDriver,connString,userName,passWord);
			} catch (Throwable e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			///////////////////////////////////////
  			
			//test.initializeDataConnection("sun.jdbc.odbc.JdbcOdbcDriver",
			//		"jdbc:odbc:FoodMart 2000", "test", "test");
			ArrayList<String> tablelist = test.getTables();
			
			System.out.println("rrrrrrrrrrrrrrrrrrr");
			for(int z=0;z<tablelist.size();z++){
				
				System.out.println("table:"+tablelist.get(z));
			}
			
			String selected = "";
			for (int i = 0; i < tablelist.size(); i++) {

				if (tablename.equals(tablelist.get(i))) {
					selected = "selected";
				}

				try {
					out.println("<option value='" + tablelist.get(i) + "'"
							+ selected + ">" + tablelist.get(i) + "</option>");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				selected = "";
			}
		}

		return super.doEndTag();
	}

}