package Settings;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataBaseHandler {
    public Connection getDbConnection() {
        String DbUrl = "jdbc:mysql://root:strong_pass@localhost:3307/Orders";
        try {
            Connection MSSQLDBConn = DriverManager.getConnection(DbUrl);
            return MSSQLDBConn;
        }
        catch (SQLException e) {
            System.out.println("MSSQL error: " + e.getMessage());
            return null;
        }
    }
}
