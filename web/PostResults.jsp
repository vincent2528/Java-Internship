<%-- 
    Document   : PostResults
    Created on : Jun 28, 2020, 7:37:32 PM
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
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinequiz",
                        "root","root");
                        
                        Statement myStat = null;
                        ResultSet myRs = null;
                        myStat = con.createStatement();
            
                        myRs = myStat.executeQuery("select * from results");
                        while(myRs.next()){
                        if(myRs.getString("r_posted").equals("0")) {
                            PreparedStatement ps=con.prepareStatement("update results set r_posted=? where r_id=?");
                            ps.setString(1,"1");
                            ps.setString(2,myRs.getString("r_id"));
                    
                            ps.executeUpdate();
                        }
                        }
                        javax.swing.JOptionPane.showMessageDialog(null, "Record Updated");

                        
                        response.sendRedirect("ResultsPage.jsp");
                        
                        %>
    </body>
</html>
