<%-- 
    Document   : ViewResult
    Created on : Jun 28, 2020, 5:43:37 PM
    Author     : admin
--%>

<%@page import="java.util.Enumeration"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
    </style>
    
</head>
<body>
    <% HttpSession s=request.getSession(); %>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
        <a class="navbar-brand" href="#">Quizy</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
      
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <a class="nav-link" href="HomePage.jsp" name="Home">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="ResultsPage.jsp" name="Result">Results</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="QuizPage.jsp" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  Online Quiz
                </a>
                <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                    <li class="dropdown-submenu"><a class="dropdown-item dropdown-toggle" href="CoursePage.jsp" name="Technical">TECHINCAL</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item"  href="CIVILcourse.jsp" id="Civil">CIVIL/MECHANICAL</a></li>
                            <li><a class="dropdown-item"  href="CScourse.jsp" id="Comps">CS/IT</a></li>
                            <li><a class="dropdown-item"  href="ELECcourse.jsp" id="Electrical">ELECTRICAL</a></li>
                        </ul>
                      </li>
                  <li class="dropdown-submenu"><a class="dropdown-item dropdown-toggle" href="CoursePage.jsp" name="Diploma">DIPLOMA</a>
                    <ul class="dropdown-menu">
                            <li><a class="dropdown-item"  href="CIVILcourse.jsp" name="Civil">CIVIL/MECHANICAL</a></li>
                            <li><a class="dropdown-item"  href="CScourse.jsp" name="Comps">CS/IT</a></li>
                            <li><a class="dropdown-item"  href="ELECcourse.jsp" name="Electrical">ELECTRICAL</a></li>
                        </ul>
                  </li>
                  <li class="dropdown-submenu"><a class="dropdown-item dropdown-toggle" href="CoursePage2.jsp" name="Management">MANAGEMENT</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="HRcourse.jsp" name="Hr">HR</a></li>
                        <li><a class="dropdown-item" href="FINcourse.jsp" name="Finance">FINANCE</a></li>
                        <li><a class="dropdown-item" href="BMAcourse.jsp" name="Bma">BB/BMA/BMS</a></li>
                    </ul>
                  </li>
                </ul>
              </li>
          </ul>
          <% if((String)session.getAttribute("id")!=null) { %>
      <form class="form-inline my-2 my-lg-0" action="MyProfile.jsp">
        <div class="col px-md-2"><button class="btn btn-outline-success my-2 my-sm-0" type="submit" name="Profile"><%= (String)session.getAttribute("name") %></button></div>
       </form>
       <form class="form-inline my-2 my-lg-0" action="Logout.jsp">

        <button class="btn btn-outline-danger my-2 my-sm-0" type="submit" name="Logout">Logout</button>

      </form>
      <% } else { %>
      
      <form class="form-inline my-2 my-lg-0" action="Registrationpage.jsp">
        <div class="col px-md-2"><button class="btn btn-outline-danger my-2 my-sm-0" type="submit" name="Login">Login</button></div>
        
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit" name="Signup">Sign Up</button>
      </form>
      <% } %>
        </div>
    </div>

      </nav>
        <%
            Class.forName("com.mysql.jdbc.Driver");
               Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinequiz",
                        "root","root");
            String paramName=null;
            Enumeration paramNames = request.getParameterNames();
             paramName= null;
               while(paramNames.hasMoreElements()) {
                    paramName = (String)paramNames.nextElement();
               }
              if(!con.isClosed())
            {
                  
            PreparedStatement ps1=con.prepareStatement("select * from results where r_id = ?");
            ps1.setString(1,paramName);
        
            ResultSet rs=ps1.executeQuery();
             while(rs.next())
                    {
                        String quest=rs.getString("q_id");
                        PreparedStatement sf=con.prepareStatement("select * from quiz where q_id=?");
                        sf.setString(1,quest);
                        
                        ResultSet rs2=sf.executeQuery();
                        while(rs2.next()){
                       
     %>
       
    <div class="ui main text container segment" id="kr">
        <div class="ui huge header">Result Status-</div>
        <form class="ui form" action="ResultsPage.jsp">
        <div class="field">
            <label>Quiz Name :</label>
            <label><%= rs2.getString("q_name") %></label>
        </div>
        <div class="field">
            <label>Status :</label>
            <label><% if(rs.getString("r_posted").equals("true")) { 
                out.println("Posted");
            }else{
                out.println("Not Posted Yet");
            } %>
            </label>
        </div>
        <div class="field">
            <label>Score :</label>
            <label><%= rs.getString("r_score") %> out of <%= rs2.getString("q_maxscore") %></label>
        </div>
        
          
        <button class="ui red button" type="submit">Return to Results</button>

        </form>
        <% } } }  %>
    </div>    
    
    
     <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script>
    $(function () {
        $(document).scroll(function () {
            var $nav = $("#mainNavbar");
            $nav.toggleClass("scrolled", $(this).scrollTop() > $nav.height());
        });
    });
</script></body>
</html>
            
    </body>
</html>
