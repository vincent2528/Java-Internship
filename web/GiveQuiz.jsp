<%-- 
    Document   : GiveQuiz
    Created on : Jun 28, 2020, 2:54:07 PM
    Author     : admin
--%>

<%@page import="java.util.Enumeration"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Starting/Index Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css"/>

    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" 
    integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="submenu.css">
    <style>
        #kr{
    margin-top: 4.0em;
    margin-left: 10%;
    margin-right: 10%;
}
body{
    font-size: 20px;
}
#question{
    font-weight: bold;
    font-size: 21px;
}
    </style>
    </head>
    <body>
        <%
            HttpSession s=request.getSession();
            Class.forName("com.mysql.jdbc.Driver");
               Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinequiz",
                        "root","root");
            String paramName=(String)s.getAttribute("q_id");
             

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
                        %>
        <div class="ui main text container segment" id="kr">
        <div class="ui huge header">Question no. <%= s.getAttribute("q_number")%></div>
        <form class="ui form" action="ScoreQuiz.jsp">
        <div class="grouped fields">
        <div class="field">
            <label id="question">Q.)   <%= rs2.getString("Q_question") %></label>
        </div>
        <div class="field">
            <label> Options: </label>
        </div>
        <div class="field">
            <label>       <input type="radio" name="ans" value="1" required>   <%= rs2.getString("Q_option1")%></label>
        </div>
        <div class="field">
            <label>       <input type="radio" name="ans" value="2">   <%= rs2.getString("Q_option2") %></label>
        </div>
        <div class="field">
            <label>       <input type="radio" name="ans" value="3">   <%= rs2.getString("Q_option3") %></label>
        </div>
        <div class="field">
            <label>       <input type="radio" name="ans" value="4">   <%= rs2.getString("Q_option4") %></label>
        </div> 
        <button class="ui green button" type="submit">Submit</button>
        </div>
        </form>
        <% } } } %>
    </div>  
    </body>
</html>
