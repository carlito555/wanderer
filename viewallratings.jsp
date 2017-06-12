<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

        <%
             int Doctorid = Integer.parseInt(request.getParameter("Doctorid"));
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver Loading done");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
            System.out.println("Connection Created");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            System.out.println("Statement Created");
            ResultSet rs = stmt.executeQuery("select * from rating where Doctorid='" + Doctorid + "' ");
            System.out.println("ResultSet Created\n\n");
                 

              while(rs.next())
              {
                 int RatingValue = (Integer)rs.getInt("RatingValue");
                 String RatedByUser=(String)rs.getString("RatedByUser");
                 String Comments=(String)rs.getString("Comments");
              }
            


            %>
            
            
            
            
            
    </body>
</html>
