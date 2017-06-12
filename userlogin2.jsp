<%@page import="java.sql.*"%>
<%
    String uname = request.getParameter("uname");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    System.out.println(uname);
    
    Class.forName("com.mysql.jdbc.Driver");
    System.out.println("Driver Loading done");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
    System.out.println("Connection Created");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
            ResultSet.CONCUR_UPDATABLE);
    System.out.println("Statement Created");
    ResultSet rs = stmt.executeQuery("select * from user where username='" + uname + "' and password='" + password+ "'");
    if (rs.next())
    {
        rs.updateString("status", "active");
        rs.updateRow();
        session.setAttribute("uname", uname);
        session.setAttribute("email",email);
        System.out.println("data set in session : "+session.getAttribute("email"));
        response.sendRedirect("userhome.jsp");
    }

%>