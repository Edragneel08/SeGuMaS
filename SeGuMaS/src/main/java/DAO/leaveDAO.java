/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import MODEL.leave;
import MODEL.site;
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
public class leaveDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/segumas";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String INSERT_LEAVE_SQL = "INSERT INTO guardLeave (leaveID, guardID, guardName, leaveType, startDate, endDate, reason, status) values (?,?,?,?,?,?,?,?)";
    private static final String SELECT_ALL_LEAVE = "SELECT * from guardLeave";
    private static final String SELECT_LEAVE_BY_ID = "SELECT guardID, guardName, leaveType, startDate, endDate, reason from guardLeave where leaveID = ?";
    private static final String UPDATE_SITE_SQL = "UPDATE site set siteName= ?,siteAddress= ?,startDate= ?,endDate= ?,location= ?,status= ? where siteID = ?";
    private static final String UPDATE_LEAVE_STATUS_SQL = "UPDATE guardLeave set status= ? where leaveID = ?";
    private static final String UPDATE_LEAVE_DETAILS_SQL = "UPDATE guardLeave SET leaveType = ?, startDate = ?, endDate = ?, reason = ? WHERE leaveID = ?";
    private static final String DELETE_LEAVE_SQL = "DELETE from guardLeave where  leaveID=?";
    private static final String COUNT_LEAVE_SQL = "SELECT status, COUNT(status) AS count FROM guardleave GROUP BY status;";

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

    public void insertLeave(leave leave) {
        System.out.println(INSERT_LEAVE_SQL);

        try (Connection connection = getConnection();//connect database guna method getConnection 
                 PreparedStatement ps = connection.prepareStatement(INSERT_LEAVE_SQL);) { //insert data SQL

            ps.setInt(1, leave.getLeaveID());
            ps.setString(2, leave.getGuardID());
            ps.setString(3, leave.getGuardName());
            ps.setString(4, leave.getLeaveType());
            ps.setString(5, leave.getStartDate());
            ps.setString(6, leave.getEndDate());
            ps.setString(7, leave.getReason());
            ps.setString(8, leave.getStatus());

            System.out.println(ps);
            ps.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    //select all staff
    public List<leave> selectAllLeave() {

        List<leave> leaves = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_LEAVE);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {

                int leaveID = rs.getInt("leaveID");
                String guardID = rs.getString("guardID");
                String guardName = rs.getString("guardName");
                String leaveType = rs.getString("leaveType");
                String startDate = rs.getString("startDate");
                String endDate = rs.getString("endDate");
                String reason = rs.getString("reason");
                String status = rs.getString("status");

                leaves.add(new leave(leaveID, guardID, guardName, leaveType, startDate, endDate, reason, status));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return leaves;
    }

    //select LEAVE by id
    public leave selectLeave(int leaveID) {
        leave leave = null;
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_LEAVE_BY_ID);) {
            preparedStatement.setInt(1, leaveID);

            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String guardID = rs.getString("guardID");
                String guardName = rs.getString("guardName");
                String leaveType = rs.getString("leaveType");
                String startDate = rs.getString("startDate");
                String endDate = rs.getString("endDate");
                String reason = rs.getString("reason");
                leave = new leave(leaveID, guardID, guardName, leaveType, startDate, endDate, reason);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return leave;
    }

    //update updateLeaveDetails 
    public boolean updateLeaveDetails(leave updateGuardLeave) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement ps = connection.prepareStatement(UPDATE_LEAVE_DETAILS_SQL);) {

            ps.setString(1, updateGuardLeave.getLeaveType());
            ps.setString(2, updateGuardLeave.getStartDate());
            ps.setString(3, updateGuardLeave.getEndDate());
            ps.setString(4, updateGuardLeave.getReason());
            ps.setInt(5, updateGuardLeave.getLeaveID());

            rowUpdated = ps.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    //update sITE
    public boolean updateLeaveStatus(leave updateLeave) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement ps = connection.prepareStatement(UPDATE_LEAVE_STATUS_SQL);) {

            ps.setString(1, updateLeave.getStatus());
            ps.setInt(2, updateLeave.getLeaveID());

            rowUpdated = ps.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    public boolean deleteLeave(int leaveID) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_LEAVE_SQL);) {
            statement.setInt(1, leaveID);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    //COUNT LEAVE BY GROUP
    public List<leave> selectAllLeaveCounts() {
        List<leave> leaveCounts = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(COUNT_LEAVE_SQL)) {

            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String status = rs.getString("status");
                int count = rs.getInt("count");
                System.out.println(status+" : "+count);
                leaveCounts.add(new leave(status, count));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return leaveCounts;
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
