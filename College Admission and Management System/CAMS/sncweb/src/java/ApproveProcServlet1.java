import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ApproveProcServlet1 extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        
        HttpSession session1=request.getSession(false);
       
      
        
        
        String url="jdbc:mysql://localhost:3306/cams_db";
        String user="Yashwanth";
        String password="1724xjim";
        int approve = 1;
        try
        {
            String[] names = request.getParameterValues("student");
        List list = Arrays.asList(names);
        Iterator<String> itr = list.iterator();
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection(url, user, password);
            Statement stmt=conn.createStatement();
            out.println(itr.next());
          while (itr.hasNext()){
            
		if (stmt.executeUpdate("Update feepaid_students_tables set Approved = "+ 1 + " where Name='"+itr.next()+"';")>0) 
                    out.println("Approved ");
                else
                    out.println("Already approved ");  
		}
        }
        catch(Exception ex){
              out.println("Done"); 
        }
       
        
        
        
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        doGet(request,response);
    }

}