package data.web.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import java.sql.Statement;
import java.sql.DatabaseMetaData;

public class GetTablesBean {

	private Connection conn;

	private Statement stmt;

	public GetTablesBean(){
		
	}
	
	/*
	 * 初始化数据库连接连接
	 */
	public boolean initializeDataConnection(String driverName, String location,
			String userName, String password) throws ClassNotFoundException,
			SQLException {

		Properties info = new Properties();
		info.put("user", userName); //$NON-NLS-1$
		info.put("password", password); //$NON-NLS-1$
		try {
			Class.forName(driverName).newInstance();
			conn = DriverManager.getConnection(location, info);
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
		return true;
	}

	public ArrayList<String> getTables() throws SQLException {
		ArrayList<String> tablelist = new ArrayList<String>();

		stmt = conn.createStatement();

		DatabaseMetaData dbmd = conn.getMetaData();
		String[] types = { "TABLE" };
		ResultSet results = dbmd.getTables(null, null, null, types);
		while (results.next()) {

			tablelist.add(results.getString("table_name"));

		}
		results.close();
		return tablelist;
	}

	public ArrayList<String> getColumns(String table) throws SQLException {
		ArrayList<String> columnlist = new ArrayList<String>();
		DatabaseMetaData dbmd = conn.getMetaData();
		ResultSet results = dbmd.getColumns(null, null, table, "%");

		while (results.next()) {
			columnlist.add(results.getString("column_name"));

		}
		results.close();

		return columnlist;
	}

	public void close() throws SQLException {
		if (conn != null) {
			if (stmt != null) {
				stmt.close();
				stmt = null;
			}
			if (conn != null) {
				conn.close();
				conn = null;
			}
		}
	}
}