import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ApproveProcServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        
        HttpSession session1=request.getSession(false);
        String url="jdbc:mysql://localhost:3306/cams_db";
        String user="Yashwanth";
        String password="1724xjim";
        String st="Yes";
        String cname=(String)session1.getAttribute("collegename");
        String failedPath = "check-mark-tick-vector-graphic-21.png";
        
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
                    out.println("<body >"
                        + "<center><img src = '"+ failedPath +"' alt = 'Login' width = '300' height = '200'>"
                        + "<br><br>"
                        + "<h1 style = \"color : red \">Good Job </h1><br> "
                                 + "Allotment order has been sent."
                          
                                + "</center></body>");
                else
                    out.println("Already approved ");  
		}
        }
        catch(Exception ex){
              out.println("Done"); 
        }
       

        
        
        
        
        
        
        
      
        String[] names = request.getParameterValues("students");
        List list = Arrays.asList(names);
        Iterator<String> itr = list.iterator();
        
        
        try
        {
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection(url, user, password);
            Statement stmt=conn.createStatement();
            while (itr.hasNext()){
            
		if (stmt.executeUpdate("Update applications_tables set Status='Yes' where College_name='"+cname+"' and User_name='"+itr.next()+"';")>0) {
                    out.println("<body >"
                        + "<center><img src = '"+ failedPath +"' alt = 'Login' width = '300' height = '200'>"
                        + "<br><br>"
                        + "<h1 style = \"color : red \">Good Job </h1><br> "
                                 + "Selected Student were approved."
                          
                                + "</center></body>");
                } else
                    out.println("Already approved ");  
		}
        }
        catch(Exception ex){}
        
        int count = 1;
       if (count == 1){
         try
        {
            
            
        
       
        
           
            
         
        }
        catch(Exception ex){
               out.print("Sorry" + ex);
        }
       }
         
       
        
        
        
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        doGet(request,response);
    }

}