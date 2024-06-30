package Settings;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataBaseHandler {
    public Connection getDbConnection() {
        String dbUrl = "jdbc:mysql://localhost:3306/Users?user=root&password=strong_pass";
        try {
            Connection connection = DriverManager.getConnection(dbUrl);
            return connection;
        } catch (SQLException e) {
            System.out.println("MySQL error: " + e.getMessage());
            return null;
        }
    }
}