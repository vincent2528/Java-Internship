<%-- 
    Document   : MakeQuestion
    Created on : Jun 28, 2020, 1:03:18 PM
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
           String _question= request.getParameter("Question");
           String _option1 = request.getParameter("Option1");
           String _option2 = request.getParameter("Option2");
           String _option3 = request.getParameter("Option3");
           String _option4 = request.getParameter("Option4");

           String _correct = request.getParameter("correct");
           String _quiz = (String)session.getAttribute("q_id");
           
           CallableStatement csbt = con.prepareCall("{call add_question(?,?,?,?,?,?,?)}"); 
           csbt.setString(1,_question);
           csbt.setString(2,_option1);
           csbt.setString(3,_option2);
           csbt.setString(4,_option3);
           csbt.setString(5,_option4);
           csbt.setString(6,_quiz);
           csbt.setString(7,_correct);

           
          csbt.execute();
          
          
          String k= (String)session.getAttribute("q_count");
          int z=Integer.parseInt(k);
          z=z+1; 
          
          if(z<10){
          
          HttpSession s=request.getSession();
          s.setAttribute("q_count",Integer.toString(z));


          response.sendRedirect("NewQuestion.jsp");
          }else{
              response.sendRedirect("ConfirmQuiz.jsp");
          }
          %> 
    </body>
</html>
