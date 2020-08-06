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
           String _name= request.getParameter("username");
           String _email = request.getParameter("email");
           String _contact = request.getParameter("contact");
           String _pass = request.getParameter("passid");
           String _user =request.getParameter("uname");
           int flag=0;
           
           PreparedStatement ps1=con.prepareStatement("select * from user");
            
           ResultSet rs=ps1.executeQuery();
           
           while(rs.next()){
               if(rs.getString("u_user").equals(_user)){
                     javax.swing.JOptionPane.showMessageDialog(null, "Username not available");
                     flag=1;
               }else if(rs.getString("u_mail").equals(_email)){
                     javax.swing.JOptionPane.showMessageDialog(null, "E-mail already registered");
                     flag=1;
               }else if(rs.getString("u_contact").equals(_contact)){
                     javax.swing.JOptionPane.showMessageDialog(null, "Contact no. already registered");
                     flag=1;
               }
           }
           
           if(flag==1){
               response.sendRedirect("Registrationpage.jsp");
           }else{
           
           CallableStatement csbt = con.prepareCall("{call sign_up(?,?,?,?,?)}"); 
           csbt.setString(1,_name);
           csbt.setString(2,_email);
           csbt.setString(3,_contact);
           csbt.setString(4,_pass);
           csbt.setString(5,_user);
           
          csbt.execute();
          
          ps1=con.prepareStatement("select * from user");
            
         rs=ps1.executeQuery();
            
            while(rs.next()){if(rs.getString("u_user").equals(_user)){
                                                
                    HttpSession s=request.getSession();
                    s.setAttribute("id",rs.getString("u_id"));
                    s.setAttribute("name",rs.getString("u_name"));
                    s.setAttribute("admin",rs.getString("u_isAdmin"));

                    response.sendRedirect("HomePage.jsp");
            }
            }
           }
        %>
    </body>
</html>