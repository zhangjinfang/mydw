package dbcon;
import java.sql.SQLException;
public class test1 {
	public static void main(String arg[]) throws SQLException{   	
		bean test=new bean();
		//access
		System.out.println("-------access---------");
    	try {
			test.initializeDataConnection("sun.jdbc.odbc.JdbcOdbcDriver","jdbc:odbc:FoodMart 2000","","");
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}   	    	
        System.out.println();
        System.out.println("-------table name---------");
        test.getTables();    	
        System.out.println();
        System.out.println("-------column name---------");
        test.getColumns("store");
    	//sql server 2000
        System.out.println();
    	//System.out.println("-------sql server 2000---------");
    	//test.initializeDataConnection("sun.jdbc.odbc.JdbcOdbcDriver","jdbc:odbc:test","","");   	    	
        //System.out.println();
        //System.out.println("-------table name---------");
        //test.getTables();    	
        //System.out.println();
        //System.out.println("-------column name---------");
        //test.getColumns("aaa");
    	//mysql
        //System.out.println();
        //System.out.println("-------mysql---------");
    	//test.initializeDataConnection("sun.jdbc.odbc.JdbcOdbcDriver","jdbc:odbc:mysql","","");   	    	
        //System.out.println();
        //System.out.println("-------table name---------");
        //test.getTables();
    	//System.out.println();
    	//System.out.println("-------column name---------");
    	//test.getColumns("user");    	

    	//test.DConn();
    	//test.alltitle();
		//test.allcontent();
		
    }

}
