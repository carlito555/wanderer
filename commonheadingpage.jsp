<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="jquery-1.12.2.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
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

        xmlhttp = new XMLHttpRequest();
        function history()
        {
            xmlhttp.onreadystatechange = history2;
            xmlhttp.open("GET", "viewbookinghistory.jsp", true);
            xmlhttp.send();
        }
        function history2()
        {
            if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
            {
                window.location.reload();
            }
        }
    </script>

    <nav class="navbar navbar-inverse">
        <%
            //receiveing cookie
            Cookie c[] = request.getCookies();
            int flag = 0;
            int i;
            String value = "";

            if (c != null)
            {
                for (i = 0; i < c.length; i++)
                {
                    if (c[i].getName().equals("city"))
                    {
                        flag = 1;
                        break;
                    }
                }

                if (flag == 1)
                {
                    value = c[i].getValue();

        %>      
        <h1>     <label class="navbar navbar-brand">City is : <%=value%> </label>  </h1>



        <%
        } else
        {
        %>
        <h1>
            <label class="navbar navbar-brand"> Particular City is not Found </label>
        </h1>
        <%
            }
        } else
        {
        %>
        <label class="navbar navbar-brand">Cities not found </label>

        <%  }
        %>     
        <br>


        <div  class="container-fluid" style="border: solid 4x blue;">

            <label style="font-size: 20px" class="nav navbar-brand navbar-right">Select City</label>

            <select  name="city" id="s1" class=" form-group-sm nav navbar-nav navbar-right">

                <option>  ------------  </option>
                <option value="Amritsar">Amritsar</option>
                <option value="Jalandhar">Jalandhar</option>
                <option value="Chandigarh">Chandigarh</option>
                <option value="Delhi">Delhi</option>
                <option value="Ludhiana">Ludhiana</option>
                <option value="Patiala">Patiala</option>

            </select>
            <input type="button" value="Change" id="bt1" onclick="go1()" class="btn btn-primary nav navbar-nav navbar-right"/>

            <a href="viewbookinghistory.jsp"  class=" btn btn-primary nav navbar-nav" >View Booking History</a>

            
    <form  action="searchdoctor.jsp?DoctorName=+DoctorName  class="navbar-form navbar-left" role="search">
        <div class="form-group">
            <input type="text" style="column-width: 600px" class="form-control" placeholder="Search" name="DoctorName">
        </div>
        <button type="submit" class="btn btn-default">Search</button>
    </form>
         
            <ul class="nav navbar-nav navbar-right">
            <li><a href="userlogout.jsp?username=+username"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
            </ul>
            
        </div>
        
        
        
    </nav>
</html>