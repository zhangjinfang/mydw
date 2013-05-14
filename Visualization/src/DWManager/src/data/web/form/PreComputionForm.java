package data.web.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

public class PreComputionForm extends ActionForm{	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;	
	private String schemaname=null;
	private String cubename=null;
    private String alg=null;
    private String QryAlg=null;


	public String getSchemaname() {
		return schemaname;
	}



	public void setSchemaname(String schemaname) {
		this.schemaname = schemaname;
	}



	public String getCubename() {
		return cubename;
	}



	public void setCubename(String cubename) {
		this.cubename = cubename;
	}



	public String getAlg() {
		return alg;
	}



	public void setAlg(String alg) {
		this.alg = alg;
	}



	@Override
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {
		// TODO Auto-generated method stub
		return super.validate(mapping, request);
	}



	public String getQryAlg() {
		return QryAlg;
	}



	public void setQryAlg(String qryAlg) {
		QryAlg = qryAlg;
	}
}
