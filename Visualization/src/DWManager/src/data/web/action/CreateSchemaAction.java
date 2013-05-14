package data.web.action;

import java.util.Hashtable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import data.web.form.CreateSchemaForm;
import data.web.olapschema.*;


public class CreateSchemaAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		CreateSchemaForm createschema = (CreateSchemaForm)form;
		String schemaname = createschema.getSchemaname();
		String dataSourceUrl = createschema.getDatasourcename();
		String userName = createschema.getUsername();
		String passWord = createschema.getPassword();
		String driver=createschema.getDriver();
		String connectionstring = createschema.getConnectionstring();

		Schema schema = new Schema();
		schema.setDataSourceUrl(dataSourceUrl);
		schema.setUserName(userName);
		schema.setPassWord(passWord);
		schema.setConnDriver(driver);
		schema.setSchemaName(schemaname);
		schema.setConnString(connectionstring);
		System.out.println(schema.toXML());
		
		Util.setSchemaFilePath(schemaname, "DWServer/metadata/"+schemaname+".xml");
		// 保存到xml文件
		String xfpath = Util.getWebRootPath()+"/"+Util.getSchemaFilePath(schemaname);
		schema.outToFile(xfpath);
//		schema.outToFile("D:/aaa.xml");
//		System.out.println("aaa");
		return (mapping.findForward("CreateSchemaSucceed"));
	}

}
