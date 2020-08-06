<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.CallableStatement"%>
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
           String _pass= request.getParameter("pass");
           String _email = request.getParameter("mail");
           int flag=0;
           
         PreparedStatement ps1=con.prepareStatement("select * from user");
            
         ResultSet rs=ps1.executeQuery();
            
            while(rs.next()){
                if((rs.getString("u_user").equals(_email)||rs.getString("u_mail").equals(_email))&&rs.getString("u_pass").equals(_pass)){
                    flag=1;
                    HttpSession s=request.getSession();
                    s.setAttribute("id",rs.getString("u_id"));
                    s.setAttribute("name",rs.getString("u_name"));
                    s.setAttribute("admin",rs.getString("u_isAdmin"));

                    response.sendRedirect("HomePage.jsp");
            }
                
            }
         if(flag!=1){
        JOptionPane.showMessageDialog(null,"Wrong Username & Password Combination");
         response.sendRedirect("Registrationpage.jsp");
         }
        %>