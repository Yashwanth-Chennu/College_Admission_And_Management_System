<%@page import="java.sql.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            
            table{
                width : 100%;
            }
            
            table, th, td {
                border: 1px solid black;
                border-collapse: collapse;
                padding: 8px;
            }
            th{
                background-color:	#666666;
                color : #ffffff
            }
            
            h1, h2, h3, h4, h5 {
       
	margin-top: 30px;
	margin-bottom: 0;
        color : white;
	
}
            tr:nth-child(even) {background-color: #f2f2f2;}
            
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Applications</title>
    </head>
   <body> 
     
             <center><b>Select Students to approve</b></center><br>
        <%
         String url="jdbc:mysql://localhost:3306/cams_db";
        String user="Yashwanth";
        String password="1724xjim";

        String cname=(String)session.getAttribute("collegename");
        String Query=" select `User_name`,`Name`,`Rank`,`Marks` from `applications_tables` where `College_name`='"+cname+"' and `Status` != 'Yes'";
        
       try
       {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection(url, user, password);
            Statement stmt=conn.createStatement();
            ResultSet rs=stmt.executeQuery(Query);
        %>    
        <form action="/sncweb/ApproveProcServlet" method="Get">
           
            <div><table >
                    <tr><th></th><th>Name</th><th>Rank</th><th>Marks</th></tr>
            <%while(rs.next())
            {
                String u=rs.getString(1);
                String n=rs.getString(2);
                String r=rs.getString(3);
                String m=rs.getString(4);
            %>
                
            <tr><td><input type = "checkbox" name = "students" value="<%=u%>" /></td><td> <%=n%></td> <td><%=r%></td><td> <%=m%></td></tr>
            <br>    
            <%} %>
            </table></div>
            <br>
            <input type = "submit" value="Approve" /> 
            </center>
        </form>
        <%       
        }
        catch(Exception e){} 
        %>
        
       <% 
         String uname=(String)session.getAttribute("username");   
             String Query1=" select `User_name`,`Name`, `Approved` from `feepaid_students_tables` where `College_name`='"+cname+"'";
        
     //   String Query1="select 'Name', 'Amount' from `student_tables` where `College_name`='"+cname+"'";
        
  
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection(url, user, password);
            Statement stmt=conn.createStatement();
            ResultSet rs=stmt.executeQuery(Query1);
     
     %> 
     
     
             <form action="/sncweb/ApproveProcServlet" method="Get">
            <center><b>Select Students for sending allotment paper</b></center><br>
            <div><table >
                    <tr><th></th><th>Name</th></tr>
    <%
            while(rs.next())
            {
                
                String u=rs.getString(2);
                int a = Integer.parseInt(rs.getString(3));
                
                if(a != 1){
                   
                    
                
                %>
          
                
            <tr><td><input type = "checkbox" name = "student" value="<%=u%>" /><td><center><%=u%></center></td></td></tr>
            <br>    
           <%
               }
}

%>       
            </table></div>
            <br>
            <input type = "submit" value="Send Allotment" /> 
            </center>
        </form>
     

   
        
        </body>
        
        
    
</html>
