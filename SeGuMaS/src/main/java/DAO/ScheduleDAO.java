/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import MODEL.Schedule;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author edrag
 */
public class ScheduleDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/segumas";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String INSERT_SCHEDULE_SQL = "INSERT INTO schedules (guardID, siteID, startDate, endDate, shift) VALUES (?, ?, ?, ?, ?)";
    private static final String SELECT_ALL_SCHEDULES = "SELECT * FROM schedules";

    protected Connection getConnection() { //mathod connection

        Connection connection = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public void insertSchedule(Schedule schedule) {
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_SCHEDULE_SQL)) {
            preparedStatement.setString(1, schedule.getGuardID());
            preparedStatement.setInt(2, schedule.getSiteID());
            preparedStatement.setString(3, schedule.getStartDate());
            preparedStatement.setString(4, schedule.getEndDate());
            preparedStatement.setString(5, schedule.getShift());

            System.out.println("Executing query: " + preparedStatement.toString());
            int rowsAffected = preparedStatement.executeUpdate();
            System.out.println("Rows affected: " + rowsAffected);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Schedule> getAllSchedules() {
        List<Schedule> schedules = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SCHEDULES)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String staffName = rs.getString("staffName");
                String siteName = rs.getString("siteName");
                String startDate = rs.getString("startDate");
                String endDate = rs.getString("endDate");
                String shift = rs.getString("shift");
                schedules.add(new Schedule(staffName, siteName, startDate, endDate, shift));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return schedules;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
