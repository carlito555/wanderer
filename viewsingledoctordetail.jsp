<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>

        <script src="jquery-1.12.2.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>

        <title>Single Doctor Detail</title>
        <script>
//            $(document).ready(function ()
//            { alert("JQUERY READY"); 
//            });

            function go(val)
            {
                alert(val);
                document.getElementById("im7").src = val;
                $("#myModal").modal('show');
                //alert("after");   
            }
            function rate()
            {
                $("#myModal2").modal('show');
                //alert("after");   
            }
            function view()
            {
                $("#myModal3").modal('show');
                //alert("after");   
            }



            var xmlhttp = new XMLHttpRequest();
            function test1()
            {
                var doctor_id = document.getElementById("t1").value;
                //alert(doctor_id);
                var appointment_date = document.getElementById("d1").value;

                //alert(appointment_date);
                xmlhttp.onreadystatechange = test2;
                xmlhttp.open("GET", "slotchecking.jsp?Doctorid=" + doctor_id + "&AppointmentDate=" + appointment_date, true);
                xmlhttp.send();
            }
            function test2()
            {
                alert(xmlhttp.status);
                if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
                {
                    document.getElementById("d3").innerHTML = xmlhttp.responseText;
                    document.getElementById("d1").style.display = "block";

                }
            }

        </script>
        <script type="text/javascript">
            var n = 0;
            function fill(obj)
            {
                var img = obj.src;
                var id = obj.id;
                var val = parseInt(id.substring(id.indexOf("_") + 1));
                var i;
                if (n == 0)
                {
                    i = 1;
                } else
                {
                    i = n + 1;
                }
                for (; i <= 5; i++)
                {
                    if (i <= val)
                    {
                        document.getElementById("rating_" + i).src = "images/filled_star.png";

                    } else
                    {
                        document.getElementById("rating_" + i).src = "images/empty_star.png";
                    }
                }

            }
            function selected(obj)
            {
                var id = obj.id;
                var val = parseInt(id.substring(id.indexOf("_") + 1));
                n = val;

            }
            function unfill(obj)
            {
                var i;
                if (n == 0)
                {
                    i = 1;
                } else
                {
                    i = n + 1;
                }
                for (; i <= 5; i++)
                {
                    document.getElementById("rating_" + i).src = "images/empty_star.png";
                }
            }
            function save()
            {
                var comments = document.getElementById("comments").value;
                var did = document.getElementById("t1").value;
                xmlhttp.onreadystatechange = save2;
                xmlhttp.open("GET", "saverating.jsp?comments=" + comments + "&rating=" + n + "&Doctorid=" + did, true);
                xmlhttp.send();

            }
            function save2()
            {
                alert(xmlhttp.status);
                if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
                {
                    alert("Successfully Rated");
                }
            }
