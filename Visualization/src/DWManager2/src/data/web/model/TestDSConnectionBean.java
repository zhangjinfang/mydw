package data.web.model;

import java.sql.*;

public class TestDSConnectionBean {

	public String driverName = null;
	public String connectString = null;
	public String userName = "";
	public String password = "";

	public TestDSConnectionBean() {
		String driverName = null;
		String connectString = null;
		String userName = "";
		String password = "";
	}

	public TestDSConnectionBean(String driverName, String connectString,
			String userName, String password) {
		this.driverName = driverName;
		this.connectString = connectString;
		this.userName = userName;
		this.password = password;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean connect() {//连接数据源
		Connection connection=null;
		try {
			
			
			Class.forName(driverName);
			
			connection = DriverManager.getConnection(connectString,
					userName, password);
			
			return true;
		} catch (ClassNotFoundException e) {
			
			return false;
		} catch (SQLException e) {
			
			return false;
		}catch(Exception e){
			
			return false;
		}
		finally{
			try {
				if(connection!=null)
					connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
