
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
       Class.forName("com.mysql.jdbc.Driver");
       System.out.println("Driver Loading Done");
       
       
       Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","system");
       System.out.println("Connection Created");
       
       Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
       System.out.println("Statement Created");
       
       ResultSet rs=stmt.executeQuery("Select * from doctors_info");
       System.out.println("Result Set Created");
       
     if(rs.next())
     {
         response.sendRedirect("view_doctors.jsp");
     }
     else
     {
        response.sendRedirect("add_doctor.jsp"); 
     }


%>