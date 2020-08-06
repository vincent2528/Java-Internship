<%-- 
    Document   : QuizPage
    Created on : Jun 27, 2020, 1:59:45 AM
    Author     : admin
--%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
    crossorigin="anonymous">
    <style>
    #gallery{
        margin-top: 10px;
    }
    .navbar-nav li:hover > ul.dropdown-menu {
        display: block;
    }
    .dropdown-submenu {
        position:relative;
    }
    .dropdown-submenu>.dropdown-menu {
        top:0;
        left:100%;
        margin-top:-6px;
    }
    button{
        margin-top: 5px;
    }
    </style>
    <script src="https://kit.fontawesome.com/b39e3783ea.js" crossorigin="anonymous"></script>
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700" rel="stylesheet">
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

    <div class="container">
        <header class="jumbotron">
            <div class="container">
                <h1>Quiz Page </h1>
                <%  
                    String subcourse=(String)session.getAttribute("subcourse"); 
                    if(subcourse!=null) {
                        out.println("<h1>"+subcourse+"</h1>");
                    }
                %>
                <br>
                 <% 
                String isadmin=(String)session.getAttribute("admin"); 
                if(isadmin!=null) {
                    if(isadmin.equals("true")){
            %>
                <p>
                    <a class="btn btn-primary btn-large" href="NewQuiz.jsp">Add New Quiz</a>
                </p>
                <% } } %>
            </div>
        </header>
            
            <div class="row" style="display:flex; flex-wrap: wrap;">
                <%  
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinequiz",
                        "root","root");
                        
                        Statement myStat = null;
                        ResultSet myRs = null;
                        myStat = con.createStatement();

                        
                        if(subcourse==null){
                        myRs = myStat.executeQuery("select * from quiz");
                        }else{
                             PreparedStatement psl=con.prepareStatement("select * from quiz where q_subcourse = ?");
                             psl.setString(1,subcourse);

                             myRs = psl.executeQuery();
                        }
                        while(myRs.next()){
                %>
                <div class="col-md-3 col-sm-6">

                        <input type="hidden" id="custId" name="hidden" value=<%= myRs.getString("q_id")%>>

                        <div class="thumbnail">
                        
                        <% if(myRs.getString("q_subcourse").equals("CS/IT")){ %>
                        <img src="https://images.unsplash.com/photo-1518770660439-4636190af475?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80" class="card-img-top">
                        <% }else if(myRs.getString("q_subcourse").equals("CIVIL/MECHANICAL")) { %>
                        <img src="https://images.unsplash.com/photo-1590545601547-16a1d67e7375?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80" class="card-img-top">
                        <% } else { %>
                        <img src="https://images.unsplash.com/photo-1542626991-cbc4e32524cc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=749&q=80" class="card-img-top">
                        <% } %>
                        <div class="caption"">
                            <h4><%= myRs.getString("q_name") %></h4>
                        </div>
                        <% 
                 
                    if(isadmin!=null) {
                    if(isadmin.equals("true")){
                        %>

                     <form action ="EditQuiz.jsp" method="POST">                        
                    <button class="btn btn-outline-success btn-sm" name="<%= myRs.getString("q_id") %>" type="submit">Edit Quiz</button>
                     </form>
                      <form action ="DeleteQuiz.jsp" method="POST">                                            
                    <button class="btn btn-outline-danger btn-sm" name="<%= myRs.getString("q_id") %>" type="submit">Delete Quiz</button>
                      </form>
                    <%}else{ %>
                     <form action ="Checker.jsp" method="POST">
                        <button type="submit" class="btn btn-outline-success btn-sm" name="<%= myRs.getString("q_id") %>">Give Test</button>
                     </form>
                    <% } } else { %> 
                    <button type="submit" class="btn btn-outline-success btn-sm" name="<%= myRs.getString("q_id") %>" disabled>Give Test</button>
                    <% } %>
                    </div>

                    
                </div>
                <%  } %>
            </div>
    </div>
            <% 
                s.setAttribute("subcourse",null);
                s.setAttribute("q_number", "1");
                s.setAttribute("q_score","0");
                s.setAttribute("q_id",null);
                s.setAttribute("q_count","0");
            %>



<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
    crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
    crossorigin="anonymous"></script>

<script>
    $(function () {
        $(document).scroll(function () {
            var $nav = $("#mainNavbar");
            $nav.toggleClass("scrolled", $(this).scrollTop() > $nav.height());
        });
    });
</script>
</body>
</html>
