
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <style>
            input[type="checkbox"]{
               
              color : #fffff;
             
}
        
            h1, h2, h3, h4, h5 {
       
	margin-top: 30px;
	margin-bottom: 0;
        color : white;
	
}
            
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Application</title>
    </head>
    <body bgcolor="black">
        
        <%
           
        String url="jdbc:mysql://localhost:3306/cams_db";
        String user="Yashwanth";
        String password="1724xjim";
        String Query=" select `College_name` from `incharge_tables`";
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection(url, user, password);
            Statement stmt=conn.createStatement();
            ResultSet rs=stmt.executeQuery(Query);
        %>    
        <form action="/sncweb/ApplyProcServlet" method="Get">
            <center> <h3>Select The College To Apply</h3><br>
            <table border="1">
        <div>
            <%while(rs.next())
            {
                String e=rs.getString(1);
            %>
                
            <tr><td><center><input type = "checkbox" name = "colleges" value="<%=e%>" /><span style ="color : white " ><%=e%></span><br><br></td></tr>
            </center></div> </table>   
            <%} %>
            <br>
            <input type = "submit" value="Apply" /> </center>
        </form>
            <p style = "color : white; font-size : small; float: right;"> *Please Make sure to click all the colleges you want to apply for </p>
        <%
        }  
        catch(Exception e){}
        %>
    </body>
</html>
