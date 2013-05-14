package dbcon;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import java.sql.Statement;


public class bean {
	private Connection conn;
	private Statement stmt;
	private ResultSet results;
	private ResultSet results1;
	private String[] types={"TABLE"};
	//types[0]="TABLE";


	public boolean initializeDataConnection(String driverName, String location, String userName, String password) throws Exception {
		try {
			System.out.println("driver success");	        
	        Properties info = new Properties();
	        info.put("user", userName); //$NON-NLS-1$
	        info.put("password", password); //$NON-NLS-1$
	        Class.forName(driverName).newInstance(); 
	        conn = DriverManager.getConnection(location,info);
	        System.out.println("connection success");
            return true;
	    }catch (Exception t) {
	    	System.out.println("strong error");            
	    	t.printStackTrace();
	    	throw t;
	     }
    }
	public ArrayList<String> getTables(){
		ArrayList<String> tablelist = new ArrayList<String>();
		try {
			stmt = conn.createStatement();
			//results =stmt.executeQuery("SELECT   name   FROM   MSysObjects   WHERE   Flags=0   AND   Type=1");	
			//results =stmt.executeQuery("select name from sysobjects where xtype='u';");
			DatabaseMetaData dbmd = conn.getMetaData(); 
  	    	results=dbmd.getTables(null, null, null, types); 
			while(results.next()){
		        tablelist.add(results.getString("table_name"));
		        System.out.println(tablelist.get(tablelist.size()-1));		        
		    }
			return tablelist;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	public ArrayList<String> getColumns(String table){
		ArrayList<String> columnlist = new ArrayList<String>();		
  	    try {
  	    	//OleDbSchemaGuid.Columns,new Object[]{null,null,table,null}
  	    	//results1 =stmt.executeQuery("select name from syscolumns where id=object_id('"+table+"')");  	 
  	    	//results1=conn.GetOleDbSchemaTable();		
  	    	//results1 =stmt.executeQuery("select name from syscolumns where id=(select id from sysobjects where xtype='u' and name='"+table+"')");
  	    	DatabaseMetaData dbmd = conn.getMetaData(); 
  	    	results1=dbmd.getColumns(null, null, table, "%");  	    	
  	    	while(results1.next()){
	  	    	columnlist.add(results1.getString("column_name"));	  	    	
	  	    	//System.out.println(columnlist.get(columnlist.size()-1));
	  	    }
	  	    return columnlist;  
  	    } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
  	     
	}
	public ArrayList<String> alltitle(){
		ArrayList<String> titlelist=new ArrayList<String>();
		try {
			stmt=conn.createStatement();
			String query;
			query="select title from notice";
			results=stmt.executeQuery(query);
			while(results.next()){
				titlelist.add(results.getString(1));
			}
		} catch (SQLException e) {
			System.out.println("alltitle happen errors!");
			e.printStackTrace();
		}		
		return titlelist;
	}
	public ArrayList<String> allcontent(){
		ArrayList<String> contentlist=new ArrayList<String>();
		try {
			stmt=conn.createStatement();
			String query;
			query="select content from notice";
			results=stmt.executeQuery(query);
			while(results.next()){
				contentlist.add(results.getString(1));
			}
		} catch (SQLException e) {
			System.out.println("allcontent happen errors!");
			e.printStackTrace();
		}		
		return contentlist;
	}
	public boolean DConn() throws Throwable{
		boolean b;
		b=initializeDataConnection("sun.jdbc.odbc.JdbcOdbcDriver","jdbc:odbc:myfirstproject","","");
	    return b;
	}
}
