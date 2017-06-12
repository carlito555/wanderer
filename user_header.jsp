<%@include file='header_files.html' %>
<style>
    #city_select
    {
        height: 7%;
    }
    #city_select a
    {
        padding: 7px 12px !important;
    }
    .navbar-default .navbar-nav > li > a:hover, .navbar-default .navbar-nav > li > a:focus .navbar-default .navbar-nav > li > a >select >option{
        color:gray !important;
    }
</style>

<script>
    var xmlhttp;
    function go1()
    {
        var city = document.getElementById("s1").value;
        xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = go2;
        xmlhttp.open("GET", "sendcookie_city.jsp?city=" + city, true);
        xmlhttp.send();
    }

    function go2()
    {
        if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
        {
            window.location.reload();
        }
    }


</script>   

<!--start-header-->
<div class="header">
    <!--start-container-->
    <div class="container">
        <!--start-top-header-->
        <div class="main-header">

            <div class="clearfix"> </div>
            <div class="top-header">
                <div class="logo">
                    <a href="index.html"><img src="images/logo2.png" title="logo" /></a>
                </div>
                <div class="top-header-right">
                    <ul class="support">
                        <li><span><i class="tele-in"> </i>+91 9780945733</span></li>
                        <li><a href="mailto:info@example.com"><i> </i>Medicus@gmail.com</a></li>
                    </ul>
                    <div class="top-header-contact-account">

                        <div class="social">
                            <ul>
                                <li><a href="#"><i class="facebook"> </i></a></li>
                                <li><a href="#"><i class="twitter"> </i></a></li>
                                <li><a href="#"><i class="dribble"> </i></a></li>	
                                <li><a href="#"><i class="linkdin"> </i></a></li>	
                                <li><a href="#"><i class="google"> </i></a></li>										
                            </ul>
                        </div>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="clearfix"> </div>
            </div>
            <!--End-top-header-->
            <!--start-main-header-->
            <div class="navigation">
                <div class="container">
                    <nav class="navbar navbar-default">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"> </span>
                                <span class="icon-bar"> </span>
                                <span class="icon-bar"> </span>
                            </button>
                        </div>





                        <div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav" style="padding: 0px;height:51px;">
                                <li class="active"><a href="index.jsp">Home <span class="sr-only">(current)</span></a></li>
                                <li id="city_select" ><a> Select City <select name="city" id="s1">
                                            <option>  </option>
                                            <option value="Amritsar">Amritsar</option>
                                            <option value="Jalandhar">Jalandhar</option>
                                            <option value="Chandigarh">Chandigarh</option>
                                            <option value="Delhi">Delhi</option>
                                            <option value="Ludhiana">Ludhiana</option>
                                            <option value="Patiala">Patiala</option>

                                        </select>
                                        <button value="Go" id="bt1" onclick="go1()" style="background-color: #00598e;border: 2px solid #e7e7e7" class="btn btn-success">Go</button>
                                    </a></li>				
                                <li><a href="#">
                                        <%
                                            //receiveing cookie
                                            Cookie c[] = request.getCookies();
                                            int flag = 0;
                                            int i;
                                            String value = "";

                                            if (c != null) {
                                                for (i = 0; i < c.length; i++) {
                                                    if (c[i].getName().equals("city")) {
                                                        flag = 1;
                                                        break;
                                                    }
                                                }

                                                if (flag == 1) {
                                                    value = c[i].getValue();

                                        %>     City is : <%=value%>
                                        <%
                                        } else {
                                        %>City is not Found
                                        <%
                                            }
                                        } else {
                                        %>
                                        Cities not found

                                        <%  }
                                        %>     
                                    </a>
                                </li>
                                <li><a href="userlogout.jsp?username=+username"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
                            </ul>
                            <div class="search">
                                <form action="search.jsp?DoctorName=+DoctorName">
                                    <input type="search" name="DoctorName" value="Search Doctor" onfocus="this.value = '';" onblur="if (this.value == '') {
                                                this.value = 'Search';
                                            }" required="">
                                    <input type="submit" value=" ">
                                </form>
                            </div>
                            <div class="clearfix"> </div>
                        </div><!-- /.navbar-collapse -->
                    </nav>
                </div>
            </div>
            <div class="clearfix"> </div>
        </div>
        <!-- script-for-menu -->
        <script>
            $("span.menu").click(function () {
                $(".top-nav ul").slideToggle("slow", function () {
                });
            });
        </script>
        <!-- script-for-menu -->	 	
    </div>
    <!----End-main-header----->
</div>
<div class="clearfix"> </div>
<!---End-header--->
