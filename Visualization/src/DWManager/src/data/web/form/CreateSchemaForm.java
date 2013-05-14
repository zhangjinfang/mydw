package data.web.form;

import org.apache.struts.action.ActionForm;

public class CreateSchemaForm extends ActionForm {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String schemaname=null;
	private String driver=null;
	private String datasourcename=null;
	private String username=null;
	private String password=null;
	private String connectionstring=null;
	
	public String getSchemaname() {
		return schemaname;
	}
	public void setSchemaname(String schemaname) {
		this.schemaname = schemaname;
	}
	public String getDriver() {
		return driver;
	}
	public void setDriver(String driver) {
		this.driver = driver;
	}
	public String getDatasourcename() {
		return datasourcename;
	}
	public void setDatasourcename(String datasourcename) {
		this.datasourcename = datasourcename;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConnectionstring() {
		return connectionstring;
	}
	public void setConnectionstring(String connectionstring) {
		this.connectionstring = connectionstring;
	}
	
	
	
}
