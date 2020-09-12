import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class FeeProcServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        
        String cname=request.getParameter("college");
        String card=request.getParameter("card");
        int cvv=Integer.parseInt(request.getParameter("cvv"));
        String chname=request.getParameter("name_ch");
        String mno=request.getParameter("mobileno");
        String amount = request.getParameter("amount");
        int approve = 0;
        
        String imagePath = "payment-successful.png";
        
      
        HttpSession session=request.getSession(false);
        String uname=(String)session.getAttribute("username");
        
        String url="jdbc:mysql://localhost:3306/cams_db";
        String user="Yashwanth";
        String password="1724xjim";
        String Query="insert into feepaid_students_tables values('"+uname+"','"+uname+"','"+cname+"','"+card+"','"+cvv+"','"+chname+"','"+amount+"', '"+mno+"', '"+approve+"')";
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection(url, user, password);
            Statement stmt=conn.createStatement();
            if(stmt.executeUpdate(Query)>0)
            //request.getRequestDispatcher("login.html").include(request,response);
               // out.println("<body bgcolor='Magenta'><center><br><br><h3>Paid successfully<br><a href=\"http://localhost:8084/sncweb/login.html\">Login now</a></h3></center></body>");
             out.println("<body >"
                        + "<center><img src = \""+imagePath+"\" alt = \"Reg\">  "
                                + "<br><br>"
                                + "<h3 style=\"color:green\">Payment was Successful<br></h3>"
                                + "Please Wait. The College will Send You the allotment Order<br>"
                     +"Allotment order section will be empty if the college didnt send the allotment order"
                                   
                                + "</center></body>");
            else 
                //out.println("<body bgcolor='Magenta'><center><br><br><h3>Registration Failed<a href=\"http://localhost:8084/sncweb/register.html\">Try again</a></h3></center></body>");
                out.println("Failed");
        }
        catch(Exception e){
            out.println("Registration is Successful " + Query);
        }
        
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        doGet(request,response);
    }

}
        