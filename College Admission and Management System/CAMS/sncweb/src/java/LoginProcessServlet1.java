import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class LoginProcessServlet1 extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
   
        String uname=request.getParameter("uname");
        String pwd=request.getParameter("pwd");
        
        String u="jdbc:mysql://localhost:3306/cams_db";
        String s="Yashwanth";
        String p="1724xjim";
        String q=" select `College_name`,`Password` from `incharge_tables` where `User_name`='"+uname+"'";
        String failedPath = "Failed.png";
        
       try
       {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection(u, s, p);
            Statement stmt=conn.createStatement();
            ResultSet r=stmt.executeQuery(q);
            int count = 1;
            
            while(r.next())
            {
                if(count == 2)
                        break;
                if(r.getString(2).equals(pwd))
                {
                //out.println("<body bgcolor='Magenta'><center><br><br><h3>Welcome "+rs.getString(1)+"</h3></center></body>");
                 String cname=r.getString(1);
                request.getRequestDispatcher("menu1.html").include(request,response);
                request.getSession().setAttribute("username",uname);
                request.getSession().setAttribute("collegename",cname);
                
                }   
                else
               {
                out.println("<body >"
                        + "<br><center><img src = '"+ failedPath +"' alt = 'Login'>"
                        + "<br><br>"
                        + "<h1 style = \"color : red \">Something went Wrong Failed </h1><br> "
                                 + "Please Make sure You have entered correct Details. Try Again"
                          + "<a href=\"http://localhost:8084/sncweb/login1.html\"><br>Login</a>"
                                + "</center></body>");
                //request.getRequestDispatcher("login.html").include(request, response);
                }
                count++;
            
                
            }
       }catch(Exception e){}    
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        doGet(request,response);
    }


}