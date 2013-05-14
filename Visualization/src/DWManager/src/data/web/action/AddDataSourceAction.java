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

		// ��Form�а�ֵ������
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

		// ��������д���
		HttpSession session = request.getSession();

		AddDataSourceBean bean1 = new AddDataSourceBean(driverName,
				connectString, userName, passWord);
//		GetAllTheTableNames bean2 = new GetAllTheTableNames(driverName,
//				connectString, userName, passWord, "true", "false");
		//ȡ�ö���ֵ��������������Ự��,����Ϊ�ж�ѡ�е���ʵ�������Ƿ�����ͬ
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
			// �������ı�������session�Ա�����ҳ��ʹ��
			//HttpSession session = request.getSession();
			session.setAttribute("jndiName", schemaName);
			session.setAttribute("driverName", driverName);
			session.setAttribute("connectString", connectString);
			session.setAttribute("userName", userName);
			session.setAttribute("password", passWord);
			session.setAttribute("responseHtml", tableList);
			// =======================================================
			/*
			 * //����Schema Element root = new Element("Schema");
			 * 
			 * Attribute rootAttribute = new Attribute("name",jndiName);
			 * root.setAttribute(rootAttribute); //����DataSource Element child =
			 * new Element("DataSource"); Attribute childProperty = new
			 * Attribute("url",jndiName); child.setAttribute(childProperty);
			 * childProperty = new Attribute("userName",userName);
			 * child.setAttribute(childProperty); childProperty = new
			 * Attribute("password",password);
			 * child.setAttribute(childProperty);
			 * 
			 * root.addContent(child); //����CUBE Element cube_ = new
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
			// �ӵ���ȷҳ��
			actionMessages.add("AddDataSourceSucceed", new ActionMessage(
					"addDataSource.succeed"));
			saveMessages(request, actionMessages);
			return (mapping.findForward("AddDataSourceSucceed"));
		} else {// �ӵ�����ҳ��
			actionMessages.add("AddDataSourceFaild", new ActionMessage(
					"addDataSource.failed"));
			saveMessages(request, actionMessages);
			return (mapping.findForward("AddDataSourceFailed"));
		}
	}

}
