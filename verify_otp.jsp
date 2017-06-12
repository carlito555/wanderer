<%@page import="java.sql.*"%>
<%
    String otp = request.getParameter("otp");
    String uname = request.getParameter("uname");
    System.out.println(otp);
    System.out.println(uname);
    Class.forName("com.mysql.jdbc.Driver");
    System.out.println("Driver Loading done");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
    System.out.println("Connection Created");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
            ResultSet.CONCUR_UPDATABLE);
    System.out.println("Statement Created");
    ResultSet rs = stmt.executeQuery("select * from user where username='" + uname + "' and otp='"+otp+"'");
    if(rs.next())
    {
        %>
        
        <form action="userlogin2.jsp" method="get">
        <input type="hidden" name="uname" value="<%= uname%>" /><br>
        <label class="11">Enter Password</label><br>
        <input type="password" name="password" /><br>
        <input type="submit" value="Submit" />
        
        </form>
        <%
    }
else
{
%>
invalid
<%
}
%>