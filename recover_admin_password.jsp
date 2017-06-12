<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <div class="jumbotron">
        <center><h2>Recover Password</h2></center>
    </div>
</head>
<body>
    <div class="container">
        <form action="paswrd_get_email.jsp" method="POST">
            <h3 class="text-info text-center">Password will be sent to your email..</h3>
            <%
                String username = request.getParameter("username");
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("Select * from admin_login where username='" + username + "'");
                if (rs.next())
                {
                    String mail = rs.getString("email");
                    String email = mail.replaceAll("\\S{1,9}@", "*******@");
            %>
            <label class="col-sm-offset-4"><code><h3 class ="text-info"><%=email%></h3></code></label>       
            <input type="hidden" name="email" value="<%= mail%>" />
            <%
                }
            %>
            <br>
            <input class="btn btn-primary col-sm-offset-4" type="submit" value="Send Email">
        </form>
    </div>
</body>
</html>
