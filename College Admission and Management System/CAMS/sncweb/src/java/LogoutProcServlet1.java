import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class LogoutProcServlet1 extends HttpServlet 
{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {        
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        request.getSession().invalidate();
        out.println("<h3>Logout Successful</h3>");
        request.getRequestDispatcher("login1.html").include(request,response);
        
    }
    public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException 
    {
        doGet(request,response);
    }
}
        
