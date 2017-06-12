<%@page import="java.sql.*"%>


<%
    String uname = request.getParameter("uname");
    Class.forName("com.mysql.jdbc.Driver");
    System.out.println("Driver Loading done");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
    System.out.println("Connection Created");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
            ResultSet.CONCUR_UPDATABLE);
    System.out.println("Statement Created");
    ResultSet rs = stmt.executeQuery("select * from user where username='" + uname + "'");
    System.out.println("ResultSet Created\n\n");

    if (rs.next())
    {
        String status = rs.getString("status");
        int otp = rs.getInt("OTP");
        if (status.equals("pending"))
        {
%>
<label>Enter OTP</label>
<input type="text" required id="otp" />
<input type="button" value="Verify" onclick="verify1()" />
<%
} else
{
%>
<form action="usercheckpassword.jsp">
<label>Enter Password</label>
<input type="hidden" name="uname" value="<%= uname %>" />
<input type="password" required name="password" />
<input type="submit" value="Login Now" />
</form>

<%
    }

} else
{
%>
<label>Invalid username</label>
<%
    }


%>   