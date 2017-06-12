<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking history</title>
    </head>
    <body>
        <h1>View Booking History Here......!!!!!</h1>
        <%
            String email=(String)session.getAttribute("email");
            String doctorid=(String)session.getAttribute("Doctorid");
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver Loading done");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
            System.out.println("Connection Created");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            System.out.println("Statement Created");
            ResultSet rs = stmt.executeQuery("select * from booking_table  ");
            System.out.println("ResultSet Created\n\n");
            
            %>
               <table border="1">
                   <th>Booking_id</th><th>Doctor_id</th> <th>Patient_Name:</th> <th>Slot_Time</th> <th>Current_Date</th> <th>Appointment_Date</th> <th>Problem</th><th>Status</th><th>Booking Status</th>
            <%    
            while(rs.next())
             {
                 String SlotTime=rs.getString("SlotTime");
                 String CurrentDate=rs.getString("CurrentDate");
                 Date AppointmentDate=rs.getDate("AppointmentDate");
                 String Problem=rs.getString("Problem");
                 String PatientName=rs.getString("PatientName");
                 String Doctorid=rs.getString("Doctorid");
                 String BookingId=rs.getString("BookingId");
                 String Status= rs.getString("Status");
                 
                 Calendar cl = Calendar.getInstance();
                 java.sql.Date d = new java.sql.Date(cl.getTimeInMillis());
             
            
            %>
                <tr>
                    <td><%= BookingId%> </a></td>
                    <td><%= Doctorid%></td>
                    <td><%= PatientName%></td>
                    <td><%= SlotTime%></td>
                    <td><%= CurrentDate%></td>
                    <td><%= AppointmentDate%></td>
                    <td><%= Problem%></td>
                    <td><%= Status%></td>
                  <%
                        if (AppointmentDate.toString().equals(d.toString()))
                        {
                    %>
                    <h1>Today is your appointment</h1>
                    <%
                    } else if (AppointmentDate.compareTo(d) < 0)
                    {
                    %>
                    <h1>Already Attended</h1>
                    <%
                    } else
                    {
                    %>
                    <a  href="cancelbooking.jsp?id=<%= BookingId %> ">Cancel Booking</a>
                    <%
                        }
                    %>
                </tr>
             
                <%}%>
                
         
        </table>  
        
        
        
        
        
    </body>
</html>
