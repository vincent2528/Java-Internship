<%-- 
    Document   : Checker
    Created on : Jun 27, 2020, 12:25:31 PM
    Author     : admin
--%>

<%@page import="java.sql.*"%>
<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
             String s=(String)session.getAttribute("q_id");
             String k= (String)session.getAttribute("q_count");
             int z=Integer.parseInt(k);
             z=z+1;
             
             String a[]=new String[20];
             int i=0;
             
             Class.forName("com.mysql.jdbc.Driver");
                        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinequiz",
                        "root","root");
                        
            Statement myStat = null;
            ResultSet myRs = null;
            myStat = con.createStatement();

                        
              
            PreparedStatement psl=con.prepareStatement("select * from question where Q_quizid = ?");
            psl.setString(1,s);

            myRs = psl.executeQuery();
                        
            while(myRs.next()){
                out.println("<h1>"+myRs.getString("Q_id")+" , "+myRs.getString("Q_question")+"</h1>");
                a[i]=myRs.getString("Q_id");
                i++;
            }
            
            int j=0;
            PreparedStatement ps=con.prepareStatement("update quiz set q_q1=?,q_q2=?,q_q3=?,q_q4=?,q_q5=?,q_q6=?,q_q7=?,q_q8=?,q_q9=?,q_q10=? where q_id=?");
                    ps.setString(1,a[0]);
                    ps.setString(2,a[1]);
                    ps.setString(3,a[2]);
                    ps.setString(4,a[3]);
                    ps.setString(5,a[4]);
                    ps.setString(6,a[5]);
                    ps.setString(7,a[6]);
                    ps.setString(8,a[7]);
                    ps.setString(9,a[8]);
                    ps.setString(10,a[9]);
                    ps.setString(11,s);
                    

          
                    ps.executeUpdate();

                    HttpSession ses=request.getSession();
                    javax.swing.JOptionPane.showMessageDialog(null, "Record Updated");
                    ses.setAttribute("subcourse",null);
                    ses.setAttribute("q_id",null);
                    ses.setAttribute("q_count",null);
                    response.sendRedirect("QuizPage.jsp");
           
            
            %>
    </body>
</html>

