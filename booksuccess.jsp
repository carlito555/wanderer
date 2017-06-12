<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Success</title>
    </head>
    <body>
        <%
            String email=(String) session.getAttribute("email");
            String SlotTime=request.getParameter("SlotTime");
            String PatientName=request.getParameter("PatientName");
            String AppointmentDate=request.getParameter("AppointmentDate");
            String CurrentDate=request.getParameter("CurrentDate");
            String Fees=request.getParameter("Fees");
            String Doctorid=request.getParameter("Doctorid");
            String PatientAge=request.getParameter("PatientAge");
            String Problem=request.getParameter("Problem");
                        
           Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver Loading done");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
            System.out.println("Connection Created");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            System.out.println("Statement Created");
            ResultSet rs = stmt.executeQuery("select * from booking_table");
            System.out.println("ResultSet Created\n\n");
            
            rs.moveToInsertRow();
            rs.updateString("SlotTime", SlotTime);
            rs.updateString("PatientName", PatientName);
            rs.updateString("PatientAge", PatientAge);
            rs.updateString("Problem", Problem);
            rs.updateString("AppointmentDate",AppointmentDate );
            rs.updateString("Fees", Fees);
            rs.updateString("Doctorid", Doctorid);
            rs.updateString("Email", email);
            rs.updateString("CurrentDate", CurrentDate);
            
            rs.insertRow();
 
          %>
            <h1>Booking Successful</h1>
    </body>
</html>
