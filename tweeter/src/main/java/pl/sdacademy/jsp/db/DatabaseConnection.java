package pl.sdacademy.jsp.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

// This class can be used to initialize the database connection
public class DatabaseConnection {
    private static Connection con;

    public static Connection getConnection()  {
        if (con != null) {
            return con;
        }
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        Properties dbProperties = new Properties();
        dbProperties.setProperty("user", "root");
        dbProperties.setProperty("password", "root");
        dbProperties.setProperty("serverTimezone", "GMT+1");
        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tweeter",
                    dbProperties);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return con;
    }

    public static void closeConnection() {
        try {
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
