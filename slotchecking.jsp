<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Calendar"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Slot Checking</title>
    </head>
    <body>
        <%
            int Doctorid = Integer.parseInt(request.getParameter("Doctorid"));
            String AppointmentDate = request.getParameter("AppointmentDate");

            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver Loading done");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
            System.out.println("Connection Created");
            //Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
            // ResultSet.CONCUR_UPDATABLE);
            //System.out.println("Statement Created");

            String a[] = AppointmentDate.split("-");
            Calendar cal = Calendar.getInstance();
            cal.set(Calendar.YEAR, Integer.parseInt(a[0]));
            cal.set(Calendar.MONTH, Integer.parseInt(a[1]) - 1);
            cal.set(Calendar.DATE, Integer.parseInt(a[2]));

            int day = cal.get(Calendar.DAY_OF_WEEK);
            String day1 = "";

            if (day == 1)
            {
                day1 = "SUNDAY";
            } else if (day == 2)
            {
                day1 = "MONDAY";
            } else if (day == 3)
            {
                day1 = "TUESDAY";
            } else if (day == 4)
            {
                day1 = "WEDNESDAY";
            } else if (day == 5)
            {
                day1 = "THURSDAY";
            } else if (day == 6)
            {
                day1 = "FRIDAY";
            } else if (day == 7)
            {
                day1 = "SATURDAY";
            }

            Statement stmt2 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            System.out.println("Statement Created");
            ResultSet rs = stmt2.executeQuery("select * from doctors_info2 where doctor_id=" + Doctorid + " and " + day1 + "_working='1'");
            System.out.println("ResultSet Created\n\n");

            if (!rs.next())
            {
        %>
        <label style="font-size: 20px;"> Doctor is not working on this day..!!!! </label>
        <%
                } else
                {%>
        <label>Select slot</label>
        <select name="SlotTime" >
            <option disabled>--Morning Slot Time--</option>
            <%
                Statement stmt3 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                        ResultSet.CONCUR_UPDATABLE);
                System.out.println("Statement Created");
                ResultSet rs2 = stmt3.executeQuery("select * from doctors_info2 where doctor_id= '" + Doctorid + "'");
                System.out.println("ResultSet Created\n\n");

                if (rs2.next())
                {

                    int morningstarttime = rs2.getInt("morning_start_time");
                    int morningendtime = rs2.getInt("morning_end_time");
                    int eveningstarttime = rs2.getInt("evening_start_time");
                    int eveningendtime = rs2.getInt("evening_end_time");

                    Calendar cl1 = Calendar.getInstance();
                    cl1.set(Calendar.HOUR_OF_DAY, morningstarttime);
                    cl1.set(Calendar.MINUTE, 0);

                    Calendar cl2 = Calendar.getInstance();
                    cl2.set(Calendar.HOUR_OF_DAY, morningendtime);

                    while (cl1.compareTo(cl2) <= 0)
                    {

                        int hh = cl1.get(Calendar.HOUR_OF_DAY);
                        int mm = cl1.get(Calendar.MINUTE);
                        cl1.add(Calendar.MINUTE, 30);

                        int hh2 = cl1.get(Calendar.HOUR_OF_DAY);
                        int mm2 = cl1.get(Calendar.MINUTE);

            %>

            <option><%=hh%>:<%=mm%> - <%=hh2%>:<%=mm2%></option>

            <%   }
            %>



            <option disabled>--Evening Slot Time--</option>

            <%
                Calendar cl3 = Calendar.getInstance();
                cl3.set(Calendar.HOUR_OF_DAY, eveningstarttime);
                cl3.set(Calendar.MINUTE, 0);

                Calendar cl4 = Calendar.getInstance();
                cl4.set(Calendar.HOUR_OF_DAY, eveningendtime);

                while (cl3.compareTo(cl4) <= 0)
                {

                    int hh = cl3.get(Calendar.HOUR_OF_DAY);
                    int mm = cl3.get(Calendar.MINUTE);
                    cl3.add(Calendar.MINUTE, 30);

                    int hh2 = cl3.get(Calendar.HOUR_OF_DAY);
                    int mm2 = cl3.get(Calendar.MINUTE);

            %>

            <option><%=hh%>:<%=mm%> - <%=hh2%>:<%=mm2%></option>

            <%
                }
            %>
        </select>
        <%     }
            }

        %>

    </body>
</html>
