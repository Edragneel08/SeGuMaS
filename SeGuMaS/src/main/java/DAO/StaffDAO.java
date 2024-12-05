/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import MODEL.staff;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

/**
 *
 * @author edrag
 */
public class StaffDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/segumas";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String INSERT_STAFF_SQL = "INSERT INTO staff (staffID, SID, ICNO, noPhone, img, email, fullname, username, password) values (?,?,?,?,?,?,?,?,?)";
    private static final String SELECT_ALL_STAFF = "SELECT * from staff";
    private static final String SELECT_STAFF_BY_ID = "SELECT staffID,fullname,username,password from staff where staffID = ?";
    private static final String UPDATE_STAFF_SQL = "UPDATE staff set SID=?, ICNO=?, noPhone=?, img=?, email=?, fullname= ?,username= ?,password= ? where staffID = ?";
    private static final String DELETE_STAFF_SQL = "DELETE from staff where staffID =?";
    private static final String SELECT_ALL_STAFF_BY_ID = "SELECT * from staff where staffID = ?";

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

    public void insertStaff(staff staff) throws SQLException {
        System.out.println(INSERT_STAFF_SQL);

        try (Connection connection = getConnection();//connect database guna method getConnection 
                 PreparedStatement ps = connection.prepareStatement(INSERT_STAFF_SQL, PreparedStatement.RETURN_GENERATED_KEYS);) { //insert data SQL
            ps.setString(1, staff.getStaffID());
            ps.setString(2, staff.getSID());
            ps.setString(3, staff.getICNO());
            ps.setString(4, staff.getNoPhone());
            ps.setBlob(5, staff.getImg());
            ps.setString(6, staff.getEmail());
            ps.setString(7, staff.getFullname());
            ps.setString(8, staff.getUsername());
            ps.setString(9, staff.getPassword());

            System.out.println(ps);
            ps.executeUpdate();

            // Retrieve the generated keys (auto-generated ID)
            try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    int id = generatedKeys.getInt(1); // Get the auto-generated ID
                    String idString = String.valueOf(id); // Convert the ID to a string
                    String SID = "stJPS_" + idString; // Construct the guardID

                    // Set the generated ID and guardID in the guardPersonalDetails object
                    staff.setStaffID(idString);
                    staff.setSID(SID);

                    // Update the guardID in the database (optional step)
                    String UPDATE_STAFF_ID_SQL = "UPDATE staff SET SID = ? WHERE staffID = ?";
                    PreparedStatement ups = connection.prepareStatement(UPDATE_STAFF_ID_SQL);

                    ups.setString(1, staff.getSID());
                    ups.setString(2, staff.getStaffID());
                    System.out.println(ups);
                    ups.executeUpdate();
                } else {
                    throw new SQLException("Inserting staff failed, no ID obtained.");
                }

            } catch (SQLException e) {
                printSQLException(e);
            }
        }
    }

    //select all staff
    public List<staff> selectAllStaff() {

        List<staff> staffs = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_STAFF);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String staffID = rs.getString("staffID");
                String fullname = rs.getString("fullname");
                String username = rs.getString("username");
                String password = rs.getString("password");
                staffs.add(new staff(staffID, fullname, username, password));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return staffs;
    }

    //select staff by id
    public staff selectStaff(String staffID) {
        staff staff = null;
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_STAFF_BY_ID);) {
            preparedStatement.setString(1, staffID);

            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {

                String SID = rs.getString("SID");
                String ICNO = rs.getString("ICNO");
                String noPhone = rs.getString("noPhone");

                InputStream imgStream = rs.getBinaryStream("img");
                String base64Img = convertInputStreamToBase64(imgStream);

                String email = rs.getString("email");
                String fullname = rs.getString("fullname");
                String username = rs.getString("username");
                String password = rs.getString("password");
                staff = new staff(staffID, SID, ICNO, noPhone, base64Img, email, fullname, username, password);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return staff;
    }

    //select ALL staff by id
    public staff getStaffById(String staffID) {
        staff staff = null;
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_STAFF_BY_ID);) {
            preparedStatement.setString(1, staffID);

            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String SID = rs.getString("SID");
                String ICNO = rs.getString("ICNO");
                String noPhone = rs.getString("noPhone");

                InputStream imgStream = rs.getBinaryStream("img");
                String base64Img = convertInputStreamToBase64(imgStream);

                String email = rs.getString("email");
                String fullname = rs.getString("fullname");
                String username = rs.getString("username");
                String password = rs.getString("password");
                staff = new staff(staffID, SID, ICNO, noPhone, base64Img, email, fullname, username, password);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return staff;
    }

    //update staff
    public boolean updateStaff(staff updateStaff) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement ps = connection.prepareStatement(UPDATE_STAFF_SQL);) {

            ps.setString(1, updateStaff.getSID());
            ps.setString(2, updateStaff.getICNO());
            ps.setString(3, updateStaff.getNoPhone());
            ps.setBlob(4, updateStaff.getImg());
            ps.setString(5, updateStaff.getEmail());
            ps.setString(6, updateStaff.getFullname());
            ps.setString(7, updateStaff.getUsername());
            ps.setString(8, updateStaff.getPassword());
            ps.setString(9, updateStaff.getStaffID());

            rowUpdated = ps.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    public boolean deleteStaff(String staffID) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_STAFF_SQL);) {
            statement.setString(1, staffID);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    // Utility method to convert InputStream to Base64 String
    private String convertInputStreamToBase64(InputStream inputStream) {
        if (inputStream == null) {
            return null;
        }
        try (ByteArrayOutputStream baos = new ByteArrayOutputStream()) {
            byte[] buffer = new byte[8192];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                baos.write(buffer, 0, bytesRead);
            }
            byte[] bytes = baos.toByteArray();
            return Base64.getEncoder().encodeToString(bytes);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
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
