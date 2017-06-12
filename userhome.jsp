
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Home Page</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
             
        
    </head>
    <body>
        <%@include file="user_header.jsp" %>
       
        <div class="container">
             <%
        String uname = session.getAttribute("uname").toString();
       
           
        %>
     
           <h2> <label>Welcome <%= uname %></label> </h2>
           
            
            <%
      
    Class.forName("com.mysql.jdbc.Driver");
    System.out.println("Driver Loading done");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
    System.out.println("Connection Created");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
            ResultSet.CONCUR_UPDATABLE);
    System.out.println("Statement Created");
    ResultSet rs = stmt.executeQuery("select * from doctors_info");
    System.out.println("ResultSet Created\n\n");

 while(rs.next())
 {
     String icon=rs.getString("Icon");
     String cat_name=rs.getString("cat_name");
     %>
     
     <div class="col-sm-3" >
         <img src="<%= icon%>" width="200" height="200"/><br>
         <a href="viewsubcategory.jsp?cat_name=<%= cat_name%>" style="background-color: #00598e;border: 2px solid #e7e7e7" class="btn btn-success"><%= cat_name%></a>
             
     </div>
    <%
            }
      %>     
        </div>
        <%@include file='footer.html' %>
        </body>
  </html>
