<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String name = request.getParameter("dname");
    String qual = request.getParameter("qualification");
    String exp = request.getParameter("experience");
    String category = request.getParameter("category");
    String subcat = request.getParameter("subcategory");
    String address = request.getParameter("address");
    String des = request.getParameter("description");
    String constfee = request.getParameter("fees");
    String mon = request.getParameter("m");
    String tues = request.getParameter("t");
    String wed = request.getParameter("w");
    String thurs = request.getParameter("th");
    String fri = request.getParameter("f");
    String sat = request.getParameter("sat");
    String sun = request.getParameter("sun");
    String city = request.getParameter("city");
    String pic = request.getParameter("profilepic");

    String service = request.getParameter("services");
    String lat = request.getParameter("latitude");
    String longt = request.getParameter("longitude");
    Long mobile = Long.parseLong(request.getParameter("mobile"));
    String ps = request.getParameter("password");
    String cp = request.getParameter("confirmpassword");


    Class.forName("com.mysql.jdbc.Driver");
    System.out.println("Driver Loading Done");

    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
    System.out.println("Connection Created");

    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    System.out.println("Statement Created");

    ResultSet rs = stmt.executeQuery("Select * from doctors_info2");
    System.out.println("Result Set Created");

    if (rs.next())
    {
%>
<label>This doctor's data already exists..</label>
<%
        rs.moveToInsertRow();
        rs.updateString("Doctor_name", name);
        rs.updateString("Qualification", qual);
        rs.updateString("Experience", exp);
        rs.updateString("Category", category);
        rs.updateString("Sub_category", subcat);
        rs.updateString("Address", address);
        rs.updateString("Description", des);
        rs.updateString("Consultation_fees", constfee);

        rs.updateString("Services", service);
        rs.updateString("latitude", lat);
        rs.updateString("longitude", longt);
        rs.updateLong("mobile", mobile);
        rs.updateString("monday_working", mon);
        rs.updateString("tuesday_working", tues);
        rs.updateString("wednesday_working", wed);

        rs.updateString("thursday_working", thurs);

        rs.updateString("friday_working", fri);

        rs.updateString("saturday_working", sat);

        rs.updateString("sunday_working", sun);
        
        rs.updateString("password",ps);
        
        rs.updateString("confirm_password",cp);

        rs.insertRow();

        response.sendRedirect("admin_dashboard.jsp");
    } else
    {
        response.sendRedirect("doctors_info1.jsp");
    }


%>