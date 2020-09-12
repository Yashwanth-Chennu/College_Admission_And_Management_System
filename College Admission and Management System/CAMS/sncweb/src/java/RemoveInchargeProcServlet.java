import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class RemoveInchargeProcServlet extends HttpServlet 
{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {        
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
   
        String iuname=request.getParameter("iuname");
        
        String url="jdbc:mysql://localhost:3306/cams_db";
        String user="Yashwanth";
        String password="1724xjim";
        String Query=" Delete  from `incharge_tables` where `User_name`='"+iuname+"'";
        
       try
       {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection(url, user, password);
            Statement stmt=conn.createStatement();
            
            if(stmt.executeUpdate(Query)>0)
            {
                out.println("Deleted Successfully");
            }   
            else
            {
                out.println("Failed");
            } 
       }catch(Exception e){}    
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        doGet(request,response);
    }


}