import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil {

    private static final String BASE_URL = "jdbc:mysql://localhost:3306/?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
    private static final String DB_URL = "jdbc:mysql://localhost:3306/login_db?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            initializeDatabase();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("MySQL JDBC Driver not found in WEB-INF/lib!", e);
        }
    }

    /**
     * Automatically creates the 'login_db' database, 'users' table,
     * and sample users if they do not exist yet.
     */
    private static void initializeDatabase() {
        try (Connection conn = DriverManager.getConnection(BASE_URL, DB_USER, DB_PASSWORD);
             Statement stmt = conn.createStatement()) {

            stmt.executeUpdate("CREATE DATABASE IF NOT EXISTS login_db");
            stmt.executeUpdate("USE login_db");
            stmt.executeUpdate(
                "CREATE TABLE IF NOT EXISTS users (" +
                "id INT AUTO_INCREMENT PRIMARY KEY, " +
                "username VARCHAR(50) NOT NULL UNIQUE, " +
                "password VARCHAR(100) NOT NULL, " +
                "full_name VARCHAR(100) NOT NULL" +
                ")"
            );

            stmt.executeUpdate(
                "INSERT IGNORE INTO users (username, password, full_name) VALUES " +
                "('admin', 'admin123', 'System Administrator'), " +
                "('saurabh', 'pass123', 'Saurabh Sharma')"
            );
        } catch (SQLException e) {
            System.err.println("Database auto-initialization warning: " + e.getMessage());
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }

    /**
     * Verifies username and password against the MySQL users table.
     * Returns the user's full_name if valid, or null if invalid.
     */
    public static String validateUser(String username, String password) throws SQLException {
        String sql = "SELECT full_name FROM users WHERE username = ? AND password = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("full_name");
                }
            }
        }
        return null;
    }
}
