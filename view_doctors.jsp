<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Doctor's Info</title>
       
    </head>
    <body>
        <%@include file="public_header.jsp" %>
        <div class="container">
        <%
            String message = request.getParameter("msg");
            if(message!=null)
            {
                %>
                <label style="color: green; font-style: italic;"><%=message%></label> 
                <%
            }
            %>
        
        <table border="1" cellpadding="10">
            <tr>
                <th>Icon</th>
                <th>Category Name</th>
                <th>Description</th>
                <th colspan="2">Operations</th>
            </tr>
            <%
               try
        {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver Loading done");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
            System.out.println("Connection Created");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            System.out.println("Statement Created");
            ResultSet rs = stmt.executeQuery("select * from doctors_info");
            System.out.println("ResultSet Created\n\n");
            
            while (rs.next())
            {
                String icon = rs.getString("icon");
                String cat_name = rs.getString("cat_name");
                
                String Description = rs.getString("Description");
                %>
             <tr>
               <td><img src="<%=icon%>" width="100" height="100"/></td>
               <td><%=cat_name%></td>
               <td><%=Description%></td>
                    
                    
               <td><a href="edit_main_category.jsp?cat_name=<%=cat_name%>">Edit</a></td>
                    
               <td><a href="delete_main_category.jsp?cat_name=<%=cat_name%>" onclick="if(!confirm('Are you sure you want to delete'))
                {
                 return false;
                }">Delete</a></td>
             </tr>
           <%
           }
        }
        catch (Exception e)
        {
        } 
            %>
        </table>
    </div>
            <%@include file="footer.html" %>
    </body>
</html>
