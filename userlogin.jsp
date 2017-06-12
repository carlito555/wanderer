<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-theme.css" rel="stylesheet" type="text/css"/>
        <title>User Login</title>
    </head>
    <script>
        var xmlhttp;
        function fetch()
        {
            var uname = document.getElementById("un").value;
            xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = fetch2;
            xmlhttp.open("GET", "fetch_user_detail.jsp?uname=" + uname, true);
            xmlhttp.send();
        }

        function fetch2()
        {
            if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
            {
                var res = xmlhttp.responseText;
                document.getElementById("d1").innerHTML = res;

                if (res.indexOf("Invalid") == -1)
                {
                    document.getElementById("bt1").style.display = "none";
                }
            }
        }


        function verify1()
        {
            var otp = document.getElementById("otp").value;

            var uname = document.getElementById("un").value;


            var xml = new XMLHttpRequest();
            xml.onreadystatechange = function ()
            {

                if (xml.readyState == 4 && xml.status == 200)
                {
                    var res = xml.responseText.trim();

                    if (res == "invalid")
                    {
                        alert('invalid otp');
                    } else
                    {
                        document.getElementById("d1").innerHTML = xml.responseText;
                    }
                }

            };
            xml.open("get", "verify_otp.jsp?otp=" + otp + "&uname=" + uname, true);
            xml.send();

        }


    </script>


    <body>
        <%@include file="public_header.jsp" %>
        <div class="container">

            <center><h3>User Login</h3> </center>

            <div class="row">
                <div class="col-sm-6 col-sm-offset-3">
                    <form action="userlogin2.jsp" method="POST">

                        <div class="form-group input-group">
                            <label>Username</label>
                            <span class="input-group-addon">
                                <i class="glyphicon glyphicon-user">
                                </i>
                            </span>   
                            <input type="text"   id="username" name="uname" class="form-control" placeholder="username" autofocus="" required/>
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
                        <center> <input type="submit"  value="Login" style="background-color: #00598e;border: 2px solid #e7e7e7" class="btn btn-success"/> </center>

                        <p class="help-block">
                            <a class="pull-right text-muted" href="#" id="olvidado"><small>Forgot your password?</small></a>
                        </p>
                    </form>
                </div>
            </div> 
        </div>

        <%@include file="footer.html" %>
    </body>
</html>
