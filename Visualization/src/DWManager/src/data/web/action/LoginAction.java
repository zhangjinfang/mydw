package data.web.action;

import javax.servlet.http.*;

import data.web.form.*;
import data.web.model.*;
import data.web.olapschema.Util;

import org.apache.struts.action.*;


public final class LoginAction extends Action{

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		
		String userId = null;
		String password;
		
		ActionMessages actionMessages = new ActionMessages();
		
		//�ѱ���ת��ΪJAVA��������ʹ�õı���"ISO-8859-1"
		userId = ((LoginForm)form).getUserId();
		userId = new String(userId.getBytes("ISO-8859-1"), "GB18030");
		password = ((LoginForm)form).getPassword();
		password = new String(password.getBytes("ISO-8859-1"), "GB18030");
		 
		
			//�ɵ������û�������������LoginBean
		/*
		LoginBean bean = new LoginBean(userId, password);
		if(bean.fromDatabaseCompare()){
			actionMessages.add("LoginSucceed", new ActionMessage("Login.succeed"));
			saveMessages(request, actionMessages);
			return (mapping.findForward("LoginSucceed"));
		}else{
			actionMessages.add("LoginFaild", new ActionMessage("Login.faild"));
			saveMessages(request, actionMessages);
			return (mapping.findForward("LoginFaild"));
		}
		*/
		return (mapping.findForward("LoginSucceed")); 
	}
	
}
