<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>User Signup</title>
         <script>
    function myFunction() {
        var pass1 = document.getElementById("p").value;
        var pass2 = document.getElementById("cp").value;
        if (pass1 != pass2) {
            alert("Passwords Do not match");
            return false;
            //document.getElementById("p").style.borderColor = "#E34234";
            //document.getElementById("cp").style.borderColor = "#E34234";
        }
        return true;
    }
</script>

        
        
        
    </head>
    
    <body>
        <div class="container">
            <div class="jumbotron">
                <center>    <h1>User Signup</h1>  </center>
            </div>
            <div class="row">
                <form action="userservlet" method="get" >
                    <div class="form-group">
                        <label>Username</label>
                        <input type="text" name="username" required/><br><br>
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input type="password" name="password" id="p" required/> <br><br>
                    </div>

                    <div class="form-group">
                        <label>Confirm Password</label>
                        <input type="password" name="confirmpassword" id="cp"  required/><br><br>
                    </div>

                    <div class="form-group">
                        <label>Mobile No:</label>
                        <input type="text" name="mobile" pattern="[0-9]{10}" required/><br><br>
                    </div>

                    <div class="form-group">
                        <label>Email</label>
                        <input type="email" name="email" required/><br><br>
                    </div>
                    <br><br>
                    <input type="submit"  value="Signup"  onclick="return myFunction()" id="signup" class="btn btn-success"/>
                </form>
            </div>
        </div>
    </body>
</html>
