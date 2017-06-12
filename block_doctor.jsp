 <%@page import="java.sql.*"%>

<%
            int Doctorid = Integer.parseInt(request.getParameter("Doctorid"));
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver Loading done");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
            System.out.println("Connection Created");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            System.out.println("Statement Created");
            ResultSet rs = stmt.executeQuery("select * from doctors_info2 where doctor_id="+Doctorid);
            System.out.println("ResultSet Created\n\n");
            
          if(rs.next())
          {
              String mobileno=rs.getString("mobileNo");
              rs.updateString("status", "pending");
              rs.updateRow();
              vmm.SMSSender obj = new vmm.SMSSender(mobileno + "", "you have been blocked", "text");
              Thread t = new Thread(obj);
              t.start();
              
          }
          response.sendRedirect("View_Active_Pending_Doctors.jsp");
%>



</body>
</html>