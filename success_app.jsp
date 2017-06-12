<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        <%
            String PatientName=request.getParameter("PatientName");
            int PatientAge=Integer.parseInt(request.getParameter("PatientAge"));
            int Doctorid=Integer.parseInt(request.getParameter("Doctorid"));
            int fees=Integer.parseInt(request.getParameter("fees"));
            String Problem=request.getParameter("Problem");
            String username=request.getParameter("username");
            String AppointmentDate=request.getParameter("AppointmentDate");
            String slottime=request.getParameter("slottime");
            String email=request.getParameter("email");
            
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver Loading done");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
            System.out.println("Connection Created");
 
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            System.out.println("Statement Created");
      
            ResultSet rs = stmt.executeQuery("select * from booking_table");
            System.out.println("ResultSet Created\n\n");
                fees=fees/100;
                rs.moveToInsertRow();
                rs.updateString("PatientName", PatientName);
                rs.updateString("Problem", Problem);
                rs.updateString("AppointmentDate", AppointmentDate);
                rs.updateString("Email",email);
                rs.updateString("Fees",fees+"");
                rs.updateString("SlotTime",slottime);
                rs.updateInt("PatientAge", PatientAge);
                rs.updateInt("Doctorid", Doctorid);
                rs.insertRow();

            
            
            


            %>
            
            <h1>Booking Successfull</h1>
    </body>
</html>
