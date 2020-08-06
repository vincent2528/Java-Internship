<%-- 
    Document   : MakeQuiz
    Created on : Jun 28, 2020, 12:15:48 PM
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
          Class.forName("com.mysql.jdbc.Driver");
          Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinequiz",
                        "root","root");
           String _name= request.getParameter("Name");
           String _course = request.getParameter("course");
           String _subcourse = request.getParameter("subcourse");
           String _maxscore = request.getParameter("maxscore");
           
           CallableStatement csbt = con.prepareCall("{call add_quiz(?,?,?,?)}"); 
           csbt.setString(1,_name);
           csbt.setString(2,_course);
           csbt.setString(3,_subcourse);
           csbt.setString(4,_maxscore);
           
          csbt.execute();
          
          PreparedStatement ps1=con.prepareStatement("select * from quiz");
            
         ResultSet rs=ps1.executeQuery();
            
            while(rs.next()){if(rs.getString("q_name").equals(_name)){
                                                
                    HttpSession s=request.getSession();
                    s.setAttribute("q_id",rs.getString("q_id"));
                    s.setAttribute("q_count","0");


                    response.sendRedirect("NewQuestion.jsp");
            }
            }
        %>
    </body>
</html>
