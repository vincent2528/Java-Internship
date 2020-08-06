<%-- 
    Document   : HomePage
    Created on : Jun 23, 2020, 11:57:34 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Home Screen</title>
    <script src="https://kit.fontawesome.com/b39e3783ea.js" crossorigin="anonymous"></script>
    

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <style>
    #header{
        color: white;
        background: url("https://images.unsplash.com/photo-1513258496099-48168024aec0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80") center center/cover no-repeat;
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
        <div class="jumbotron text-center" id="header"><h1>Online Quiz</h1>
            <p>Prepare yourself for the upcoming adversities.</p>
            <a href="Students.jsp" class="btn btn-primary">STUDENT</a>
            <% 
                String admin=(String)session.getAttribute("admin"); 
                if(admin!=null) {
                    if(admin.equals("true")){
            %>
            <button type="button" class="btn btn-success">ADMIN</button>
            <% } else { %>
            <button type="button" class="btn btn-success" disabled>ADMIN</button>
            <% } } else { %>
            <button type="button" class="btn btn-success" disabled>ADMIN</button>
            <% } %>

        </div>

        <div class="container" id="gallery">
            <div class="row">
                <div class="col-lg-4 mb-4">
                    <div class="card">
                        <img src="https://images.unsplash.com/photo-1518770660439-4636190af475?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80" class="card-img-top">
                        <div class="card-body">
                          <h5 class="card-title">TECHNICAL COURSES</h5>
                          <p class="card-text">Put your knowledge about all things technology to the test with our 15 question tech quiz and have some nerdy fun in the process. Good luck!.</p>
                          <a href="CoursePage.jsp" class="btn btn-outline-success btn-sm" name="Technical">Go to course</a>
                          <a href="#" class="btn btn-outline-danger btn-sm"><i class="far fa-heart"></i></a>
                        </div>
                      </div>
                </div>
                <div class="col-lg-4 mb-4">
                    <div class="card">
                        <img src="https://images.unsplash.com/photo-1590545601547-16a1d67e7375?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80" class="card-img-top">
                        <div class="card-body">
                          <h5 class="card-title">DIPLOMA COURSES</h5>
                          <p class="card-text">Rated as a Level 5 qualification, the Diploma of Higher Education (or ... Trivia Questions Quiz On The Structure And Science Of The QRIS!</p>
                          <a href="CoursePage.jsp" class="btn btn-outline-success btn-sm" name="Diploma">Go to course</a>
                          <a href="#" class="btn btn-outline-danger btn-sm"><i class="far fa-heart"></i></a>
                        </div>
                      </div>
                </div>
                <div class="col-lg-4 mb-4">
                    <div class="card">
                        <img src="https://images.unsplash.com/photo-1542626991-cbc4e32524cc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=749&q=80" class="card-img-top">
                        <div class="card-body">
                          <h5 class="card-title">MANAGEMENT COURSES</h5>
                          <p class="card-text">The National Management Quiz has been designed as an interactive programme to facilitate a copious flow of knowledge and ideas packaged in exciting rounds.</p>
                          <a href="CoursePage.jsp" class="btn btn-outline-success btn-sm" name="Management">Go to course</a>
                          <a href="#" class="btn btn-outline-danger btn-sm"><i class="far fa-heart"></i></a>
                        </div>
                      </div>
                </div>
            </div>
        </div>

    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
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
