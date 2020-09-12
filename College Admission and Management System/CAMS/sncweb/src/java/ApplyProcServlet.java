import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ApplyProcServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        
        HttpSession session=request.getSession(false);
        String uname=(String)session.getAttribute("username");
        String failedPath = "d.png";
        try
        {
            
        if(session!=null)
        {    
            int rank=Integer.parseInt((String)session.getAttribute("rank"));
            int marks=Integer.parseInt((String)session.getAttribute("marks"));
            String name=(String)session.getAttribute("name");
            String[] names = request.getParameterValues("colleges");
            List list = Arrays.asList(names);
            Iterator<String> itr = list.iterator();
        
            String url="jdbc:mysql://localhost:3306/cams_db";
            String user="Yashwanth";
            String password="1724xjim";
            
   
        
        
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection(url, user, password);
            Statement stmt=conn.createStatement();
            while (itr.hasNext())
            {
		if (stmt.executeUpdate("insert into applications_tables(User_name,Name,Rank,Marks,College_name) values('"+uname+"','"+name+"','"+rank +"','"+marks +"','"+itr.next()+"')")>0) 
                    out.println("<body >"
                        + "<center><img src = '"+ failedPath +"' alt = 'Login' width = '300' height = '200'>"
                        + "<br><br>"
                        + "<h1 style = \"color : red \">Your response has been submitted.  </h1><br> "
                                 + ""
                          
                                + "</center></body>");
                else
                    out.println("Already applied ");  
            }
        }
       }
        catch(Exception ex){
        out.println("Unauthorized access");
        }
        
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        doGet(request,response);
    }

}