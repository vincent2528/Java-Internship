<%-- 
    Document   : MakeAdmin
    Created on : Jul 2, 2020, 12:44:31 PM
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

            String _id=(String)session.getAttribute("editId");
            
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
                            PreparedStatement ps=con.prepareStatement("update user set u_isAdmin=? where u_id=?");
                            ps.setString(1,"1");
                            ps.setString(2,_id);
                            
                            ps.executeUpdate();
                            javax.swing.JOptionPane.showMessageDialog(null, "User Set as Admin");
                            response.sendRedirect("HomePage.jsp");                        
                    }
            }
               %>
    </body>
</html>
