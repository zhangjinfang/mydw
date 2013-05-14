

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.yourcompany.struts.form.CreateOdbcForm;
import java.lang.*;


/** 
 * MyEclipse Struts
 * Creation date: 06-20-2008
 * 
 * XDoclet definition:
 * @struts.action path="/createOdbc" name="createOdbcForm" input="createOdbc.jsp" scope="request" validate="true"
 * @struts.action-forward name="failure" path="/createOdbc.jsp"
 * @struts.action-forward name="success" path="/okOdbc.jsp"
 */
public class CreateOdbcAction extends Action {
	/*
	 * Generated Methods
	 */

	/** 
	 * Method execute
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		CreateOdbcForm createOdbcForm = (CreateOdbcForm) form;
		HttpSession session = request.getSession(true);
		String datasource=createOdbcForm.getData_source_name();
		String path=createOdbcForm.getPath();
		String descrip=createOdbcForm.getDesripton();
		CreateODBC CD=new CreateODBC();
		int i=CD.createODBC(datasource,path,descrip);
		if(i!=0)
		
			return mapping.findForward("success");
		
		else
		
		return mapping.findForward("failure");
	}
}