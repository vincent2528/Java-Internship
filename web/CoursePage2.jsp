<%-- 
    Document   : HomePage
    Created on : Jun 23, 2020, 11:55:35 PM
    Author     : admin
--%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <script src="https://kit.fontawesome.com/b39e3783ea.js" crossorigin="anonymous"></script>
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
        crossorigin="anonymous">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="app.css">

    <title>Test Section</title>
    
    <style>
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

    <section class="container-fluid px-0">
        <div class="row align-items-center content">
            <div class="col-md-6 order-2 order-md-1">
                <img src="https://images.unsplash.com/photo-1560574188-6a6774965120?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80" alt="" class="img-fluid">
            </div>
            <div class="col-md-6 text-center order-1 order-md-2">
                <div class="row justify-content-center">
                    <div class="col-10 col-lg-8 blurb mb-5 mb-md-0">
                        <h2>HR</h2>
                        <img src="imgs/lolli_icon.png" alt="" class="d-none d-lg-inline">
                        <p class="lead">Are you a human resources expert? Test your knowledge with our HR quizzes and find out.</p>
                            <a href="HRcourse.jsp" class="btn btn-outline-success btn-sm" name="Civil">Give Test</a>
                          <a href="#" class="btn btn-outline-danger btn-sm"><i class="far fa-heart"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row align-items-center content">
            <div class="col-md-6 text-center">
                <div class="row justify-content-center">
                    <div class="col-10 col-lg-8 blurb mb-5 mb-md-0">
                        <h2>FINANCE</h2>
                        <img src="imgs/lolli_icon.png" alt="" class="d-none d-lg-inline">
                        <p class="lead">This is the current affairs questions and answers section on "Finance" with explanation for various interview, competitive examination and entrance test.</p>
                            <a href="FINcourse.jsp" class="btn btn-outline-success btn-sm" name="Cs">Give Test</a>
                          <a href="#" class="btn btn-outline-danger btn-sm"><i class="far fa-heart"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <img src="https://images.unsplash.com/photo-1581092580497-e0d23cbdf1dc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80" alt="" class="img-fluid">
            </div>
        </div>
        <div class="row align-items-center content">
            <div class="col-md-6 order-2 order-md-1">
                <img src="https://images.unsplash.com/photo-1581094275452-f5df25d2556e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80" alt="" class="img-fluid">
            </div>
            <div class="col-md-6 text-center order-1 order-md-2">
                <div class="row justify-content-center">
                    <div class="col-10 col-lg-8 blurb mb-5 mb-md-0">
                        <h2>BB/BMA/BMS</h2>

                        <img src="imgs/lolli_icon.png" alt="" class="d-none d-lg-inline">
                        <p class="lead">Get help with making an informed choice about your specialty. Specialty explorer is a tool for BMA members that supports your research into medical specialties</p>
                            <a href="BMAcourse" class="btn btn-outline-success btn-sm" name="Electrical">Give Test</a>
                          <a href="#" class="btn btn-outline-danger btn-sm"><i class="far fa-heart"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
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
