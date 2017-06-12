
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <script>

            var xmlhttp;
            function go1()
            {
                var category = document.getElementById("s1").value;

                xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = go2;
                xmlhttp.open("GET", "block_doctor.jsp?category=" + category, true);
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
        
    </head>
    <body>
       
    </body>
</html>
