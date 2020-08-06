<%-- 
    Document   : UpdateQuestion
    Created on : Jul 2, 2020, 3:48:51 PM
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
          String _quest=request.getParameter("hidden");
           
            if(!con.isClosed())
            {
                  
            PreparedStatement ps1=con.prepareStatement("select * from question where Q_id = ?");
            ps1.setString(1,_quest);
        
            ResultSet rs=ps1.executeQuery();
             while(rs.next())
                    {
                        
                            PreparedStatement ps=con.prepareStatement("update question set Q_question=?,Q_option1=?,Q_option2=?,Q_option3=?,Q_option4=?,Q_correct=? where Q_id=?");
                            ps.setString(1,_question);
                            ps.setString(2,_option1);
                            ps.setString(3,_option2);
                            ps.setString(4,_option3);
                            ps.setString(5,_option4);
                            ps.setString(6,_correct);
                            ps.setString(7,_quest);
                            
                            ps.executeUpdate();                            
                           
          String k= (String)session.getAttribute("q_count");
          int z=Integer.parseInt(k);
          z=z+1; 
          
          if(z<10){
          
          HttpSession s=request.getSession();
          s.setAttribute("q_count",Integer.toString(z));


          response.sendRedirect("EditQuestion.jsp");
          }else{
             javax.swing.JOptionPane.showMessageDialog(null, "Quiz Updated");

              response.sendRedirect("QuizPage.jsp");
          } 
                    }
            }
          %> 
    </body>
</html>
