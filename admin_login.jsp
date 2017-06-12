<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/mycss.css" rel="stylesheet" type="text/css"/>
        <title>Login Page</title>

        <script>
            function go()
            
            {
                var username = document.getElementById("username").value;
                window.location.href = "recover_admin_password.jsp?username=" + username;
            }
        </script>
    </head>
    <body>
        <%@include file="public_header.jsp" %>
        <div class="container">

           
                <center>
                    <h2>Admin Login</h2> 
                </center>
          
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3">
                    <form action="check_admin_login.jsp" method="POST">

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
                        <br>

                        <center><input type="button" style="background-color: #00598e;border: 2px solid #e7e7e7"  onclick="go()" value="Recover Admin Password" class="btn btn-success"/></center>
                    </form>
                </div>
            </div> 
            </div>
        
        <%
        String msg = request.getParameter("msg");
        if(msg!=null)
        {
            %>
    <center>
            <label style="color: red"><%= msg %></label>
    </center>
            <%
            
        }
        
        
        
        %>
        
        
    <%@include file='footer.html' %>
    </body>
</html>



