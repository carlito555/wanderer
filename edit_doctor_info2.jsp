<%@page import="java.sql.*"%>


<%
    int did=  Integer.parseInt(session.getAttribute("did").toString());
    long mobile =Long.parseLong(request.getParameter("mobile"));
    String qualification = request.getParameter("qualification");
    String address = request.getParameter("address");
    String fees = request.getParameter("fees");
    String city = request.getParameter("city");
    String mon = request.getParameter("m");
    String tues = request.getParameter("t");
    String wed = request.getParameter("w");
    String thurs = request.getParameter("th");
    String fri = request.getParameter("f");
    String sat = request.getParameter("sat");
    String sun = request.getParameter("sun");

    String exp = request.getParameter("experience");
    


Class.forName("com.mysql.jdbc.Driver");
    System.out.println("Driver Loading Done");
    
    Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","system");
    System.out.println("Connection created");
    
    Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
    System.out.println("Statement created");
    
    ResultSet rs=stmt.executeQuery("Select * from doctors_info2 where doctor_id='"+did+"'");
    System.out.println("Result Set Created");
    if(rs.next())
    {
       rs.updateLong("Mobileno", mobile);
       rs.updateString("Qualification", qualification);
       rs.updateString("Address", address);
       rs.updateString("Experience", exp);
       rs.updateString("city", city);
       rs.updateString("Consultation_fees",fees);

       
       if (mon != null)
            {
                rs.updateInt("monday_working", 1);
            }
            if (tues != null)
            {
                rs.updateInt("tuesday_working", 1);
            }
            if (wed != null)
            {
                rs.updateInt("wednesday_working", 1);
            }
            if (thurs != null)
            {
                rs.updateInt("thursday_working", 1);
            }
            if (fri != null)
            {
                rs.updateInt("friday_working", 1);
            }
            if (sat != null)
            {
                rs.updateInt("saturday_working", 1);
            }
            if (sun != null)
            {
                rs.updateInt("sunday_working", 1);
            }
       rs.updateRow();

    }




%>