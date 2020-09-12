import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class LoginProcessServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
   
        String uname=request.getParameter("uname");
        String pwd=request.getParameter("pwd");
        
        String url="jdbc:mysql://localhost:3306/cams_db";
        String user="Yashwanth";
        String password="1724xjim";
        String failedPath = "Failed.png";
        String Query=" select `Name`,`Password`,`Rank`,`Marks` from `student_tables` where `User_name`='"+uname+"'";
        
       try
       {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection(url, user, password);
            Statement stmt=conn.createStatement();
            ResultSet rs=stmt.executeQuery(Query);
    
            while(rs.next())
            {
                
                if(rs.getString(2).equals(pwd))
                {
                String name=rs.getString(1);
                String rank=rs.getString(3);
                String marks=rs.getString(4);
                request.getRequestDispatcher("menu.html").include(request,response);
                request.getSession().setAttribute("username",uname);
                request.getSession().setAttribute("rank",rank);
                request.getSession().setAttribute("marks",marks);
                request.getSession().setAttribute("name",name);
                }   
                else
                {
                out.println("<body >"
                        + "<center><img src = '"+ failedPath +"' alt = 'Login'>"
                        + "<br><br>"
                        + "<h1 style = \"color : red \">Something went Wrong Failed </h1><br> "
                                 + "Please Make sure You have entered correct Details. Try Again"
                          + "<a href=\"http://localhost:8084/sncweb/login.html\"><br>Login</a>"
                                + "</center></body>");
                //request.getRequestDispatcher("login.html").include(request, response);
                }
            
                
            } 
       } 
       catch(Exception e)
       {
                out.println("Unauthorized access");
       }
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        doGet(request,response);
    }


}