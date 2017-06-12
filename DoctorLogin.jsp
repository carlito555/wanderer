<%@page contentType="text/html" pageEncoding="UTF-8"%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        
        <title>Doctor Login</title>
    </head>
    <body>
        <%@include file='public_header.jsp' %>
        <div class="container">

            <center>  <h2>Doctor Login</h2> </center>

            <div class="row">
                <div class="col-sm-6 col-sm-offset-3">
                    <form action="checkdoctorlogin.jsp" method="POST">

                        <div class="form-group input-group">
                            <label>Username</label>
                            <span class="input-group-addon">
                                <i class="glyphicon glyphicon-user">
                                </i>
                            </span>   
                            <input type="text"   id="username" name="username" class="form-control" placeholder="username" autofocus="" required/>
                            <br>  
                        </div>
                        
                        <br>

                        <div class="form-group input-group ">
                            <label>Password</label>
                            <span class="input-group-addon">
                                <i class="glyphicon glyphicon-lock">
                                </i>
                            </span>

                            <input type="password" name="password" class="form-control" placeholder="password" required/>

                            <br>
                        </div>
                        <br>
                        <center><input type="submit"  value="Login" style="background-color: #00598e;border: 2px solid #e7e7e7" class="btn btn-success"/></center>

                        <p class="help-block">
                            <a class="pull-right text-muted" href="#" id="olvidado"><small>Forgot your password?</small></a>
                        </p>
                    </form>
                </div>
            </div> 
        </div>
        <%
            String msg = request.getParameter("msg");
            if (msg != null) {
        %>
    <center>  
        <label style="color: red"><%= msg%></label>
    </center>
    <%
        }
    %>
    <%@include file='footer.html' %>  
</body>
</html>
