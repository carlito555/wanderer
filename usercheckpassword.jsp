<%@page import="java.sql.*"%>
<%
    String uname = request.getParameter("uname");
    String password = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    System.out.println("Driver Loading done");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
    System.out.println("Connection Created");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
            ResultSet.CONCUR_UPDATABLE);
    System.out.println("Statement Created");
    ResultSet rs = stmt.executeQuery("select * from user where username='" + uname + "' and password='"+password+"'");
    System.out.println("ResultSet Created\n\n");
    System.out.println(uname);
    System.out.println(password);
 
    if(rs.next())
    {
        session.setAttribute("uname",uname);
        
       response.sendRedirect("userhome.jsp");
    }
    else
    {
        response.sendRedirect("userlogin.jsp");
    }

%>