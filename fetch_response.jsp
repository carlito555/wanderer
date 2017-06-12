<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fetching Response</title>
    </head>
    <body>
        <%
            String category = request.getParameter("category");
            String subcategory = request.getParameter("subcategory");
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver Loading done");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
            System.out.println("Connection Created");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
            ResultSet.CONCUR_UPDATABLE);
            System.out.println("Statement Created");
            ResultSet rs = stmt.executeQuery("select * from sub_category where Category_name='" + category + "' and Sub_Category_Name='" + subcategory + "'");
            System.out.println("ResultSet Created\n\n");
            if (rs.next())
            {
        %>
        <label>This subcategory already exists  in this category</label>
        <%
        } else
        {
            rs.moveToInsertRow();
            rs.updateString("Category_Name", category);
            rs.updateString("Sub_Category_Name", subcategory);
            rs.insertRow();

        %>
        <label>Inserted succesfully</label>


        <table class="table table-hover">

            <tr>
                <th>S. No</th>
                <th>Subcategory Name</th>
                <th>category Name</th>
                
                
                
            </tr>
        <%
             Statement stmt1 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            System.out.println("Statement Created");
            ResultSet rs1 = stmt1.executeQuery("select * from sub_category");
            System.out.println("ResultSet Created\n\n");
            while(rs1.next())
            {
              %>
              <tr>
                  <td><%= rs1.getString("S.No:") %></td>
                  <td><%= rs1.getString("Sub_Category_Name") %></td>
                  <td><%= rs1.getString("Category_Name") %></td>
                 
                  
                  
              </tr>
              
              <%
            }
            
            %>
            </table>
            <%
            
            }


        %>