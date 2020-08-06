<%-- 
    Document   : QuizResult.jsp
    Created on : Jun 28, 2020, 5:01:48 PM
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
            Class.forName("com.mysql.jdbc.Driver");
          Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinequiz",
                        "root","root");
            String res=(String)s.getAttribute("q_score");
            if((String)session.getAttribute("id")!=null) { 
                String quiz=(String)s.getAttribute("q_id");
                String _user=(String)session.getAttribute("id");
                out.println("<h1>"+_user+" , "+quiz+" , "+res+"</h1>");
                
                CallableStatement csbt = con.prepareCall("{call add_result(?,?,?)}"); 
           csbt.setString(1,quiz);
           csbt.setString(2,_user);
           csbt.setString(3,res);
           
           csbt.execute();
           response.sendRedirect("ResultsPage.jsp");

            }else{
            response.sendRedirect("Registrationpage.jsp");
            }
            %>
            
    </body>
</html>
