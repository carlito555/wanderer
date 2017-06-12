<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
       <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title> Add Doctors </title>
       </head>
    <body> 
    <center><h1> Add Doctors</h1></center>
        <div class="container">
        <div class="jumbot-2">
            
            
        <form action="MultiFileUploader_doctors" method="post" enctype="multipart/form-data">
            
                 
            <label> Category Name </label>
            <input type="text"  required  name="cat_name"/> <br><br>
              
            <label> Description </label> &nbsp;&nbsp;&nbsp;
            <textarea name="Description"></textarea>    <br><br>    
               
            <label> Icon</label>
            <input  type="file"  name="Icon" class=" btn btn-primary"/><br><br>
                  
            <input type="submit" value="ADD" class=" btn btn-primary"/> 
              
        </form>
        
        </div>
        </div>
    </body>
</html>
