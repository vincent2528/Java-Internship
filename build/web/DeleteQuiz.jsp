<%-- 
    Document   : NewQuiz
    Created on : Jun 24, 2020, 12:00:16 AM
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
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css"/>
    <link rel="stylesheet" type="text/css" href="app2.css">
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
</head>
<body>
    <%
        HttpSession s=request.getSession();
            Class.forName("com.mysql.jdbc.Driver");
               Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinequiz",
                        "root","root");
            String paramName=null;
            Enumeration paramNames = request.getParameterNames();
               paramName= null;
               while(paramNames.hasMoreElements()) {
                    paramName = (String)paramNames.nextElement();
                    out.println(paramName);
               }
               s.setAttribute(("q_id"), paramName);
                 if(!con.isClosed())
            {
                  
            PreparedStatement ps=con.prepareStatement("delete from quiz where q_id = ?");
                       ps.setString(1, paramName);
                        int  a1=ps.executeUpdate();
                        if(a1>0)
                        {
                            javax.swing.JOptionPane.showMessageDialog(null,"Quiz deleted sucessfully"); 

                     response.sendRedirect("QuizPage.jsp");
                         }
                        else
                        {
                            javax.swing.JOptionPane.showMessageDialog(null,"Something went wrong"); 
                                                 response.sendRedirect("HomePage.jsp");

                        }
            }        
            %>
</body>
</html>
