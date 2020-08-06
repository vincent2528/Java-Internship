<%-- 
    Document   : Logout
    Created on : Jun 27, 2020, 1:29:04 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            HttpSession s=request.getSession();
                    s.setAttribute("id",null);
                    s.setAttribute("name",null);
                    s.setAttribute("admin",null);
                    response.sendRedirect("Registrationpage.jsp");
                    %>
    </body>
</html>
