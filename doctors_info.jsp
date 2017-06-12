<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Doctors Sign Up</title>

        <script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBYeyVAf4D2xq1NPskOIUEsbISxGJbGwy8&sensor=false&libraries=places&v=3.exp"></script>        
        <script>
            var lat1, lng1;
            function initialize()
            {

                var markers = [];

                var map = new google.maps.Map(document.getElementById('map1'),
                        {
                            mapTypeId: google.maps.MapTypeId.ROADMAP,
                            zoom: 15
                        });

                var defaultBounds = new google.maps.LatLngBounds(
                        new google.maps.LatLng(-33.8902, 151.1759),
                        new google.maps.LatLng(-33.8474, 151.2631));
                map.fitBounds(defaultBounds);

                // Create the search box and link it to the UI element.
                var input = /** @type {HTMLInputElement} */(
                        document.getElementById('map_location'));


                var searchBox = new google.maps.places.SearchBox(
                        /** @type {HTMLInputElement} */(input));

                //[START region_getplaces]
                // Listen for the event fired when the user selects an item from the
                // pick list. Retrieve the matching places for that item.
                google.maps.event.addListener(searchBox, 'places_changed', function () {
                    var places = searchBox.getPlaces();

                    for (var i = 0, marker; marker = markers[i]; i++)
                    {
                        marker.setMap(null);
                    }

                    // For each place, get the icon, place name, and location.
                    markers = [];
                    var bounds = new google.maps.LatLngBounds();
                    for (var i = 0, place; place = places[i]; i++)
                    {
                        var image =
                                {
                                    url: place.icon,
                                    size: new google.maps.Size(71, 71),
                                    origin: new google.maps.Point(0, 0),
                                    anchor: new google.maps.Point(17, 34),
                                    scaledSize: new google.maps.Size(50, 50)
                                };

                        // Create a marker for each place.
                        var marker = new google.maps.Marker({
                            map: map,
                            icon: image,
                            title: place.name,
                            position: place.geometry.location
                        });

                        markers.push(marker);

                        var mylati = place.geometry.location.lat();
                        var mylnongi = place.geometry.location.lng();

                        document.getElementById("mylati").value = mylati;
                        document.getElementById("mylongi").value = mylnongi;

//                        alert('Lat is:: ' + place.geometry.location.lat() + ' Long is:: ' + place.geometry.location.lng());
                        bounds.extend(place.geometry.location);
                        lat1 = place.geometry.location.lat();
                        lng1 = place.geometry.location.lng();
                    }

                    map.fitBounds(bounds);

                    var defaultBounds1 = new google.maps.LatLngBounds(
                            new google.maps.LatLng(lat1 - 0.5, lng1 - 0.5),
                            new google.maps.LatLng(lat1 + 0.5, lng1 + 0.5));
                    map.fitBounds(defaultBounds1);
                });

                // [END region_getplaces]

                // Bias theaq1   SearchBox results towards places that are within the bounds of the
                // current map's viewport.
            }

        </script>

        <script>

            var xmlhttp;
            function go()
            {
                var category = document.getElementById("s1").value;

                xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = go4;
                xmlhttp.open("GET", "get_sub_category.jsp?category=" + category, true);
                xmlhttp.send();
            }

            function go4()
            {
                if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
                {
                    document.getElementById("s2").innerHTML = xmlhttp.responseText;
                }
            }


            var xmlhttp;
            function go1()
            {
                var category = document.getElementById("s1").value;

                xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = go2;
                xmlhttp.open("GET", "get_sub_category.jsp?category=" + category, true);
                xmlhttp.send();
            }

            function go2()
            {
                if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
                {
                    document.getElementById("s2").innerHTML = xmlhttp.responseText;
                }
            }
            
    </script>
    
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
        else {
            alert("Passwords Match!!!");
        }
    }
