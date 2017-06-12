<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>

        <%@include file="public_header.jsp" %>
        <%            String cat_name = request.getParameter("cat_name");
            String sub_category = request.getParameter("Sub_Category_Name");
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver Loading done");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
            System.out.println("Connection Created");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            System.out.println("Statement Created");
            ResultSet rs = stmt.executeQuery("select * from doctors_info2 where Sub_Category='" + sub_category + "'");
            System.out.println("ResultSet Created\n\n");


        %>
        <div class="container ">
            <div class="form-group ">

                <h2>   <label>Doctors Under <%=sub_category%> </label> </h2> <br><br>
                <table  border="1"  class="table-hover" >
                    <th>Doctor id</th><th>Picture</th><th>Doctor Name</th><th>Qualification</th><th>Experience</th>
                        <%
                            while (rs.next()) {
                                int did = rs.getInt("doctor_id");
                                String Sub_Category_Name = rs.getString("Sub_Category");
                                String Profile_Photo = rs.getString("Profile_Photo");
                                String Doctor_Name = rs.getString("Doctor_name");
                                String Qualification = rs.getString("Qualification");
                                String Experience = rs.getString("experience");
                        %>
                    <tr>
                        <td><%=did%></td>
                        <td><img src="<%=Profile_Photo%>"  class="img-responsive" height="150" width="150"/></td>
                        <td><a href="viewsingledoctordetail.jsp?Doctor_Name=<%=Doctor_Name%>&Doctorid=<%=did%>"> <%=Doctor_Name%></a></td>
                        <td><%=Qualification%></td>
                        <td><%=Experience%></td>
                    </tr>
                    <%
                        }
                    %>
                </table>

            </div>
        </div>



        <%@include file='footer.html' %>
    </body>
</html>

