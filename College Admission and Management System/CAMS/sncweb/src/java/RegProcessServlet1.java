import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class RegProcessServlet1 extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        
        String cname=request.getParameter("cname");
        String email=request.getParameter("email");
        String mno=request.getParameter("mno");
        String uname=request.getParameter("uname");
        String pwd=request.getParameter("pwd");
        
        String url="jdbc:mysql://localhost:3306/cams_db";
        String user="Yashwanth";
        String password="1724xjim";
        String imagePath = "Registraion.png";
        String failedPath = "Failed.png";
        String Query="insert into incharge_tables values('"+cname+"','"+email+"','"+mno+"', '"+uname+"','"+pwd+"')";
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection(url, user, password);
            Statement stmt=conn.createStatement();
            if(stmt.executeUpdate(Query)>0)
            //request.getRequestDispatcher("login.html").include(request,response);
                out.println("<body >"
                        + "<center><img src = \""+imagePath+"\" alt = \"Reg\">  "
                                + "<br><br>"
                                + "<h1 style=\"color:green\">Registration Completed Successfully<br></h1>"
                                + "Please click on Sign in In order to Login ..."
                        
                                   + "<a href=\"http://localhost:8084/sncweb/login1.html\">Sign in</a>"
                                + "</center></body>");
            else 
                out.println("<body >"
                        + "<center><img src = \""+failedPath+"\" alt = \"Reg\">  "
                                + "<br><br>"
                                + "<h1>Something went Wrong Failed <h1><br +"
                        + "Failed to execute registration script please try to register again"
                                + "<a href=\"http://localhost:8084/sncweb/register1.html\">Try again</a></h3>"
                                + "</center></body>");
        }
        catch(Exception e){}
        
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        doGet(request,response);
    }
}
        