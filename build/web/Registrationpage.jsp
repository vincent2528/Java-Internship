<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login form</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" 
    integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="style.css">
    <script src="formValidation.js"></script>

</head>
<body>
    <%
     
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinequiz",
                        "root","root");
           

%>
    
    <nav class="navbar navbar-inverse">
        <div class="container">
          <!-- Brand and toggle get grouped for better mobile display -->
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Quizy</a>
          </div>
      
          <!-- Collect the nav links, forms, and other content for toggling -->
          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
              <li class="active"><a href="HomePage.jsp" name="Home">Home<span class="sr-only">(current)</span></a></li>
              <li><a href="ResultsPage.jsp" name="Result">Result</a></li>
            </ul>
          </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
      </nav>
        <div class="container">
        <div class="row">
            <div class="col-md-5">
                <h1 class="text-center">Student</h1>
                <form name="f1" action="Confirmation.jsp" method="post">
                <label class="label control-label">User name or E-mail</label>
                <div class="input-group">
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-user"></span>
                    </span>
                    <input type="text" class="form-control" name="mail" placeholder="E-mail" required>
                </div>
                <label class="label control-label">Password</label>
                <div class="input-group">
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-lock"></span>
                    </span>
                    <input type="password" class="form-control" name="pass" placeholder="Password" required>
                </div>
                <div class="row">
                    <div class="col-md-6"><input type="checkbox"><small> Remember me</small></div>
                    <div class="col-md-6"><a href="#"><p class="text-right">Forgot Password?</p></a></div>
                </div>
                <input class="btn btn-default" type="submit" name="submit" value="SigIn">                
                <p class="text-center">Not a member yet?<a href="#">Sign up</a></p>
                </form>

            </div> 
            
            <div class="col-md-2">

            </div>
            <div class="col-md-5">
                <h2 class="text-center">Sign Up</h2>
                <form name="registration" action="SignUp.jsp" method="post" onsubmit="return formValidation();">

                <label class="label control-label">Name</label>
                <div class="input-group">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                    <input type="text" class="form-control" required name="username" placeholder="Name">
                </div>
                <label class="label control-label">User name</label>
                <div class="input-group">
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-user"></span>
                    </span>
                    <input type="text" class="form-control" name="uname" placeholder="E-mail" required>
                </div>
                <label class="label control-label">E-mail</label>
                <div class="input-group">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span></span>
                    <input type="email" class="form-control" required name="email" placeholder="E-mail">
                </div>
                <label class="label control-label">Contact</label>
                <div class="input-group">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-phone"></span></span>
                    <input type="text" class="form-control" required name="contact" placeholder="Contact">
                </div>
                <label class="label control-label">Password</label>
                <div class="input-group">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                    <input type="password" class="form-control" required name="passid" placeholder="Password">
                </div>
                <label class="label control-label">Confirm Password</label>
                <div class="input-group">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                    <input type="password" class="form-control" required name="confirmpass" placeholder="Password">
                </div>
                <div class="row">
                    <div class="col-md-6"><input type="checkbox" required name="terms"><small> I agree with all the terms</small></div>
                </div>
                <input class="btn btn-default" type="submit" name="submit" value="Sign Up">
                </form>
            </div>
        </div>
        </div>
   
    
</body>
</html>