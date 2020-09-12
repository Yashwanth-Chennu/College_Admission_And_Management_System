import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class AdminLoginProcessServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
   
        String uname=request.getParameter("uname");
        String pwd=request.getParameter("pwd");
        
        String url="jdbc:mysql://localhost:3306/cams_db";
        String user="Yashwanth";
        String password="1724xjim";
        String Query=" select `Password` from `admin_table` where `User_name`='"+uname+"'";
        String failedPath = "Failed.png";
        
       try
       {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection(url, user, password);
            Statement stmt=conn.createStatement();
            ResultSet rs=stmt.executeQuery(Query);
    
            while(rs.next())
            {
                
                if(rs.getString(1).equals(pwd))
                {
                
                request.getRequestDispatcher("adminmenu.html").include(request,response);
                request.getSession().setAttribute("username",uname);

                }   
                else
                {
               out.println("<body >"
                        + "<br><center><img src = '"+ failedPath +"' alt = 'Login'>"
                        + "<br><br>"
                        + "<h1 style = \"color : red \">Something went Wrong Failed </h1><br> "
                                 + "Please Make sure You have entered correct Details. Try Again"
                          + "<a href=\"http://localhost:8084/sncweb/login2.html\"><br>Login</a>"
                                + "</center></body>");
                }
            
                
            } 
       } 
       catch(Exception e)
       {
                out.println("Unauthorized access" + e);
       }
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        doGet(request,response);
    }


}
