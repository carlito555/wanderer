<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
    Class.forName("com.mysql.jdbc.Driver");
    System.out.println("Driver Loading Done");
    
    Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","system");
    System.out.println("Connection created");
    
    Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
    System.out.println("Statement created");
    
    ResultSet rs=stmt.executeQuery("Select*from admin_login where username='"+username+"'and password='"+password+"'");
    System.out.println("Result Set Created");
    if(rs.next())
    {
        session.setAttribute("username", username);
        response.sendRedirect("admin_dashboard.jsp");
    }
    else
    {
        response.sendRedirect("admin_login.jsp?msg=Invalid Username/Password");
    }
%>
    