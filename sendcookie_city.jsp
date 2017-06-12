
<%
    String city = request.getParameter("city");
    Cookie ck = new Cookie("city", city);
    ck.setMaxAge(24 * 60 * 60);
    response.addCookie(ck);

    out.println("<h1>Cookie Sent</h1>");


%>
