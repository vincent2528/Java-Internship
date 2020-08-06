<%-- 
    Document   : UpdateQuiz
    Created on : Jul 2, 2020, 3:48:33 PM
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
            String _quiz=(String)session.getAttribute("q_id");
            String _name= request.getParameter("Name");
           String _course = request.getParameter("course");
           String _subcourse = request.getParameter("subcourse");
           String _maxscore = request.getParameter("maxscore");
            
 
               if(!con.isClosed())
            {
                  
            PreparedStatement ps1=con.prepareStatement("select * from quiz where q_id = ?");
            ps1.setString(1,_quiz);
        
            ResultSet rs=ps1.executeQuery();
             while(rs.next())
                    {
                        
                            PreparedStatement ps=con.prepareStatement("update quiz set q_name=?,q_course=?,q_subcourse=?,q_maxscore=? where q_id=?");
                            ps.setString(1,_name);
                            ps.setString(2,_course);
                            ps.setString(3,_subcourse);
                            ps.setString(4,_maxscore);
                            ps.setString(5,_quiz);
                            
                            ps.executeUpdate();
                            response.sendRedirect("EditQuestion.jsp");
                            
                        
                    }
            }            %>
    </body>
</html>