//            function allratings()
//            {
//                //var comments = document.getElementById("comments").value;
//                var did = document.getElementById("t1").value;
//                xmlhttp.onreadystatechange = allratings2;
//                xmlhttp.open("GET", "viewallratings.jsp?Doctorid="+did , true);
//                xmlhttp.send();
//                
//            }
//             function allratings2()
//            {
//                alert(xmlhttp.status);
//                if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
//                {                 
//                 alert("All Ratings Are Shown");
//                }
//            }



        </script>


    </head>
    <body>
        <%@include file="public_header.jsp" %>
        <div class="container">
            <form action="booksuccess.jsp">




                <%
                    String timeStamp = new SimpleDateFormat("dd.MM.yyyy").format(new Date());
                    String Doctor_id = request.getParameter("Doctorid");

                    int Consultation_Fees = 0;
                    //  String sub_category = request.getParameter("Sub_Category_Name");
                    Class.forName("com.mysql.jdbc.Driver");
                    System.out.println("Driver Loading done");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
                    System.out.println("Connection Created");
                    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                            ResultSet.CONCUR_UPDATABLE);
                    System.out.println("Statement Created");
                    ResultSet rs = stmt.executeQuery("select * from doctors_info2 where doctor_id='" + Doctor_id + "'");
                    System.out.println("ResultSet Created\n\n");

                    if (rs.next()) {
                        int did = rs.getInt("doctor_id");
                        String Sub_Category_Name = rs.getString("Sub_Category");
                        String Profile_Photo = rs.getString("Profile_Photo");
                        String DoctorName = rs.getString("Doctor_name");
                        String Qualification = rs.getString("Qualification");
                        String Experience = rs.getString("Experience");
                        String Address = rs.getString("Address");
                        String Description = rs.getString("Description");
                        Consultation_Fees = rs.getInt("Consultation_Fees");
                        String Services = rs.getString("Services");
                        String MobileNo = rs.getString("MobileNo");
                        String City = rs.getString("City");

                        int monday_working = rs.getInt("monday_working");
                        int tuesday_working = rs.getInt("tuesday_working");
                        int wednesday_working = rs.getInt("wednesday_working");
                        int thursday_working = rs.getInt("thursday_working");
                        int friday_working = rs.getInt("friday_working");
                        int saturday_working = rs.getInt("saturday_working");
                        int sunday_working = rs.getInt("sunday_working");
                        int morningstarttime = rs.getInt("morning_start_time");
                        int morningendtime = rs.getInt("morning_end_time");
                        int eveningstarttime = rs.getInt("evening_start_time");
                        int eveningendtime = rs.getInt("evening_end_time");
                %>

                <input type="hidden" name="Doctorid" id="t1" value="<%= did%>" />
                <input type="hidden" name="Fees" value="<%= Consultation_Fees%>" />
                <div class="container">
                    <div class="row">
                        <div class="col-sm-3">

                            <img src="<%=Profile_Photo%>"  width="300" height="100" style="border: solid black 1px" class="img-responsive"/>

                        </div>

                        <div class="col-sm-5">
                            <div class="form-group">
                                <label style="font-size: 25px" ><%=DoctorName%></label> <br>
                                <label style="font-size: 20px; font-family: cursive" > <%=Sub_Category_Name%></label> <br>

                                <label style="font-size: 18px;font-family: cursive">Qualification:  </label><label style="font-size: 15px" > <%=Qualification%></label> <br>

                                <label style="font-size: 18px;font-family: cursive">Experience:  </label><label style="font-size: 15px" > <%=Experience%></label> <br>
                            </div>
                        </div>
                            <div class="col-sm-4" >
                                
                <div class="container">
                    <div class="row" style="padding: 50px" >
                        <label>Average Rating</label>
                        <%
    //            Integer Doctorid = Integer.parseInt(request.getParameter("Doctorid"));
                            Class.forName("com.mysql.jdbc.Driver");
                            System.out.println("Driver Loading done");
                            Connection conn2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
                            System.out.println("Connection Created");
                            Statement stmt2 = conn2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                                    ResultSet.CONCUR_UPDATABLE);
                            System.out.println("Statement Created");
                            ResultSet rs2 = stmt2.executeQuery("select AVG(RatingValue) as R1 from rating  where Doctorid='" + Doctor_id + "' ");
                            System.out.println("ResultSet Created\n\n");

                            if (rs2.next()) {

                                double rating = rs2.getDouble("R1");
                                int r = (int) rating;

                                if (r == rating) {
                                    for (int j = 1; j <= rating; j++) {
                        %>
                        <img src="images/filled_star.png" width="25"  height="25" />

                        <%
                            }

                            for (int j = 1; j <= 5 - rating; j++) {
                        %>    
                        <img src="images/empty_star.png" width="25"  height="25" />
                        <%
                            }

                        } else {
                            for (int j = 1; j <= r; j++) {
                        %>    
                        <img src="images/filled_star.png" width="25"  height="25" />
                        <%
                            }
                        %>

                        <img src="images/half_filled_star.png" width="25"  height="25" />

                        <%
                            for (int j = 1; j <= 4 - r; j++) {
                        %>    
                        <img src="images/empty_star.png" width="25"  height="25" />
                        <%
                                }
                            }

    //                        double rating2 = (double) Math.round(rating);

                        %>

                        <label> <%=rating%> </label>
                        <%}
                        %>
                        <br>
                               
                                    <input type="button" value="Rate Now" style="background-color: #00598e;border: 2px solid #e7e7e7 " onclick="rate()" class="btn btn-success" /> <br>
                            <input type="button" value="View All Ratings" style="background-color: #00598e;border: 2px solid #e7e7e7" onclick="view()" class="btn btn-success" /> 
                               
                    </div>
                </div>
                                
                              
                        </div>

                    </div>
                    <div class="row">
                        <div  class="col-sm-12">
                            <%
                                int did2 = Integer.parseInt(request.getParameter("Doctorid"));
                                Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
                                System.out.println("Connection Created");
                                Statement stmt1 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                                        ResultSet.CONCUR_UPDATABLE);
                                System.out.println("Statement Created");

                                ResultSet rs1 = stmt1.executeQuery("select * from gallery where did='" + did2 + "'");
                                while (rs1.next()) {
                            %>
                            <%
                                int photo_id = rs1.getInt("photo_id");

                            %>
                            <img src="<%=  rs1.getString("photo_path")%>"
                                 style="width: 100px; height: 100px;"
                                 onclick="go(this.src)" />

                            <%
                                }
                            %>
                        </div>
                    </div>

                    <div style="margin: 10px;border: solid 2px black; "class="row">

                        <div style="background-color: #00598e; color: white; padding: 10px;color: white">
                            <label>Basic Details</label>
                        </div>
                        <div style="padding: 10px">
                            <label style="font-size: 15px" >Services: </label><label style="font-size: 15px" >  <%=Services%></label> 
                            <br>
                            <label  style="font-size: 15px" >City: </label><label style="font-size: 15px" >  <%=City%></label> 
                            <br>
                            <label label style="font-size: 15px" >Address: </label><label style="font-size: 15px" >  <%=Address%></label> 
                            <br>
                            <label style="font-size: 15px" >Mobile: </label> <label style="font-size: 15px" > <%=MobileNo%></label> 
                            <br>
                            <label  style="font-size: 15px" >Consultation Fees: </label><label style="font-size: 15px" >  <%=Consultation_Fees%></label> 
                            <br>
                            <label style="font-size: 15px" >Description: </label> <label style="font-size: 15px" > <%=Description%> </label>  
                        </div>


                    </div>         

                    <!----        
                         ADD DIV HERE
                    -->
                    <div style="margin: 10px;border: solid 2px black;" class="row">
                        <div style="background-color: #00598e; color: white; padding: 10px;color: white">
                            <label>Booking Details</label>
                        </div>
                        <div style="padding: 10px">
                            <label style="font-size: 15px" >Working_Days: </label> &nbsp;
                            <%
                            if (monday_working == 1) {%>
                            <label> Monday </label>
                            <img src="images/Tick.jpg"  width="25" height="25"/> &nbsp;
                            <% }
                            if (tuesday_working == 1) {%>
                            <label> Tuesday </label>
                            <img src="images/Tick.jpg"  width="25" height="25"/> &nbsp;        <% }
                            if (wednesday_working == 1) {%>
                            <label> Wednesday </label>
                            <img src="images/Tick.jpg"  width="25" height="25"/> &nbsp;        <% }
                            if (thursday_working == 1) {%>
                            <label> Thursday </label>
                            <img src="images/Tick.jpg"  width="25" height="25"/> &nbsp;        <% }
                            if (friday_working == 1) {%>
                            <label> Friday </label>
                            <img src="images/Tick.jpg"  width="25" height="25"/> &nbsp;        <% }

                                if (saturday_working == 1) {%>
                            <label> Saturday </label>
                            <img src="images/Tick.jpg"  width="25" height="25"/> &nbsp;        <% }
                            if (sunday_working == 1) {%>
                            <label> Sunday </label>   
                            <img src="images/Tick.jpg"  width="25" height="25"/> &nbsp;        <% }
                            %>

                            <div class="form-group">
                                <label>Select Date-</label>
                                <input type="date" id="d1" name="AppointmentDate" class="form-control"  onchange="test1()"/>
                            </div>

                            <div class="form-group">
                                <div id="d3"></div>
                            </div>
                        </div>
                    </div>



                    <div id="myModal" class="modal">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Modal Header</h4>
                                </div>
                                <div class="modal-body">
                                    <img id="im7" src="" />
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <%                            }
                %>
                <!-- Modal -->
                <!--Patient Details-->
                <div style="margin: 10px;border: solid 2px black; "class="row">
                    <div style="background-color: #00598e; color: white; padding: 10px;color: white">
                        <label>Patient Details</label>
                    </div>


                    <div style="padding: 10px">
                        <label>Current Date</label>
                        <input type="date" name="CurrentDate" class="form-control"/><br>
                        <label>Patient's Name</label>
                        <input type="text" name="PatientName" class="form-control"/><br>
                        <label>Patient's Age</label>
                        <input type="text" name="PatientAge" class="form-control"/><br>
                        <label>Patient's Problem</label>
                        <input type="text" name="Problem" class="form-control"/><br>

                    </div>
                </div>

                <%
                    String uname = (String) session.getAttribute("uname");
                    String email = (String) session.getAttribute("email");

                %>

                <script
                    src="https://checkout.razorpay.com/v1/checkout.js"
                    data-key="rzp_test_96HeaVmgRvbrfT"
                    data-amount="<%=Consultation_Fees%>"
                    data-buttontext="Pay Fees"
                    data-name="Practo Project"

                    data-description="Thank You for Booking Doctor"
                    data-image="myuploads/images2.jpg"
                    data-prefill.name="<%=uname%>"
                    data-prefill.email="<%=email%>"
                    data-theme.color="#F33F54"
                ></script>
                <input type="hidden" value="Hidden Element" name="hidden">






                <div id="myModal2" class="modal">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Doctor Rating</h4>
                            </div>
                            <div class="modal-body">
                                <img id="rating_1" src="images/empty_star.png"  height="20" width="20" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)">
                                <img id="rating_2" src="images/empty_star.png"  height="20" width="20" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)"> 
                                <img id="rating_3" src="images/empty_star.png" height="20" width="20" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)">
                                <img id="rating_4" src="images/empty_star.png"  height="20" width="20" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)">
                                <img id="rating_5" src="images/empty_star.png" height="20" width="20" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)">

                                <br>
                                <label>Comments:</label>
                                <input type="text" id="comments" name="comments"/>
                                <br>
                                <input type="button" value="Save" style="background-color: #00598e" class="btn btn-success" onclick="save()"/>


                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>

                    </div>
                </div>

                <!--3rd modelpopup-->
                <div id="myModal3" class="modal">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">View All Ratings Here</h4>
                            </div>
                            <div class="modal-body">

                                <%
                                    Class.forName("com.mysql.jdbc.Driver");
                                    System.out.println("Driver Loading done");
                                    Connection conn3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
                                    System.out.println("Connection Created");
                                    Statement stmt3 = conn3.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                                            ResultSet.CONCUR_UPDATABLE);
                                    System.out.println("Statement Created");
                                    ResultSet rs3 = stmt3.executeQuery("select * from rating where Doctorid='" + Doctor_id + "' ");
                                    System.out.println("ResultSet Created\n\n");

                                    while (rs3.next()) {
                                        int RatingValue = (Integer) rs3.getInt("RatingValue");
                                        String RatedByUser = (String) rs3.getString("RatedByUser");

                                        String name = "";
                                        Statement stmt4 = conn3.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                                                ResultSet.CONCUR_UPDATABLE);
                                        System.out.println("Statement Created");
                                        ResultSet rs4 = stmt4.executeQuery("select * from user where Email='" + RatedByUser + "'");
                                        if (rs4.next()) {
                                            name = rs4.getString("username");
                                        }

                                        System.out.println("ResultSet Created\n\n");

                                        String Comments = (String) rs3.getString("Comments");
                                %>
                                <div class="container">
                                    <label style="font-size: 22px; font-family: cursive; text-transform: capitalize"><%= name%> (<%= RatingValue%>/5) </label>
                                    <br>
                                    <%
                                        for (int j = 1; j <= RatingValue; j++) {
                                    %>
                                    <img src="images/filled_star.png" width="25"  height="25" />

                                    <%
                                        }
                                        for (int j = 1; j <= 5 - RatingValue; j++) {
                                    %>    
                                    <img src="images/empty_star.png" width="25"  height="25" />
                                    <%
                                        }
                                    %>
                                    <br>
                                    <label style="font-style: 16px; font-style: italic"><%=Comments%></label><br>
                                </div>
                                <hr>
                                <%
                                    }
                                %>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>



        <%@include file='footer.html' %>
    </body>
</html>

