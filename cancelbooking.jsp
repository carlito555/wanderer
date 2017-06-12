
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cancel Booking</title>
    </head>
    <body>
        <%
            String BookingId=request.getParameter("id");
            
            Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driver Loading done");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
                System.out.println("Connection Created");
                Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                        ResultSet.CONCUR_UPDATABLE);
                System.out.println("Statement Created");
                ResultSet rs = stmt.executeQuery("select * from booking_table where BookingId='"+BookingId+"' ");
                System.out.println("ResultSet Created\n\n");

                while(rs.next())
                {
                    rs.updateString("Status", "Cancel");
                    rs.updateRow();
                }
                    response.sendRedirect("viewbookinghistory.jsp" );


            
            %>
    </body>
</html>
