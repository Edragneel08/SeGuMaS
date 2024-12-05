package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class loginDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/segumas";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final Logger LOGGER = Logger.getLogger(loginDAO.class.getName());

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public boolean validate(String username, String password) {
        boolean status = false;
        String sql = "SELECT * FROM admin WHERE username=? AND password=?";
        try (Connection connection = getConnection(); PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {
                status = rs.next();
                System.out.println(status);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }

    public boolean validateStaff(String username, String password) {
        boolean status = false;
        String sql = "SELECT * FROM staff WHERE username=? AND password=?";
        try (Connection connection = getConnection(); PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {
                status = rs.next();
                System.out.println(status);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }

    public int getStaffId(String username, String password) {
        int staffID = -1;
        String sql = "SELECT staffID FROM staff WHERE username=? AND password=?";
        LOGGER.log(Level.INFO, "getStaffId called with username: {0}", username);
        try (Connection connection = getConnection(); PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.setString(2, password);
            LOGGER.log(Level.INFO, "PreparedStatement created: {0}", ps);

            try (ResultSet rs = ps.executeQuery()) {
                LOGGER.log(Level.INFO, "Executing query: {0}", sql);
                if (rs.next()) {
                    staffID = rs.getInt("staffID");
                    LOGGER.log(Level.INFO, "Staff ID found: {0}", staffID);
                } else {
                    LOGGER.log(Level.INFO, "No matching staff ID found for username: {0}", username);
                }
            }

        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "SQLException occurred: {0}", e.getMessage());
            e.printStackTrace();
        }
        LOGGER.log(Level.INFO, "Returning staffId: {0}", staffID);
        return staffID;
    }

    public int getAdminId(String username, String password) {
        int adminID = -1;
        String sql = "SELECT adminID FROM admin WHERE username=? AND password=?";
        LOGGER.log(Level.INFO, "getAdminId called with username: {0}", username);
        try (Connection connection = getConnection(); PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.setString(2, password);
            LOGGER.log(Level.INFO, "PreparedStatement created: {0}", ps);

            try (ResultSet rs = ps.executeQuery()) {
                LOGGER.log(Level.INFO, "Executing query: {0}", sql);
                if (rs.next()) {
                    adminID = rs.getInt("adminID");
                    LOGGER.log(Level.INFO, "Admin ID found: {0}", adminID);
                } else {
                    LOGGER.log(Level.INFO, "No matching admin ID found for username: {0}", username);
                }
            }

        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "SQLException occurred: {0}", e.getMessage());
            e.printStackTrace();
        }
        LOGGER.log(Level.INFO, "Returning adminId: {0}", adminID);
        return adminID;
    }
}
