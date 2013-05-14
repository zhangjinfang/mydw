package data.web.action;

import java.io.File;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import data.web.olapschema.Cube;
import data.web.olapschema.Measure;
import data.web.olapschema.Schema;
import data.web.olapschema.Util;

import data.web.form.AddCubeForm;

public class AddCubeAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ActionMessages errors = new ActionMessages();
		AddCubeForm addcubeform = (AddCubeForm) form;
		String cubename = addcubeform.getCubename();
		String factortable = addcubeform.getFactortable();
		String[] columnlist = addcubeform.getColumnlist();
		String[] function = addcubeform.getFunction();
		String[] format = addcubeform.getFormat();
		String[] measurename = addcubeform.getMeasurename();
		
		String pageForward = "ToErrorPage";
		if (factortable.equals("a") || columnlist.length == 0 || cubename.equals("")) {
			if (factortable.equals("a")) {
				errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
						"nullfactortable"));
				if (!errors.isEmpty()) {
					//saveErrors(request, errors);
					saveMessages(request, errors);
				}
			}else
			if (columnlist.length == 0) {
				errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
						"nullcolumnlist"));
				if (!errors.isEmpty()) {
					//saveErrors(request, errors);
					saveMessages(request, errors);
				}
			}else
			if (cubename.equals("")) {
				errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
						"nullcubename"));
				if (!errors.isEmpty()) {
					//saveErrors(request, errors);
					saveMessages(request, errors);
				}
			}
		} else {
			pageForward = "ToUserList";
			HttpSession session = request.getSession();
			
			String schemaName=(String)session.getAttribute("schemaName");
		
			String filepath=Util.getWebRootPath()+"/"+Util.getSchemaFilePath(schemaName);
			
			System.out.println("!!!!!!"+filepath);
			session.getAttribute("url");
			session.getAttribute("userName");
			session.getAttribute("passWord");
			session.getAttribute("connString");
			System.out.println("----------------------"
					+ session.getAttribute("filepath")
					+ "------------------------");
			System.out.println("----------------------"
					+ session.getAttribute("schemaName")
					+ "------------------------");
			System.out.println("----------------------"
					+ session.getAttribute("url") + "------------------------");
			System.out.println("----------------------"
					+ session.getAttribute("userName")
					+ "------------------------");
			System.out.println("----------------------"
					+ session.getAttribute("passWord")
					+ "------------------------");
			System.out.println("----------------------"
					+ session.getAttribute("connString")
					+ "------------------------");
			
			//创建measure
			ArrayList<Measure> measurelist =new ArrayList<Measure>();
			for(int i=0;i<columnlist.length;i++){
				Measure measure=new Measure();
				measure.setColmn(columnlist[i]);
				if(!function[i].equals("a")){
				    measure.setFunction(function[i]);
				}
				if(!format[i].equals("a")){
				    measure.setFormat(format[i]);
				}
				if(measurename[i]!=""){
				    measure.setName(measurename[i]);
				}else{
					measure.setName(columnlist[i]);
				}
System.out.println("----------------------"+columnlist[i]+"---"+function[i]+"---"+format[i]+"---"+measurename[i]+"------------------------");				
				measurelist.add(measure);				
			}
System.out.println("----------------------create measure success------------------------");
			//创建cube
			Cube cube = new Cube();	
			cube.setTableName(factortable);
			cube.setMList(measurelist);
			cube.setCubeName(cubename);
			
System.out.println("----------------------create cube success------------------------");
			//创建schema


//System.out.println(Thread.currentThread().getContextClassLoader().getResource(""));

//System.out.println(FileTest.class.getClassLoader().getResource(""));

//System.out.println(ClassLoader.getSystemResource(""));
//System.out.println(FileTest.class.getResource(""));
//System.out.println(FileTest.class.getResource("/")); //Class文件所在路径
//System.out.println(new File("/").getAbsolutePath());
//System.out.println(System.getProperty("user.dir"));



			File file = new File(filepath);
			Schema s=new Schema(file);
			LinkedHashMap<String, Cube> cubeTable=s.getCubeTable();
			cubeTable.put(cubename, cube);
			s.setCubeTable(cubeTable);
System.out.println("----------------------create schema success------------------------");			
			System.out.println(s.toXML());

            s.outToFile(filepath);
            pageForward = "ToAddCubeSuccessPage";
		}
		// TODO Auto-generated method stub
		return (mapping.findForward(pageForward));
	}

}
