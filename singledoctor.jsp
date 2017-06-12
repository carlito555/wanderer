<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%
     String  did= request.getParameter("did");

    try
    {
        
           Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver Loading done");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
            System.out.println("Connection Created");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            System.out.println("Statement Created");
            ResultSet rs = stmt.executeQuery("select * from doctors_info2 where doctor_id="+did);
            System.out.println("ResultSet Created\n\n");

            if(rs.next())
            {
       %>
               <table>
                   <tr>
                       <td>Doctor ID</td>
                       <td><%= rs.getInt("doctor_id") %> </td>
                   </tr>
                   
                   <tr>
                       <td> NAME </td>
                       <td><%= rs.getString("Doctor_name")  %> </td>
                   </tr>
                     <tr>
                       <td> Qualification</td>
                       <td><%= rs.getString("Qualification")  %> </td>
                   </tr>
                     <tr>
                       <td> Experience</td>
                       <td><%= rs.getString("Experience")  %> </td>
                   </tr>
                   <tr>
                       <td> </td>
                       <td><img src="<%= rs.getString("profile_photo") %>" class="img-responsive" />   </td>
                   </tr>
                     <tr>
                       <td> Category </td>
                       <td><%= rs.getString("Category")  %> </td>
                   </tr>
                     <tr>
                       <td>Sub_Category </td>
                       <td><%= rs.getString("Sub_Category")  %> </td>
                   </tr>
                   
                   <tr>
                       <td> </td>
                       <td><a href="approvedoctor.jsp?did=<%= did %>" >Approve</a>   </td>
                   </tr>
                   
               </table>
       <%
                
            }
            else
            {
                out.println("Invalid did");
            }
    }
    catch(Exception ex)
    {
       ex.printStackTrace();
    }

%>