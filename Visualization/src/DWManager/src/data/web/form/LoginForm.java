package data.web.form;

import javax.servlet.http.*;

import org.apache.struts.action.*;

public final class LoginForm extends ActionForm{
	//��½����ı���
	String userId = null;
	String password = null;
	//�����Ǹ�������get��set����
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId= userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	//���÷���,��������ΪĬ��ֵ
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		this.userId = null;
		this.password = null;
	}
	@Override
	//�߼���֤����,�����������������֤
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {
		ActionErrors errors = new ActionErrors();
		/*
		if((userId == null)||(userId.length() < 1)){
			errors.add("userIdRequired", new ActionMessage("Login.input.userId.required"));
		}
		if((password == null)||(password.length() < 1)){
			errors.add("passwordRequired", new ActionMessage("Login.input.password.required"));
		}
		*/
		return errors;
	}
	
}
