
import com.ice.jni.registry.*;

public class CreateODBC{
	/*public static void main(String[] str){
		CreateODBC s=new CreateODBC();
		String a=new String("hello");
		String b=new String("E:\\mm\\insurance.mdb");
		String c=new String("");
		s.createODBC(a,b,c);

}*/


public int createODBC(String strSourceName,String strSourceDb,String strDescription)
 {
	
 	try{
 		//System.loadLibrary("ICE_JNIRegistry.dll");
        RegistryKey subkeyOdbc=Registry.HKEY_CURRENT_USER.openSubKey("Software")
		.openSubKey("ODBC").openSubKey("ODBC.INI");
		RegistryKey subkey=subkeyOdbc.createSubKey(strSourceName,"");
		subkey.setValue(new RegStringValue(subkey,"DBQ",strSourceDb));
		subkey.setValue(new RegStringValue(subkey,"Driver","C:\\WINDOWS\\system32\\odbcjt32.dll"));
		subkey.setValue(new RegStringValue(subkey,"FIL","MS Access;"));
		subkey.setValue(new RegStringValue(subkey,"UID",""));
		subkey.setValue(new RegDWordValue(subkey,"DriverId",10,25));
		subkey.setValue(new RegDWordValue(subkey,"SafeTransactions",10,0));
		
		
		subkey=subkey.createSubKey("Engines","");
		subkey=subkey.createSubKey("Jet","");
		subkey.setValue(new RegStringValue(subkey,"ImplicitCommitSync","  "));
		subkey.setValue(new RegDWordValue(subkey,"MaxBufferSize",10,2048));
		subkey.setValue(new RegDWordValue(subkey,"PageTimeout",10,5));
		subkey.setValue(new RegDWordValue(subkey,"Threads",10,3));
		subkey.setValue(new RegStringValue(subkey,"UserCommitSync","Yes"));
		subkey.closeKey();
		
		}
catch (NoSuchKeyException e) {
      e.printStackTrace();
    } catch (RegistryException e) {
      e.printStackTrace();
     
		
 }
	return 1;
}
}