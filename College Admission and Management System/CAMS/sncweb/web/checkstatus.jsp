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
        <title>Status</title>
    </head>
    <body bgcolor="black">
        
        <%
         String url="jdbc:mysql://localhost:3306/cams_db";
        String user="Yashwanth";
        String password="1724xjim";
        
        String uname=(String)session.getAttribute("username");
        String Query=" select `College_name`,`Status` from `applications_tables` where `User_name`='"+uname+"'";
        
       try
       {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection(url, user, password);
            Statement stmt=conn.createStatement();
            ResultSet rs=stmt.executeQuery(Query);
            
        %>  
        <center>  <h3>Status of Your Application</h3><br>
        <div><table border="1">
                <tr>  <th>College Name</th> <th>Status</th>  </tr>
         <% while (rs.next())
            {
                String c=rs.getString(1);
                String s=rs.getString(2);
          %>
                <tr> <td><%=c %></td>  <td><%=s %></td>  </tr>
               
          <%
             }
             Query=" select `College_name` from `applications_tables` where `Status`='Yes' and `User_name`='"+uname+"'";
             ResultSet rs1=stmt.executeQuery(Query);
          %>
            </table></div>
        
        <form action="/sncweb/FeeProcServlet" method="Get">
            <br>
            <h3>Pay Fee</h3><br>
            <div><table border="1">
                    <tr><td><label for="cars">Choose College:</label> </td>  <td> <select name="college" id="college">   
            <%while(rs1.next())
            {
                String u=rs1.getString(1);
                
            %>
                    <option value="<%=u%>"><%=u%></option>  
               
            <%} %>
                    </select></td></tr>
                    <tr><td>Card Number</td><td><input type="text" name="card"></td></tr> 
                    <tr><td>CVV</td><td><input type="text" name="cvv"></td></tr>
                    <tr><td>Name of Card Holder</td><td><input type="text" name="name_ch"></td></tr>
                    <tr><td>Amount</td><td><input type="text" name="amount"></td></tr>
                    <tr><td>Mobile Number</td><td><input type="text" name="mobileno"></td></tr>
            </table></div>
            <br>
            <input type = "submit" value="Pay Now" /> 
            
        </form></center>
        <%       
        }
        catch(Exception e){} 
        %>
    </body>
</html>
 