<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
     <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
                <title>Booking Slot Time</title>
    </head>
    <body>
        <div class="jumbotron">
    <center>   <h1>Booking Slot Time </h1> </center>
        </div>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver Loading done");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
            System.out.println("Connection Created");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
            ResultSet.CONCUR_UPDATABLE);
            System.out.println("Statement Created");
            ResultSet rs = stmt.executeQuery("select * from doctors_info2 where status='Approve'");
            System.out.println("ResultSet Created\n\n");
                   
                if(rs.next())
                {
                    int morningstarttime = rs.getInt("morning_start_time");
                    int morningendtime = rs.getInt("morning_end_time");
                    int eveningstarttime = rs.getInt("evening_start_time");
                    int eveningendtime = rs.getInt("evening_end_time");
                    
                    int morningslot= (morningendtime-morningstarttime)*2;
                    int eveningslot= (eveningendtime-eveningstarttime)*2;

          %>          
          <div class="container">
              <div class="jumbotron">
                  <%
                       out.println("<h1>"+"Morning Time Slot"+"</h1>"+"<br>");
%>
              </div>            
              <%
                  Calendar cl1=Calendar.getInstance();
                            cl1.set(Calendar.HOUR_OF_DAY, morningstarttime);
                            cl1.set(Calendar.MINUTE, 0);
                            
                            
                            Calendar cl2 = Calendar.getInstance();
                            cl2.set(Calendar.HOUR_OF_DAY, morningendtime);
                            
                            while(cl1.compareTo(cl2)<=0)
                            {
                           
                            out.println(cl1.get(Calendar.HOUR_OF_DAY)+":"+cl1.get(Calendar.MINUTE)+"<br>");
                             cl1.add(Calendar.MINUTE, 30);
                            }
              %>            
              <div class="jumbotron">
          <%
            out.println("<h1>"+"Evening Time Slot"+"</h1>"+"<br>");
            %>               
            </div>   
            <%
                            Calendar cl3=Calendar.getInstance();
                            cl3.set(Calendar.HOUR_OF_DAY, eveningstarttime);
                            cl3.set(Calendar.MINUTE, 0);
                            
                            
                            Calendar cl4 = Calendar.getInstance();
                            cl4.set(Calendar.HOUR_OF_DAY, eveningendtime);
                            
                            while(cl3.compareTo(cl4)<=0)
                            {
                           
                            out.println(cl3.get(Calendar.HOUR_OF_DAY)+":"+cl3.get(Calendar.MINUTE)+"<br>");
                             cl3.add(Calendar.MINUTE, 30);
                            }
                            
                            
                            
                }
       %> 
          </div>
    </body>
</html>
