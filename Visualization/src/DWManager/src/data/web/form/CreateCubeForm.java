package data.web.form;

import javax.servlet.http.*;

import org.apache.struts.action.*;

public final class CreateCubeForm extends ActionForm {
	
	

	String name = null;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	@Override
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {
		ActionErrors errors = new ActionErrors();
		if((name == null) || (name.length()<1)){
			errors.add("cubeNameRequired",new ActionMessage("cube.name.required"));
		}
		return errors;
	}
}
