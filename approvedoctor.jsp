 <%@page import="java.sql.*"%>
<%
            int did = Integer.parseInt(request.getParameter("did"));
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver Loading done");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
            System.out.println("Connection Created");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            System.out.println("Statement Created");
            ResultSet rs = stmt.executeQuery("select * from doctors_info2 where doctor_id='"+did+"'");
            System.out.println("ResultSet Created\n\n");
            
          if(rs.next())
          {
              rs.updateString("status", "Approve");
              rs.updateRow();
          }
          response.sendRedirect("View_Active_Pending_Doctors.jsp");
%>


