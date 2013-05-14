package data.web.action;

import javax.servlet.http.*;
import org.jdom.*;
import org.apache.struts.action.*;

import data.web.form.*; 
import data.web.model.*;

public class CreateCubeAction extends Action{

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		String name = null;
		
		ActionMessages actionMessages = new ActionMessages();
		
		//把变量转换为JAVA在网络中使用的编码"ISO-8859-1"
		name = ((CreateCubeForm)form).getName();
		name = new String(name.getBytes("ISO-8859-1"), "GB18030");
		
		//由得来的用户名生成CreateCubeBean
		CreateCubeBean bean = new CreateCubeBean(name);
		
		/*用session保存JDOM的CUBE根
		Element root = new Element("Cube");
		Attribute rootAttribute = new Attribute("name",name);
		root.setAttribute(rootAttribute);
		HttpSession session = request.getSession();
		session.setAttribute("xml", root);
		*/
		//把cubeName添加到session
		HttpSession session = request.getSession();
		session.setAttribute("cubeName", name);
		
		actionMessages.add("CreateCubeSucceed",new ActionMessage("cube.name.succeed"));
		saveMessages(request,actionMessages);
		return (mapping.findForward("CreateCubeSucceed"));
	}
	
}
