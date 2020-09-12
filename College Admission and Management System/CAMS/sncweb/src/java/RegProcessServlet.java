import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class RegProcessServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        
        String name=request.getParameter("name");
        String fname=request.getParameter("fname");
        String email=request.getParameter("email");
        String mno=request.getParameter("mno");
        int rank=Integer.parseInt(request.getParameter("rank"));
        int marks=Integer.parseInt(request.getParameter("marks"));
        String uname=request.getParameter("uname");
        String pwd=request.getParameter("pwd");
        String imagePath = "Registraion.png";
        String failedPath = "Failed.png";
        
        String url="jdbc:mysql://localhost:3306/cams_db";
        String user="Yashwanth";
        String password="1724xjim";
        String Query="insert into student_tables values('"+name+"','"+fname+"','"+email+"','"+mno+"','"+rank+"','"+marks+"', '"+uname+"','"+pwd+"')";
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection(url, user, password);
            Statement stmt=conn.createStatement();
            if(stmt.executeUpdate(Query)>0)
            //request.getRequestDispatcher("login.html").include(request,response);
                out.println("<body >"
                        + "<center><img src = \""+imagePath+"\" alt = \"Reg\">  "
                                + "<br><br>"
                                + "<h3 style=\"color:green\">Registration Completed Successfully<br></h3>"
                                + "Please click on Sign in In order to Login ..."
                                   + "<a href=\"http://localhost:8084/sncweb/login.html\">Login now</a>"
                                + "</center></body>");
            else 
                out.println("<body >"
                        + "<center><img src = \""+failedPath+"\" alt = \"Reg\">  "
                                + "<br><br>"
                                + "<h1>Something went Wrong Failed <h1><br>"
                        + "Failed to execute registration script please try to register again"
                                + "<a href=\"http://localhost:8084/sncweb/register.html\">Try again</a></h3>"
                                + "</center></body>");
        }
        catch(Exception e){}
        
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        doGet(request,response);
    }
}
        
