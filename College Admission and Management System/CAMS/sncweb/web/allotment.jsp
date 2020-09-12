<%@page import="java.sql.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    String uname=(String)session.getAttribute("username");
    String url="jdbc:mysql://localhost:3306/cams_db";
    String user="Yashwanth";
    String password="1724xjim";
    String Query=" select `College_name` from `feepaid_students_tables` where `User_name`='"+uname+"'";
    int approve = 1;
     
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection(url, user, password);
        Statement stmt=conn.createStatement();
        ResultSet rs1=stmt.executeQuery(Query);
        
        while(rs1.next())
        {
            
            String cname=rs1.getString(1); 
            String Query1="select * from `feepaid_students_tables` where `User_name`='"+uname+"'  and `Approved` = '"+1+"'    ";
            ResultSet rs=stmt.executeQuery(Query1); 
            while(rs.next())
            {
                String name=rs.getString(1);
                String fname=rs.getString(2);
                String rank=rs.getString(5);
            
%>
<html>
    <body bgcolor="silver">
    <center>
    <h2>  <%= cname%></h2><br>
    <h3><u>PROVISIONAL ALLOTMENT ORDER</u></h3><br>

    
    <p>This is to inform that <b><%=name%></b> has paid the fee and been alloted a seat in <%=cname%>.
    </p> <br>
    <p>The students belonging to SC/ST/BC/EBC/Disabled/Minority categories will be considered for Reimbursement of Tution Fee(RTF) which is<br> subject to verification
      and eligibility criteria prescribed by Govt of Telangana from time to time .
    </p><br>
    <b>Note:Student must submit the allotment order in college admission branch on date of joining-01/sept/2020</b>
    
    
    </center>
    </body> 
    
</html>
<% } 
     }}
catch(Exception e){%>



<body> </body>
<%

}
   
%>


