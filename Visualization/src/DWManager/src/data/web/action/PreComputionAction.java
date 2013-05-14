package data.web.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import data.web.form.PreComputionForm;


import data.web.model.PreComputation; 

public class PreComputionAction extends Action{

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception{
		PreComputionForm yujisuanform = (PreComputionForm) form;
System.out.println("-------------Precompution Begin!-----------------");
		String schemaname = yujisuanform.getSchemaname();
		String cubename = yujisuanform.getCubename();
//		String algorithm = yujisuanform.getAlg();
		String result;
		
		//LLH 2007-11-23 00:32
		PreComputation precom=new PreComputation(schemaname, cubename,"toAdd","toAdd");
		result=precom.getResult();
		HttpSession session=request.getSession(true);
		session.setAttribute("result", result);
		//PageForward="ToSuccessPage";
		// TODO Auto-generated method stub
		return (mapping.findForward("ToSuccessPage"));
	}
	

}
