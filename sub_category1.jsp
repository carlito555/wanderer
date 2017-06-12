<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Add Sub-Category</title>
        <script>
            var xmlhttp;
            function go1()
            {
                var category = document.getElementById("s1").value;
                var subcategory = document.getElementById("subcategory").value;
              xmlhttp=new XMLHttpRequest();
              xmlhttp.onreadystatechange=go2;
              xmlhttp.open("GET","fetch_response.jsp?category="+category+"&subcategory="+subcategory,true);
              xmlhttp.send();
            }
            
            function go2()
            {
                if(xmlhttp.readyState===4 && xmlhttp.status===200)
                {
                    document.getElementById("d1").innerHTML=xmlhttp.responseText;
                }
            }
            </script>
    </head>
    
    <body>
        <%@include file="public_header.jsp" %>
    
    <div class="container">
       
         <h2>Add Sub-Category</h2> 
            <label>Sub Category</label>
            <input type="text" name="subcategory" id="subcategory"/>
            <br><br>
            
            
            
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
                           <label>Category Name</label>
                            <select id="s1" name="category">
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
        
           <br>
              <button class="btn btn-success" style="background-color: #00598e;border: 2px solid #e7e7e7" onclick="go1()">Add</button>
       
    </div>
    
    
    <div id="d1">
        
        
    </div>
    <%@include file="footer.html" %>
    </body>
</html>
