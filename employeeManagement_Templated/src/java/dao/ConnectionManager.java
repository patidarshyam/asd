package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionManager {
    public static Connection con;
    static 
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/batch7?zeroDateTimeBehavior=convertToNull", "root", "root");
        }
        catch(Exception e)
        {
            System.out.println("Error@Connection : "+e.toString());
        }
    }
}
