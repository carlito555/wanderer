<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Booking detail</title>
    </head>
    <body>
        <%

            String BookingId = request.getParameter("BookingId");
            int Doctorid = 0;
            String SlotTime = "";
            String Email = "";
            String AppointmentDate="";
            String Problem = "";
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver Loading done");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
            System.out.println("Connection Created");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            System.out.println("Statement Created");
            ResultSet rs = stmt.executeQuery("select * from booking_table where BookingId='" + BookingId + "'");
            System.out.println("ResultSet Created\n\n");

            while (rs.next())
            {
                SlotTime = rs.getString("SlotTime");
                Email = rs.getString("Email");
                AppointmentDate=rs.getString("AppointmentDate");
                Problem = rs.getString("Problem");
                Doctorid = rs.getInt("Doctorid");

            }

            Connection conn2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
            System.out.println("Connection Created");
            Statement stmt2 = conn2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            System.out.println("Statement Created");
            ResultSet rs2 = stmt2.executeQuery("select * from doctors_info2 where doctor_id='" + Doctorid + "'");
            System.out.println("ResultSet Created\n\n");

            if (rs2.next())
            {
                String Profile_Photo = rs2.getString("Profile_Photo");
                String Doctor_Name = rs2.getString("Doctor_name");

        %>
        <div class="container">
                <div style="margin: 10px;border: solid 2px black; " class="row">
                    <img src="<%=Profile_Photo%>"  width="300" height="200" class="img-responsive"/>
                    <label style="font-size: 25px" ><%=Doctor_Name%></label> <br>

                    <%}%>
                </div>
           
            <div style="margin: 10px;border: solid 2px black; " class="row">

                <div style="background: #006666; color: white; padding: 10px;color: white">

                </div>
                <label style="font-size: 25px" >SlotTime: </label><label style="font-size: 20px" ><%=SlotTime%></label> <br>
                <label style="font-size: 25px" >AppoimtmentDate: </label><label style="font-size: 20px" ><%= AppointmentDate%></label> <br>

                <label style="font-size: 25px" >User Email: </label><label style="font-size: 20px" ><%=Email%></label> <br>
                <label style="font-size: 25px" >Patient Problem: </label><label style="font-size: 20px" ><%=Problem%></label> <br>
            </div>

        </div>




    </body>
</html>
