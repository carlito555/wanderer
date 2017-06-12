<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
    Class.forName("com.mysql.jdbc.Driver");
    System.out.println("Driver Loading Done");
    
    Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","system");
    System.out.println("Connection created");
    
    Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
    System.out.println("Statement created");
    
    ResultSet rs=stmt.executeQuery("Select * from doctors_info2 where Doctor_name='"+username+"' and Password='"+password+"'");
    System.out.println("Result Set Created");
    if(rs.next())
    {
        int did=rs.getInt("doctor_id");
        session.setAttribute("did",did);
        
        session.setAttribute("username", username);
        response.sendRedirect("DoctorDashboard.jsp");
        
        
        
    }
    else
    {
        response.sendRedirect("DoctorLogin.jsp?msg=Invalid Username/Password");
    }
%>
    