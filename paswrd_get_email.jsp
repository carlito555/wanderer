<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <header class="jumbot-2">ADMINISTRATOR PASSWORD</h1></header></title>
</head>
<%
    String email = request.getParameter("email");
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("Select * from admin_login where email='" + email + "'");
    if (rs.next())
    {
        String password = rs.getString("password");
%>
<label class="col-sm-offset-4"><code><h3 class ="text-info">The Admin password is:<%=password%></h3></code></label>       
            <%
                }
            %>    
</div>
</body>
</html>
