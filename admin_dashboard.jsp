<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard</title>
    </head>
    <body>
        <%@include file="public_header.jsp" %>
        <div class="container">
        
        <h2>  Welcome <br>  Login Successfully..!!</h2>
        <form>
            <li> <a href="view_doctors.jsp" style="background-color: #00598e;padding: 15px 10px;border: 2px solid #e7e7e7;font-size: 125% " class="btn  btn-success">Manage Main Categories</a></li><br>
            <li>   <a href="sub_category1.jsp" style="background-color: #00598e;padding: 15px 10px;border: 2px solid #e7e7e7;font-size: 125% " class="btn  btn-success">Manage Sub Categories</a></li><br>
            <li>   <a href="doctors_info.jsp" style="background-color: #00598e;padding: 15px 10px;border: 2px solid #e7e7e7;font-size: 125% " class="btn  btn-success">Manage Doctors</a></li>
            
        </form>
      
        </div>
         <%@include file='footer.html' %>
    </body>
</html>