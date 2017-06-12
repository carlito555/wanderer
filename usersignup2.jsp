<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>

<%
    try
    {
    String username = request.getParameter("newname");
    System.out.println(username);
    String password = request.getParameter("password");
    String cpassword = request.getParameter("confirmpassword");
    String mobile = request.getParameter("mobile");
    String email = request.getParameter("email");
    Class.forName("com.mysql.jdbc.Driver");
    System.out.println("Driver Loading Done");
    
    Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","system");
    System.out.println("Connection created");
    
    Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
    System.out.println("Statement created");
    
    ResultSet rs=stmt.executeQuery("Select * from user where username='"+username+"'");
    System.out.println("Result Set Created");
  if(rs.next())
  {
      
  }
  else
  {
       rs.moveToInsertRow();
       rs.updateString("username",username);
       rs.updateString("password",password);
       rs.updateString("confirmpassword",cpassword);
       rs.updateString("mobile", mobile);
       rs.updateString("email",email);
        rs.insertRow();
       response.sendRedirect("usersignup.jsp?message=success");
  }
   
    }
    catch(Exception e   )
    {
    e.printStackTrace();
    }
%>
    