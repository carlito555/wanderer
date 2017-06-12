<%@page import="java.sql.*" %>

<%
        
        String icon = request.getParameter("icon");
        String cat_name = request.getParameter("cat_name");
        String Description = request.getParameter("Description");
       
        
        Class.forName("com.mysql.jdbc.Driver");
        System.out.println("Driver Loading done");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
        System.out.println("Connection Created");
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                ResultSet.CONCUR_UPDATABLE);
        System.out.println("Statement Created");
        ResultSet rs = stmt.executeQuery("select * from doctors_info where cat_name = '"+cat_name+"'");
        System.out.println("ResultSet Created\n\n");
        
        if(rs.next())
        {
            rs.updateString("icon",icon);
            rs.updateString("Description",Description);
            rs.updateRow();
            response.sendRedirect("view_doctors.jsp?msg=Record edited successfully");
            
        }
        else
        {
            response.sendRedirect("view_doctors.jsp?msg=Record not found");
        }
        
        



    %>