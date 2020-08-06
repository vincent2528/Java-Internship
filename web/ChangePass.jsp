<%-- 
    Document   : ChangePass
    Created on : Jul 2, 2020, 12:17:33 PM
    Author     : admin
--%>

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
            String _pass=(String)request.getParameter("pass");
            String _newpass=(String)request.getParameter("newpass");
            String _check=(String)request.getParameter("confpass");
            String _id=(String)request.getParameter("hidden");
            
                        Class.forName("com.mysql.jdbc.Driver");
               Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinequiz",
                        "root","root");
               
               if(!con.isClosed())
            {
                  
            PreparedStatement ps1=con.prepareStatement("select * from user where u_id = ?");
            ps1.setString(1,_id);
        
            ResultSet rs=ps1.executeQuery();
             while(rs.next())
                    {
                        if(!rs.getString("u_pass").equals(_pass)){
                            javax.swing.JOptionPane.showMessageDialog(null, "Password incorrect");
                            response.sendRedirect("EditPass.jsp");
                        }else if(!_newpass.equals(_check)){
                            javax.swing.JOptionPane.showMessageDialog(null, "New Password and Confirm Password doesn't Match");
                            response.sendRedirect("EditPass.jsp");
                        }else{
                            PreparedStatement ps=con.prepareStatement("update user set u_pass=? where u_id=?");
                            ps.setString(1,_newpass);
                            ps.setString(2,_id);
                            
                            ps.executeUpdate();
                            javax.swing.JOptionPane.showMessageDialog(null, "Password Changed Sucessfully");
                            response.sendRedirect("MyProfile.jsp");
                            
                        }
                    }
            }
            %>
    </body>
</html>
