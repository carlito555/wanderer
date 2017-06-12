<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Save Rating</title>
    </head>
    <body>
         <%
            String comments = request.getParameter("comments");
            int Doctorid = Integer.parseInt(request.getParameter("Doctorid"));
            String Email = (String) session.getAttribute("email");
            int RatingValue = Integer.parseInt(request.getParameter("rating"));

            
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver Loading done");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
            System.out.println("Connection Created");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
            ResultSet.CONCUR_UPDATABLE);
            System.out.println("Statement Created");
            ResultSet rs = stmt.executeQuery("select * from rating");
            System.out.println("ResultSet Created\n\n");
        
         
            rs.moveToInsertRow();
            
               
                rs.updateInt("Doctorid", Doctorid);
                rs.updateInt("RatingValue", RatingValue);
                rs.updateString("RatedByUser", Email);
                rs.updateString("Comments", comments);
                rs.insertRow();

//             response.sendRedirect("viewrating.jsp");
        %>
        
        <label>data send</label>
    </body>
</html>
