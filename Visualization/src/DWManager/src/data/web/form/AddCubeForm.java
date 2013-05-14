package data.web.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

public class AddCubeForm extends ActionForm {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String cubename=null;
	private String factortable=null;
	private String[] columnlist={};
	private String[] function={};
	private String[] format={};
	private String[] measurename={};
	
	
	public String getCubename() {
		return cubename;
	}
	public void setCubename(String cubename) {
		this.cubename = cubename;
	}
	public String getFactortable() {
		return factortable;
	}
	public void setFactortable(String factortable) {
		this.factortable = factortable;
	}
	public String[] getColumnlist() {
		return columnlist;
	}
	public void setColumnlist(String[] columnlist) {
		this.columnlist = columnlist;
	}
	public String[] getFunction() {
		return function;
	}
	public void setFunction(String[] function) {
		this.function = function;
	}
	public String[] getFormat() {
		return format;
	}
	public void setFormat(String[] format) {
		this.format = format;
	}
	public String[] getMeasurename() {
		return measurename;
	}
	public void setMeasurename(String[] measurename) {
		this.measurename = measurename;
	}

}
