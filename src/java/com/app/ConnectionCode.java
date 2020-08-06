package com.app;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ConnectionCode  implements ServletContextListener
{
    Connection cn=null;
    public void contextInitialized(ServletContextEvent sce) 
    {
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinequiz",
                        "root","root");
                sce.getServletContext().setAttribute("CONN", cn);
            }
            catch(Exception e)
            {
                javax.swing.JOptionPane.showMessageDialog(null, "Error is ::"+e.getMessage() );
            }
    }

    public void contextDestroyed(ServletContextEvent sce) 
    {
        
    }
    
}
