<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Doctor Dashboard</title>
    </head>
    <body>
        <%@include file='public_header.jsp' %>
        <%
            int did = Integer.parseInt(session.getAttribute("did").toString());
        %>

        <div class="container">

            <center> <h2>  Welcome Doctor <br> </h2></center>

            <form >
                <li class="active"><a href="edit_doctor_info.jsp" class="btn  btn-success" style="background-color: #00598e;padding: 15px 10px;border: 2px solid #e7e7e7;font-size: 125% "  >Edit Doctor's Information</a></li><br>
                <li class="active"> <a href="managegallery.jsp" class="btn  btn-success" style="background-color: #00598e;padding: 15px 10px;border: 2px solid #e7e7e7;font-size: 125%">Manage Gallery</a></li><br>
                <li class="active">  <a href="viewdoctorbookings.jsp?Doctorid=<%= did%>" class="btn btn-success" style="background-color:#00598e;padding: 15px 10px;border: 2px solid #e7e7e7;font-size: 125%">View My Bookings</a></li>

            </form>
        </div> 
        <%@include file='footer.html' %>
    </body>
</html>
