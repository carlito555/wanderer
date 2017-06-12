<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Doctor</title>
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
            ResultSet rs = stmt.executeQuery("select * from doctors_info where cat_name='"+cat_name+"'");
            System.out.println("ResultSet Created\n\n");

            if(rs.next())
            {
                String icon = rs.getString("icon");
             
                String Description=rs.getString("Description");
            
                %>
                <h1>Edit Record</h1>
        <form action="edit_main_category_new.jsp">
            <table>
                <tr>
                    <td>cat_name</td>
                    <td><input type="text" value="<%=cat_name%>" readonly name="cat_name"/></td>
                </tr>
                <tr>
                    
                    <td>Description</td>
                    <td><input type="text" value="<%=Description%>" name="Description" required/></td>
                </tr>
                <tr>
                    <td>Icon</td>
                    <td> <input type="file" value="<%=icon%>" name="Icon" required/> </td>
                </tr>
                <tr>
                    <td></td><td><input type="submit" style="background-color: #00598e;border: 2px solid #e7e7e7" value="Save"/></td>
                </tr>
            </table>
        </form>
                
                <%
            }
            else
            {
                response.sendRedirect("view_doctors.jsp?msg=Record not found");
            }



            %>
        </div>
            <%@include file='footer.html' %>
    </body>
</html>
