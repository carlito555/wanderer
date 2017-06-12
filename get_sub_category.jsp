<%@page import="java.sql.*" %>
<div class="form-group">
    <label>Category Name</label>
</div>
<select>


    <%
        String Category_Name = request.getParameter("category");

        Class.forName("com.mysql.jdbc.Driver");
        System.out.println("Driver Loading done");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
        System.out.println("Connection Created");
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                ResultSet.CONCUR_UPDATABLE);
        System.out.println("Statement Created");
        ResultSet rs = stmt.executeQuery("select Sub_Category_Name from sub_category where Category_Name='" + Category_Name + "'");
        System.out.println("ResultSet Created\n\n");

        while (rs.next())
        {
    %>
    <option><%=rs.getString("Sub_Category_Name")%></option>
    <%
        }%>
</select>
</div>
