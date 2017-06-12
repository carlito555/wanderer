
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Doctor</title>
    </head>
    <body>
        <%@include file="public_header.jsp" %>
<div class="container">
        <%
            String Doctor_Name = "";
            int Doctorid = 0;
            String Profile_Photo = "";
            String City = "";
            String Address = "";
            String Sub_Category = "";
            String MobileNo = "";
            String Email = "";
            String DoctorName = request.getParameter("DoctorName");
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver Loading done");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
            System.out.println("Connection Created");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            System.out.println("Statement Created");
            ResultSet rs = stmt.executeQuery("select * from doctors_info2 where Doctor_name like '%" + DoctorName + "%'");
            System.out.println("ResultSet Created\n\n");

           while (rs.next())
            {
                Doctor_Name=rs.getString("Doctor_name");
                Doctorid = rs.getInt("doctor_id");
                Profile_Photo = rs.getString("Profile_Photo");
                City = rs.getString("City");
                Address = rs.getString("Address");
                Sub_Category = rs.getString("Sub_Category");
                MobileNo = rs.getString("MobileNo");
                //Email = rs.getString("Email");

        %>

        <table border="1" class="table-hover">
            <th>Doctor-Id</th><th>Doctor-Name</th><th>Profile-Photo</th><th>City</th><th>Address</th><th>Sub-Category-Name</th><th>MobileNo:</th>
                

            <tr>
                <td> <%=Doctorid%> </td> <td><a href="viewsingledoctordetail.jsp?Doctorid=<%=Doctorid%>"> <%=Doctor_Name%></a> </td> <td><img src="<%=Profile_Photo%>" width="100" height="100"/></td><td><%=City%></td><td><%=Address%></td><td><%=Sub_Category%></td><td><%=MobileNo%></td>
            </tr>
        </table>
<%   }
                %>



       
    </div>
                <%@include file="footer.html" %>
    </body>
</html>
