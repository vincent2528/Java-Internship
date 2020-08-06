<%-- 
    Document   : SetId
    Created on : Jul 2, 2020, 3:40:44 PM
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
            Class.forName("com.mysql.jdbc.Driver");
               Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinequiz",
                        "root","root");
            String paramName=null;
            Enumeration paramNames = request.getParameterNames();
               paramName= null;
               while(paramNames.hasMoreElements()) {
                    paramName = (String)paramNames.nextElement();
               }
               s.setAttribute(("q_id"), paramName);
               response.sendRedirect("GiveQuiz.jsp");
               %>
    </body>
</html>
