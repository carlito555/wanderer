<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Gallery For Doctor</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>

        <script>
            function readandpreview(fileobj, imageid)
            {
                var firstfile = fileobj.files[0];

                var reader = new FileReader();

                //alert("File name: " + firstfile.name);
                //alert("File size: " + firstfile.size);

                reader.onload = (function (f)
                {
                    return function read12(e)
                    {
                        if (firstfile.type.indexOf("image") !== -1)
                        {
                            document.getElementById(imageid).src = e.target.result;
                        } else if (firstfile.type.indexOf("audio") !== -1)
                        {
                            document.getElementById(imageid).src = "audio.jpg";
                        } else if (firstfile.type.indexOf("video") !== -1)
                        {
                            document.getElementById(imageid).src = "video.jpg";
                        } else
                        {
                            document.getElementById(imageid).src = "other.png";
                        }
                    };
                })(firstfile);


                reader.readAsDataURL(firstfile);
            }


            function upload()
            {
                var ans = "";
                //NEW CODE
                var formdata = new FormData();

                var controls = document.getElementById("form1").elements;

                alert("found " + controls.length + " controls in form");

                var flag = 0;
                for (var i = 0; i < controls.length; i++)
                {
                    if (controls[i].name == "" || controls[i].name == null)
                    {
                        flag = 1;
                    }

                    if (controls[i].type == "file")
                    {
                        if (controls[i].files.length > 0)
                        {
                            ans = ans + controls[i].name + ": " + controls[i].files[0].name + "\n";
                            formdata.append(controls[i].name, controls[i].files[0]);
                        } else
                        {
                            flag = 2;
                        }
                    } else    // for other input types  text,password,select
                    {
                        ans = ans + controls[i].name + ": " + controls[i].value + "\n";
                        //formdata.append("rn",document.getElementById("rn").value);
                        //formdata.append(firstfile.name,firstfile);

                        formdata.append(controls[i].name, controls[i].value);
                    }
//                    alert(ans);
//                    alert(flag);
                }

                if (flag == 1)
                {
                    alert("CHECK: --> Give name attribute to all controls in form");
                } else if (flag == 2)
                {
                    alert("CHECK: --> Select Files for file controls");
                } else
                {
                    alert(ans);
                    alert(formdata);

                    var xhr = new XMLHttpRequest;
                    xhr.upload.addEventListener("progress", updateProgress, false);

                    xhr.open("POST", "./MultiFileUploaderImages", true);

                    //for response receiving
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            document.getElementById("d1").innerHTML = xhr.responseText;

                        }
                    };



                    xhr.send(formdata);
                }

            }

            function updateProgress(evt)
            {
                if (evt.lengthComputable)
                {
                    var percentComplete = parseInt((evt.loaded * 100) / evt.total);
                    document.getElementById("label").innerHTML = percentComplete + " %";
                    document.getElementById("progress").value = percentComplete;
                }
            }


            function deleteimage()
            {
                var ans = confirm("Are you sure you want to delete this image ?");

                return ans;

            }



        </script>
    </head>
    <body>
        <%@include file='public_header.jsp' %>
        <div class="container">
     
    <center>   <h2>Managing Gallery Of Doctor</h2></center>




    <div >
        <br>



        <form action="#" method="post" enctype="multipart/form-data" id="form1">  



            <img src="" id="im1" style="width: 100px;height: 100px;">  
            <input type="file" id="f1" name="f1"  onchange="readandpreview(this, 'im1')" /> 
            <br><br>

            <label>Caption</label>
            <input type="text" name="caption"/>



        </form>

        <br>
        <input type="button" class="btn btn-primary"  style="background-color: #00598e" onclick="upload()" value="Upload"/>
    </div>
    <br>
    <hr>

    <div id="d1" style="margin: 10px; padding: 10px;">
        <div class="row">
            <%
                int did = Integer.parseInt(session.getAttribute("did").toString());
                Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driver Loading Done");

                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
                System.out.println("Connection Created");

                Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                System.out.println("Statement Created");

                ResultSet rs = stmt.executeQuery("Select * from gallery where did=" + did);
                System.out.println("Result Set Created");

                while (rs.next()) {
                    int pid = rs.getInt("photo_id");
                    String photo = rs.getString("photo_path");
                    String caption = rs.getString("caption");

            %>

            <div class="col-sm-3">
                <img src="<%= photo%>" style="width: 100%; height: 200px" /><br>
                <label><%= caption%></label>
                <a href="deleteimagegallery.jsp?pid=<%=pid%>" onclick="return deleteimage()"> <button class="btn btn-danger" >X</button>   </a>
            </div>


            <%

                }


            %>
        </div>
    </div>
  </div>
<%@include file='footer.html' %>
</body>
</html>
