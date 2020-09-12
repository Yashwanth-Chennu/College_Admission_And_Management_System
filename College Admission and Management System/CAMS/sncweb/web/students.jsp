<%@page import="java.util.*"%>
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
             tr:nth-child(odd) {background-color: #9999ff;}

            
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Students List</title>
    </head>
    <body bgcolor="black">
        
        <%
         String url="jdbc:mysql://localhost:3306/cams_db";
        String user="Yashwanth";
        String password="1724xjim";
        
        String uname=(String)session.getAttribute("username");
        String Query=" select * from `student_tables`";
        
       try
       {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection(url, user, password);
            Statement stmt=conn.createStatement();
            ResultSet rs=stmt.executeQuery(Query);
            
        %>  
    <center>  <h3 style="font-family: Times New Roman, Times, serif;" >Details of Students who have registered Till now </h3><br>
        <div><table >
                <tr><th>Name</th><th>Father Name</th><th>Email Address</th><th>Mobile No</th><th>Eamcet Rank</th><th>Inter Marks</th><th>User_name</th><th>Remove</th></tr>
         <% while (rs.next())
            {
          %>
                <tr><td><%=rs.getString(1)%></td><td><%=rs.getString(2)%></td><td><%=rs.getString(3)%></td><td><%=rs.getString(4)%></td><td><%=rs.getString(5)%></td><td><%=rs.getString(6)%></td><td><%=rs.getString(7)%></td> <td><a href="http://localhost:8084/sncweb/RemoveStudProcServlet?suname=<%=rs.getString(7)%>">Remove</td> </tr>
               
          <%
             }
          %>
            </table></div>
          <%
          }catch(Exception e){} 

          %>
</body>
</html>