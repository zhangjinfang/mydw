package data.web.form;

import javax.servlet.http.*;

import org.apache.struts.action.*;
import java.io.*;

public final class AddDataSourceForm extends ActionForm {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// ��Щ��������addNewCube.jsp������ֵ
	String schemaName = null;
	String cubeName = null;
	String driverName = null;
	String connectString = null;
	String userName = null;
	String passWord = null;

	// ���������������get��set����

	public String getSchemaName() {
		return schemaName;
	}

	public void setSchemaName(String schemaName) {
		this.schemaName = schemaName;
	}

	public String getCubeName() {
		return cubeName;
	}

	public void setCubeName(String cubeName) {
		this.cubeName = cubeName;
	}

	public String getDriverName() {
		return driverName;
	}

	public void setDriverName(String driverName) {
		this.driverName = driverName;
	}

	public String getConnectString() {
		return connectString;
	}

	public void setConnectString(String connectString) {
		this.connectString = connectString;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	// ��֤�Ƿ�������driver��connectString
	/*@Override
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {
		ActionErrors errors = new ActionErrors();
		if ((driverName == null) || (driverName.length() < 1)) {
			errors.add("userNameRequired", new ActionMessage(
					"addDataSource.driverNameRequired"));
		}
		if ((connectString == null) || (connectString.length() < 1)) {
			errors.add("connectStringRequired", new ActionMessage(
					"addDataSource.connectStringRequired"));
		}
		return errors;
	}*/

}