</script>

    </head>
    <body onload="initialize()">
        <%@include file="public_header.jsp" %>
          <div class="container" >
        <form action="AddDoctorServlet" method="post" enctype="multipart/form-data">
          
           
                <center>  <h2>Add Doctors Information</h2></center>

            


            <div class="form-group">
                <label>Doctor Name</label>
                <input type="text" class="form-control" name="dname" required/><br>
            </div>

            <div class="form-group">
                <label>Mobile No</label>
                <input type="text" class="form-control" name="mobile" required/><br>
            </div>
             <div class="form-group">
                <label>City</label>
                <select name="city">
                    <option value="Amritsar">Amritsar</option>
                    <option value="Jalandhar">Jalandhar</option>
                    <option value="Chandigarh">Chandigarh</option>
                    <option value="Delhi">Delhi</option>
                    <option value="Ludhiana">Ludhiana</option>
                    <option value="Patiala">Patiala</option>
                </select>
            </div>

            <div class="form-group">
                <label>Qualification</label>
                <input type="text" class="form-control" name="qualification" required/><br>
            </div>

            <div class="form-group">
                <label>Experience</label>
                <input type="text" class="form-control" name="experience" required/><br>
            </div>

            <div class="form-group">
                <label>Profile Photo</label>
                <input type="file" name="profilepic" /><br>
            </div>
            <div class="form-group">
                <label>Morning-Start-Time</label>
                <input type="text" name="morningstarttime"  required/><br>
            </div>
            <div class="form-group">
                <label>Morning-End-Time</label>
                <input type="text" name="morningendtime" required/><br>
            </div>
            <div class="form-group">
                <label>Evening-Start-Time</label>
                <input type="text" name="eveningstarttime" required/><br>
            </div>
            <div class="form-group">
                <label>Evening-End-Time</label>
                <input type="text" name="eveningendtime" required/><br>
            </div>

            <%
                String cat_name = request.getParameter("cat_name");
                Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driver Loading done");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
                System.out.println("Connection Created");
                Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                        ResultSet.CONCUR_UPDATABLE);
                System.out.println("Statement Created");
                ResultSet rs = stmt.executeQuery("select cat_name from doctors_info");
                System.out.println("ResultSet Created\n\n");

            %>   


            <div class="form-group">
                <label>Category</label>
                <select id="s1" onchange="go1()" name="category">
                    <option>--Select----</option>
                    <%                    while (rs.next())
                        {
                    %>
                    <option><%=rs.getString(1)%></option>
                    <%
                        }
                    %>
                </select>
            </div>

            <div class="form-group">
                <label>Sub Category</label>
                <select id="s2" name="subcategory">

                </select> 

            </div>
            <div class="form-group">
                <label>Address</label>
                <input type="text"  style="width: 300px;" id="map_location" name="address" required/>
            </div>

            <div id="map1" style="width: 300px; height: 200px;"></div>
            <div class="form-group">
                <input type="text"   readonly id="mylati" required placeholder="Latitude" name="latitude"/><br>
                <input type="text"  id="mylongi" readonly  required  placeholder="Longitude" name="longitude"/>
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

            <div class="form-group">
                <label>Description</label>
                <textarea class="form-control" name="description" required></textarea>

            </div>

            <div class="form-group">
                <label>Consultation Fees</label>
                <input type="text" class="form-control" name="fees" required/>

            </div>

            <div class="form-group">
                <label>Services</label>
                <input type="text" class="form-control" name="services" required/>

            </div>
            <br><br>
            <div>
                <label class="btn btn-primary">Password</label>
                <input type="password" name="password" id="p" /> 
            </div>
            <br><br>

            <div>
                <label class=" btn btn-primary">Confirm Password</label>
                <input type="password" name="confirm_password" id="cp"/> 
            </div><br><br>
            <div>
                <input type="submit"  onclick="return myFunction()" id="submit" value="ADD" class=" btn btn-primary"/> 
            </div>




        </form>
          </div>
                    <%@include file='footer.html' %>
    </body>
</html>
