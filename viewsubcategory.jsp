<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>subcategories</title>


    </head>
    <body>
        <%@include file="public_header.jsp" %>
        <div class="container">

        <%
            String cat_name = request.getParameter("cat_name");
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver Loading done");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
            System.out.println("Connection Created");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            System.out.println("Statement Created");
            ResultSet rs = stmt.executeQuery("select Sub_Category_Name from sub_category where Category_Name='" + cat_name + "'");
            System.out.println("ResultSet Created\n\n");
        %>

        
            <div class="form-group" class="col-sm-3">
                <h2>   <label>Sub-Category Under <%=cat_name%> </label> </h2> <br><br>
                <%
                    while (rs.next()) {

                        String Sub_Category_Name = rs.getString("Sub_Category_Name");
                %>

                <li> <a href="viewdoctorincity.jsp?Sub_Category_Name=<%= Sub_Category_Name%>" style="background-color: #00598e;padding: 15px 10px;border: 2px solid #e7e7e7" class="btn btn-success" ><%= Sub_Category_Name%></a></li><br><br>
         
        <%
            }


        %>
           </div>
        </div>
        <%@include file='footer.html' %>
    </body>
</html>
