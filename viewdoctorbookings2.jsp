<%@page import="java.sql.*"%>

<h2><label style="color: #00598e">Pending Bookings</label></h2>

<%
    int Doctorid = (Integer) session.getAttribute("did");
    String month = request.getParameter("month");
    Class.forName("com.mysql.jdbc.Driver");
    System.out.println("Driver Loading done");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
    System.out.println("Connection Created");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
            ResultSet.CONCUR_UPDATABLE);
    System.out.println("Statement Created");
    ResultSet rs = stmt.executeQuery("select * from booking_table where Status='Pending' and Doctorid='" + Doctorid + "' and AppointmentDate like '" + month + "%'");
    System.out.println("ResultSet Created\n\n");
    if (rs.next())
    {
        rs.previous();
%>
<table border="1" class="table-hover">
    <th>Booking-Id</th><th>Patient-Name</th><th>Patient-Age</th><th>Email</th><th>Slot-Time</th><th>Problem</th><th>Appointment-Date</th><th>Status</th><th>Operation</th>

    <%
        while (rs.next())
        {
            int BookingId = rs.getInt("BookingId");
            String SlotTime = rs.getString("SlotTime");
            String CurrentDate = rs.getString("CurrentDate");
            String Email = rs.getString("Email");
            String PatientName = rs.getString("PatientName");
            String AppointmentDate = rs.getString("AppointmentDate");
            String Status = rs.getString("Status");
            String PatientAge = rs.getString("PatientAge");
            String Problem = rs.getString("Problem");

    %>
    <tr>
        <td><%=BookingId%></td> 
        <td><%=PatientName%></td>
        <td><%=PatientAge%></td>
        <td><%=Email%></td> 
        <td><%=SlotTime%></td>
        <td><%=Problem%></td> 
        <td><%=AppointmentDate%></td> 
        <td><%=Status%></td>
        <td>
            <a  class="active btn btn-success " href="approvepatient.jsp?BookingId=<%=BookingId%>">Approve</a>
            <a  class="active btn btn-success" href="rejectpatient.jsp?BookingId=<%=BookingId%>">Reject</a>

        </td>



    </tr>
    <%  }
    %>
</table>
<%
} else
{
%>
<h4>No Entry Here !!</h4>
<%
    }
%>
<h2><label style="color: #00598e" >Approved Bookings</label></h2>

<%
    //int Doctorid=(Integer)session.getAttribute("did"
    //String month = request.getParameter("month");
    Class.forName("com.mysql.jdbc.Driver");
    System.out.println("Driver Loading done");
    System.out.println("Connection Created");
    Statement stmt1 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
            ResultSet.CONCUR_UPDATABLE);
    System.out.println("Statement Created");
    ResultSet rs1 = stmt1.executeQuery("select * from booking_table where Status='approve' and Doctorid='" + Doctorid + "' and AppointmentDate like '" + month + "%'");
    System.out.println("ResultSet Created\n\n");

    if (rs1.next())
    {
        rs1.previous();
%>
<table border="1" class="table-hover">
    <th>Booking-Id</th><th>Patient-Name</th><th>Patient-Age</th><th>Email</th><th>Slot-Time</th><th>Problem</th><th>Appointment-Date</th><th>Status</th>

    <%
        while (rs1.next())
        {
            int BookingId = rs1.getInt("BookingId");
            String SlotTime = rs1.getString("SlotTime");
            String CurrentDate = rs1.getString("CurrentDate");
            String Email = rs1.getString("Email");
            String PatientName = rs1.getString("PatientName");
            String AppointmentDate = rs1.getString("AppointmentDate");
            String Status = rs1.getString("Status");
            String PatientAge = rs1.getString("PatientAge");
            String Problem = rs1.getString("Problem");

    %>
    <tr>
        <td><%=BookingId%></td> 
        <td><%=PatientName%></td>
        <td><%=PatientAge%></td>
        <td><%=Email%></td> 
        <td><%=SlotTime%></td>
        <td><%=Problem%></td> 
        <td><%=AppointmentDate%></td> 
        <td><%=Status%></td>

    </tr>
    <%  }
    %>
</table>
<%
} else
{
%>
<h4>No Entry Here !!</h4>

<%
    }
%>
<h2><label style="color: #00598e">Rejected Bookings</label></h2>
<%
    //int Doctorid=(Integer)session.getAttribute("did");
    //String month = request.getParameter("month");
    Class.forName("com.mysql.jdbc.Driver");
    System.out.println("Driver Loading done");
    System.out.println("Connection Created");
    Statement stmt2 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
            ResultSet.CONCUR_UPDATABLE);
    System.out.println("Statement Created");
    ResultSet rs2 = stmt2.executeQuery("select * from booking_table where Status='reject' and Doctorid='" + Doctorid + "' and AppointmentDate like '" + month + "%'");
    System.out.println("ResultSet Created\n\n");

    if (rs2.next())
    {
        rs2.previous();
%>
<table border="1" class="table-hover">
    <th>Booking-Id</th><th>Patient-Name</th><th>Patient-Age</th><th>Email</th><th>Slot-Time</th><th>Problem</th><th>Appointment-Date</th><th>Status</th>

    <%
        while (rs2.next())
        {
            int BookingId = rs2.getInt("BookingId");
            String SlotTime = rs2.getString("SlotTime");
            String CurrentDate = rs2.getString("CurrentDate");
            String Email = rs2.getString("Email");
            String PatientName = rs2.getString("PatientName");
            String AppointmentDate = rs2.getString("AppointmentDate");
            String Status = rs2.getString("Status");
            String PatientAge = rs2.getString("PatientAge");
            String Problem = rs2.getString("Problem");

    %>
    <tr>
        <td><%=BookingId%></td> 
        <td><%=PatientName%></td>
        <td><%=PatientAge%></td>
        <td><%=Email%></td> 
        <td><%=SlotTime%></td>
        <td><%=Problem%></td> 
        <td><%=AppointmentDate%></td> 
        <td><%=Status%></td>



    </tr>
    <%  }
    %>
</table>
<%
} else
{
%>

<h4>No Entry Here !!</h4>
<%
    }
%>


