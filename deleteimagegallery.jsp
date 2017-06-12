 
<%@page import="java.sql.*"%>

<%
               int pid = Integer.parseInt(request.getParameter("pid"));
                Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driver Loading Done");

                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
                System.out.println("Connection Created");

                Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                System.out.println("Statement Created");

                ResultSet rs = stmt.executeQuery("Select * from gallery where photo_id=" + pid);
                System.out.println("Result Set Created");

                while (rs.next())
                {   
                    rs.getInt("photo_id");
                    rs.deleteRow();
                }
                   
             response.sendRedirect("managegallery.jsp");
            %>
            
            
            