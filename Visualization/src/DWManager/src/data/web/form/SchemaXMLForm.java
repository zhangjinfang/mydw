package data.web.form;

import org.apache.struts.action.*;
import javax.servlet.http.*;

public final class SchemaXMLForm extends ActionForm {
	
	String jndiName = "";
	String userName = "";
	String password = "";
	String dimentionName = "";
	String foreinKey = "";
	String hierarchyName = "";
	String hasAll = "";
	String primaryKey = "";
	
	public String getJndiName() {
		return jndiName;
	}
	public void setJndiName(String jndiName) {
		this.jndiName = jndiName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getDimentionName() {
		return dimentionName;
	}
	public void setDimentionName(String dimentionName) {
		this.dimentionName = dimentionName;
	}
	public String getForeinKey() {
		return foreinKey;
	}
	public void setForeinKey(String foreinKey) {
		this.foreinKey = foreinKey;
	}
	public String getHierarchyName() {
		return hierarchyName;
	}
	public void setHierarchyName(String hierarchyName) {
		this.hierarchyName = hierarchyName;
	}
	public String getHasAll() {
		return hasAll;
	}
	public void setHasAll(String hasAll) {
		this.hasAll = hasAll;
	}
	public String getPrimaryKey() {
		return primaryKey;
	}
	public void setPrimaryKey(String primaryKey) {
		this.primaryKey = primaryKey;
	}
}
