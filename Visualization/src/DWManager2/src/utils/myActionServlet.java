package utils;
import org.apache.struts.action.*;
import javax.servlet.http.*;
public class myActionServlet extends ActionServlet {
  public myActionServlet() {
  }
  protected void process(HttpServletRequest request, HttpServletResponse response) 
  throws java.io.IOException, javax.servlet.ServletException {
    request.setCharacterEncoding("utf-8");//������һ�н��б���ת���Ϳ����ˡ�
    super.process(request, response);
  }
}