<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>

        <h1>VMM Payment Gateway Demo</h1>

        <%

            String PatientName = request.getParameter("PatientName");
            System.out.println(PatientName);
           
            int Doctorid = Integer.parseInt(request.getParameter("Doctorid"));
            int PatientAge = Integer.parseInt(request.getParameter("PatientAge"));
            String Problem = request.getParameter("Problem");
            String AppointmentDate = request.getParameter("AppointmentDate");
            String slottime = request.getParameter("slottime");
            System.out.println(slottime);
            String username = request.getParameter("username");


            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver Loading done");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
            System.out.println("Connection Created");
             Statement stmt1 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            System.out.println("Statement Created");
      
            ResultSet rs1 = stmt1.executeQuery("select * from doctors_info2 where doctor_id="+Doctorid);
           int fees=0;
           if(rs1.next())
           {
               fees = rs1.getInt("Consultation_Fees");
           }
            
            Statement stmt2 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            System.out.println("Statement Created");
      
            ResultSet rs2 = stmt2.executeQuery("select * from user where username='"+username+"'");
            String email="";
            if(rs2.next())
            {
                email = rs2.getString("email");
            }
            
           fees = fees*100;
           
        %>


        <form action="success_app.jsp" method="POST">
            <input type="hidden" value="<%=PatientName%>" name="PatientName"/>
            <input type="hidden" value="<%=PatientAge%>" name="PatientAge"/>
            <input type="hidden" value="<%=Problem%>" name="Problem"/>
            <input type="hidden" value="<%=Doctorid%>" name="Doctorid"/>
            <input type="hidden" value="<%=AppointmentDate%>" name="AppointmentDate"/>
            <input type="hidden" value="<%=slottime%>" name="slottime"/>
            <input type="hidden" value="<%=username%>" name="username"/>
            <input type="hidden" value="<%=fees%>" name="fees"/>
            <input type="hidden" value="<%=email%>" name="email"/>
            
            
            
            <!-- Note that the amount is in paise = 50 INR -->
            <script
                src="https://checkout.razorpay.com/v1/checkout.js"
                data-key="rzp_test_96HeaVmgRvbrfT"
                data-amount="<%=fees%>"
                data-buttontext="Pay with Razorpay"
                data-name="VMM Education"
                data-description="Thank You for purchaing Silver Package."
                data-image="http://vmmeducation.com/images/newlogo.png"
                data-prefill.name="<%=username%>"
                data-prefill.email="<%=email%>"
                data-theme.color="#F3EE54"
            ></script>
            <input type="hidden" value="Hidden Element" name="hidden">
        </form>

    </body>
</html>
