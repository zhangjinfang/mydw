package data.web.action;

import javax.servlet.http.*;
import java.io.*;
import org.apache.struts.action.*;
import org.jdom.*;
import data.web.form.*;
import data.web.model.*;
import java.sql.*;
import data.web.model.*;
import java.util.*;

public class AddDataSourceAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// System.out.println("--------------come in!--------------------");
		String schemaName = null;
		String cubeName = null;
		String driverName = null;
		String connectString = null;
		String userName = "";
		String passWord = "";

		// 从Form中把值传过来
		schemaName = ((AddDataSourceForm) form).getSchemaName();
		schemaName = new String(schemaName.getBytes("ISO-8859-1"), "GB18030");
		cubeName = ((AddDataSourceForm) form).getCubeName();
		cubeName = new String(cubeName.getBytes("ISO-8859-1"), "GB18030");
		driverName = ((AddDataSourceForm) form).getDriverName();
		driverName = new String(driverName.getBytes("ISO-8859-1"), "GB18030");
		connectString = ((AddDataSourceForm) form).getConnectString();
		connectString = new String(connectString.getBytes("ISO-8859-1"),
				"GB18030");
		userName = ((AddDataSourceForm) form).getUserName();
		userName = new String(userName.getBytes("ISO-8859-1"), "GB18030");
		passWord = ((AddDataSourceForm) form).getPassWord();
		passWord = new String(passWord.getBytes("ISO-8859-1"), "GB18030");

		// 在这里进行处理
		HttpSession session = request.getSession();

		AddDataSourceBean bean1 = new AddDataSourceBean(driverName,
				connectString, userName, passWord);
//		GetAllTheTableNames bean2 = new GetAllTheTableNames(driverName,
//				connectString, userName, passWord, "true", "false");
		//取得度量值表的列名数组放入会话中,以作为判断选中的事实的列名是否有相同
		String measureTable = (String)session.getAttribute("measureTable");
//		GetAllTheTableNames bean3 = new GetAllTheTableNames(driverName,
//				connectString, userName, passWord, "", measureTable);
//		String measureTable_columns = bean3.getCols();
//		String[] str_column = measureTable_columns.split("&");
		GetTablesBean gtlBean = new GetTablesBean();
		ArrayList<String> str_column = new ArrayList<String>();
		ArrayList<String> tableList=new ArrayList<String>(); 
		try {
			gtlBean.initializeDataConnection(driverName, connectString,
	   		userName, passWord);
			tableList=gtlBean.getTables();
			str_column = gtlBean.getColumns(measureTable);
			gtlBean.close();
		} catch (SQLException e) {
			
		}
		session.setAttribute("measureColumn_array", str_column);

		ActionMessages actionMessages = new ActionMessages();
		if (bean1.connect()) {
			// 将处理后的变量加入session以便其它页面使用
			//HttpSession session = request.getSession();
			session.setAttribute("jndiName", schemaName);
			session.setAttribute("driverName", driverName);
			session.setAttribute("connectString", connectString);
			session.setAttribute("userName", userName);
			session.setAttribute("password", passWord);
			session.setAttribute("responseHtml", tableList);
			// =======================================================
			/*
			 * //生成Schema Element root = new Element("Schema");
			 * 
			 * Attribute rootAttribute = new Attribute("name",jndiName);
			 * root.setAttribute(rootAttribute); //生成DataSource Element child =
			 * new Element("DataSource"); Attribute childProperty = new
			 * Attribute("url",jndiName); child.setAttribute(childProperty);
			 * childProperty = new Attribute("userName",userName);
			 * child.setAttribute(childProperty); childProperty = new
			 * Attribute("password",password);
			 * child.setAttribute(childProperty);
			 * 
			 * root.addContent(child); //生成CUBE Element cube_ = new
			 * Element("Cube"); String cubeName =
			 * session.getAttribute("cubeName").toString();
			 * cube_.setAttribute("name",cubeName); Element cubeTable = new
			 * Element("Table"); cubeTable.setAttribute("name","");
			 * cube_.addContent(cubeTable);
			 * 
			 * root.addContent(cube_);
			 * 
			 * session.setAttribute("xml",root);
			 */
			// ==========================================================
			// 接到正确页面
			actionMessages.add("AddDataSourceSucceed", new ActionMessage(
					"addDataSource.succeed"));
			saveMessages(request, actionMessages);
			return (mapping.findForward("AddDataSourceSucceed"));
		} else {// 接到错误页面
			actionMessages.add("AddDataSourceFaild", new ActionMessage(
					"addDataSource.failed"));
			saveMessages(request, actionMessages);
			return (mapping.findForward("AddDataSourceFailed"));
		}
	}

}
