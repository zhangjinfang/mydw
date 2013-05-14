package data.web.model;

import java.sql.*;

public class LoginBean {
	
	String userId;
	String password;
	String driverName = "com.microsoft.jdbc.sqlserver.SQLServerDriver";
	String connName = "jdbc:microsoft:sqlserver://localhost:1433;databaseName=javaweb";
	String databaseUserName = "sa";
	String databasePwd = "sa";
	String temp = null;
	
	public LoginBean(String userId, String password){
		this.userId = userId;
		this.password = password;
	}
	//用于从数据库取出存在的用户名的密码来与输入的密码比较
	public boolean fromDatabaseCompare(){
		try {
			Class.forName(driverName);
			try{
				Connection conn = DriverManager.getConnection(connName,databaseUserName, databasePwd);
			
				PreparedStatement ps = conn.prepareStatement("select userPwd from userTable where userId=?");
				int intUserId = Integer.parseInt(userId);
				ps.setInt(1, intUserId);
				ResultSet rs = ps.executeQuery();
				while(rs.next()){
					temp = rs.getString("userPwd");
				}
			}catch(SQLException sqle){
				System.out.println("sql出错");
				sqle.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		if(temp.equals(password))
			return true;
		else
			return false;
	}
	public static void main(String[]args){
		LoginBean bean = new LoginBean("1", "0001");
		boolean bl = bean.fromDatabaseCompare();
		System.out.println(bl);
	}
}
