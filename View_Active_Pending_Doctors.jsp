<%@page import="java.sql.*"%>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Active Pending Doctors-Modal Popup</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <script type="text/javascript" src="jquery-1.12.2.min.js"></script>

        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script>
            var xmlhttp;


            function go(btn)
            {
              //  alert("id from button" + btn.id);
                //send ajax request along with doctorid as parameter
                //and set result in body of modelpopup

                xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = go2;
                xmlhttp.open("GET", "singledoctor.jsp?did=" + btn.id, true);
                xmlhttp.send();

                //then show model popup
                $('#m2').modal('show');
            }



            function go2()
            {
                if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
                {
                    document.getElementById("doctordetail").innerHTML = xmlhttp.responseText;
                }
            }

        </script>
        <link type="text/css" rel="stylesheet" href="css/bootstrap.css">

    </head>

    <body>
        <%@include file="public_header.jsp" %>
        <div class="container">
        <h1>List of Pending Doctors</h1>
        <br>
        <table border="1">
            <th>Doctor Id</th><th>Doctor Name</th><th>Qualification</th><th>Experience</th><th>Profile Photo</th><th>Category</th><th>Sub Category</th><th>Address</th><th>Status</th>
                <%
                    //int DoctorId = Integer.parseInt(request.getParameter("Doctorid"));
                    //String status = request.getParameter("Status");

                    Class.forName("com.mysql.jdbc.Driver");
                    System.out.println("Driver Loading done");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
                    System.out.println("Connection Created");
                    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                            ResultSet.CONCUR_UPDATABLE);
                    System.out.println("Statement Created");
                    ResultSet rs = stmt.executeQuery("select * from doctors_info2 where status='pending' ");
                    System.out.println("ResultSet Created\n\n");

                    int Doctorid = 0;
                    String Doctor_Name = "";
                    String Qualification = "";
                    String Experience = "";
                    String ProfilePhoto = "";
                    String Category = "";
                    String Sub_Category = "";
                    String Address = "";
                    String Status = "";

                    while (rs.next())
                    {
                        Doctorid = rs.getInt("doctor_id");
                        Doctor_Name = rs.getString("Doctor_name");
                        Qualification = rs.getString("Qualification");
                        Experience = rs.getString("Experience");
                        ProfilePhoto = rs.getString("profile_photo");
                        Category = rs.getString("Category");
                        Sub_Category = rs.getString("Sub_Category");
                        Address = rs.getString("Address");
                        Status = rs.getString("status");
                %>   
            <tr>

                <td><%=Doctorid%></td>
                <td><%=Doctor_Name%></td>
                <td><%=Qualification%></td>
                <td><%=Experience%></td>
                <td><img src="<%= ProfilePhoto%>" width="100" height="100"/></td>
                <td><%=Category%></td>
                <td><%=Sub_Category%></td> 
                <td><%=Address%></td> 

                <td><input id="<%= Doctorid%>" type="button"
                           value="Active" style="background-color: #00598E;border: 2px gray"
                           class="btn btn-success" 
                           onclick="go(this)"/></td> 

            </tr>
            <%
                }
            %>

        </table>


        <!--active doctors-->
        <h1>List of Active Doctors</h1>
        <br>
        <table border="1" >
            <th>Doctor Id</th><th>Doctor Name</th><th>Qualification</th><th>Experience</th><th>Profile Photo</th><th>Category</th><th>Sub Category</th><th>Address</th><th>Status</th>
                <%
                    rs = stmt.executeQuery("select * from doctors_info2 where status='Approve' ");
                    System.out.println("ResultSet Created\n\n");

                    int Doctorid2 = 0;
                    String Doctor_Name2 = "";
                    String Qualification2 = "";
                    String Experience2 = "";
                    String ProfilePhoto2 = "";
                    String Category2 = "";
                    String Sub_Category2 = "";
                    String Address2 = "";
                    String Status2 = "";

                    while (rs.next())
                    {
                        Doctorid2 = rs.getInt("doctor_id");
                        Doctor_Name2 = rs.getString("Doctor_name");
                        Qualification2 = rs.getString("Qualification");
                        Experience2 = rs.getString("Experience");
                        ProfilePhoto2 = rs.getString("profile_photo");
                        Category2 = rs.getString("Category");
                        Sub_Category2 = rs.getString("Sub_Category");
                        Address2 = rs.getString("Address");
                        Status2 = rs.getString("status");
                %> 



            <tr>
                <td><%=Doctorid2%></td>
                <td><%=Doctor_Name2%></td>
                <td><%=Qualification2%></td>
                <td><%=Experience2%></td>
                <td><img src="<%= ProfilePhoto2%>" width="100" height="100"/></td>
                <td><%=Category2%></td>
                <td><%=Sub_Category2%></td> 
                <td><%=Address2%></td> 

                <td><a href="block_doctor.jsp?Doctorid=<%= Doctorid2%>"><input  type="button"
                                                                                 value="Block" style="background-color: #00598E;border: 2px gray"
                                                                                 class="btn btn-success"/></a></td> 

            </tr>
            <%
                }
            %>

        </table>

        <!-- Modal -->
        <div class="modal" id="m2" >
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Modal Header</h4>
                    </div>
                    <div id="doctordetail" class="modal-body">
                        <p>Some text in the modal.</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <%@include file='footer.html' %>
    </body>
</html>









