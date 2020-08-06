<%-- 
    Document   : ScoreQuiz
    Created on : Jun 28, 2020, 3:30:50 PM
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
            
            String paramName=(String)s.getAttribute("q_id");
            String score=(String)s.getAttribute("q_score");
            int sc=Integer.parseInt(score);
            
            if(!con.isClosed())
            {
                  
            PreparedStatement ps1=con.prepareStatement("select * from quiz where q_id = ?");
            ps1.setString(1,paramName);
        
            ResultSet rs=ps1.executeQuery();
             while(rs.next())
                    {
                        String quest=rs.getString("q_q"+s.getAttribute("q_number"));
                        PreparedStatement sf=con.prepareStatement("select * from question where Q_id=?");
                        sf.setString(1,quest);
                        
                        ResultSet rs2=sf.executeQuery();
                        while(rs2.next()){
                            String answer=request.getParameter("ans");
                            if(rs2.getString("Q_correct").equals(answer)){
                                int question_score=Integer.parseInt(rs.getString("q_maxscore"));
                                question_score=question_score/10;
                                sc=sc+question_score;
                                s.setAttribute("q_score",Integer.toString(sc));
                        }
                    }
            }
            String q_num=(String)s.getAttribute("q_number");
            int x=Integer.parseInt(q_num);
            x=x+1;
            
            if(x<=10){
                
                s.setAttribute("q_number",Integer.toString(x));
                response.sendRedirect("GiveQuiz.jsp");
            }else{
                response.sendRedirect("QuizResult.jsp") ;  
            }
            
            }
                        %>
    </body>
</html>
