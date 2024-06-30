package sumyearrelization.Settings;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataBaseHandler {
    public Connection getDbConnection() {
        String dbUrl = "jdbc:sqlserver://localhost:1433;databaseName=SumYear;";
        String username = "sa";
        String password = "aaaa_1111";

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection sqlServerDbConnection = DriverManager.getConnection(dbUrl, username, password);
            return sqlServerDbConnection;
        } catch (ClassNotFoundException e) {
            System.out.println("Ошибка при загрузке драйвера SQL Server.");
            e.printStackTrace();
            return null;
        } catch (SQLException e) {
            System.out.println("SQL Server error: " + e.getMessage());
            return null;
        }
    }
}