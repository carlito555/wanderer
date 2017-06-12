
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>

        <title>Edit Doctor Information</title>
    </head>
    <body>
        <%@include file="public_header.jsp" %>
        <%
            int did = Integer.parseInt(session.getAttribute("did").toString());
            Class.forName("com.mysql.jdbc.Driver");
               Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","system");
    System.out.println("Connection created");
    
    Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
    System.out.println("Statement created");
    
    ResultSet rs=stmt.executeQuery("Select * from doctors_info2 where doctor_id='"+did+"'");
    System.out.println("Result Set Created");
    if(rs.next())
    {
        String dname = rs.getString("Doctor_name");
        String qual = rs.getString("Qualification");
        String exp = rs.getString("Experience");
        String address = rs.getString("Address");
        long mobile = rs.getLong("MobileNo");
        int fees = rs.getInt("Consultation_fees");
        int sunday = rs.getInt("sunday_working");
        int monday = rs.getInt("monday_working");
        int tuesday = rs.getInt("tuesday_working");
        int wednesday = rs.getInt("wednesday_working");
        int thursday = rs.getInt("thursday_working");
        int friday = rs.getInt("friday_working");
        int saturday = rs.getInt("saturday_working");
            %>
        <div class="container">
            <form action="edit_doctor_info2.jsp" method="get">
            
           
            
                 <center>  <h2>Edit Doctor Information</h2> </center>
           
                   <div class="form-group">
                    <label>Doctor Name</label>
                    <input type="text" class="form-control" name="name" value="<%=dname%>"/><br>
                    </div>
            
                    <div class="form-group">
                    <label>MobileNo:</label>
                    <input type="text" class="form-control" name="mobile" value="<%=mobile%>"/><br>
                    </div>
           
                   <div class="form-group">
                    <label>Address</label>
                    <input type="text" class="form-control" name="address" value="<%=address%>"/><br>
                    </div>
           
                  <div class="form-group">
                    <label>Consultation Fees</label>
                    <input type="text" class="form-control" name="fees" value="<%=fees%>"/><br>
                    </div>
             <div class="form-group">
                    <label>Qualification</label>
                    <input type="text" class="form-control" name="qualification" value="<%=qual%>"/><br>
                    </div>
             <div class="form-group">
                    <label>Experience</label>
                    <input type="text" class="form-control" name="experience" value="<%=exp%>"/><br>
                    </div>
           
                  <div class="form-group">
                    <label>Working Days</label>
                    <input type="checkbox" value="Monday" name="m"/>Monday
                            <input type="checkbox" value="Tuesday" name="t" />Tuesday
                            <input type="checkbox" value="Wednesday" name="w" />Wednesday
                            <input type="checkbox" value="Thursday" name="th"/>Thursday
                            <input type="checkbox" value="Friday" name="f" />Friday
                            <input type="checkbox" value="Saturday" name="sat"/>Saturday
                            <input type="checkbox" value="Sunday" name="sun" />Sunday
                    </div>       
           
            <input type="submit" class="btn btn-success" style="background-color: #00598e;border: 2px solid #e7e7e7" value="Save"/>
               
            <%
                }
%>
               
           
            
            
            
            
            
        
        
        
    </form>  
        </div>
<%@include file="footer.html" %>
    </body>
</html>
