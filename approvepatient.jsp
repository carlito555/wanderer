<%@page import="java.sql.*"%>
<%
    int Doctorid = (Integer) session.getAttribute("did");
    String month = request.getParameter("month");

    int BookingId = Integer.parseInt(request.getParameter("BookingId"));
    Class.forName("com.mysql.jdbc.Driver");
    System.out.println("Driver Loading done");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
    System.out.println("Connection Created");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
            ResultSet.CONCUR_UPDATABLE);
    System.out.println("Statement Created");
    ResultSet rs = stmt.executeQuery("select * from booking_table where Bookingid='" + BookingId + "' ");
    System.out.println("ResultSet Created\n\n");

    if (rs.next())
    {
        rs.updateString("Status", "Approve");
        rs.updateRow();
    }
    response.sendRedirect("viewdoctorbookings.jsp?Doctorid="+Doctorid+"&month="+month);
%>


