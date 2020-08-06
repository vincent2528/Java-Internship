<%-- 
    Document   : CIVILcourse
    Created on : Jun 27, 2020, 7:25:02 PM
    Author     : admin
--%>
<%@page import="java.sql.*"%>


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
                    s.setAttribute("subcourse","FINANCE");
                    
                    response.sendRedirect("QuizPage.jsp");

                    %>
    </body>
</html>
