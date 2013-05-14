package data.web.form;

import javax.servlet.http.*;

import org.apache.struts.action.*;

public final class LoginForm extends ActionForm{
	//登陆界面的变量
	String userId = null;
	String password = null;
	//下面是各变量的get和set方法
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
	//重置方法,把属性设为默认值
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		this.userId = null;
		this.password = null;
	}
	@Override
	//逻辑验证方法,对姓名和密码进行验证
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
