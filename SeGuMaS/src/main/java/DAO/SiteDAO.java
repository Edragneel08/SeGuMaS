/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import MODEL.site;
import MODEL.staff;
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
public class SiteDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/segumas";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String INSERT_SITE_SQL = "INSERT INTO site (siteID, siteName, siteAddress, startDate, endDate, location, status) values (?,?,?,?,?,?,?)";
    private static final String SELECT_ALL_SITE = "SELECT * from site";
    private static final String SELECT_SITE_BY_ID = "SELECT siteID, siteName, siteAddress, startDate, endDate, location, status from SITE where siteID = ?";
    private static final String UPDATE_SITE_SQL = "UPDATE site set siteName= ?,siteAddress= ?,startDate= ?,endDate= ?,location= ?,status= ? where siteID = ?";
    private static final String DELETE_SITE_SQL = "DELETE from site where siteID =?";

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

    public void insertSite(site site) {
        System.out.println(INSERT_SITE_SQL);

        try (Connection connection = getConnection();//connect database guna method getConnection 
                 PreparedStatement ps = connection.prepareStatement(INSERT_SITE_SQL);) { //insert data SQL

            ps.setString(1, site.getSiteID());
            ps.setString(2, site.getSiteName());
            ps.setString(3, site.getSiteAddress());
            ps.setString(4, site.getStartDate());
            ps.setString(5, site.getEndDate());
            ps.setString(6, site.getLocation());
            ps.setString(7, site.getStatus());

            System.out.println(ps);
            ps.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    //select all staff
    public List<site> selectAllSite() {

        List<site> sites = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SITE);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String siteID = rs.getString("siteID");
                String siteName = rs.getString("siteName");
                String siteAddress = rs.getString("siteAddress");
                String startDate = rs.getString("startDate");
                String endDate = rs.getString("endDate");
                String location = rs.getString("location");
                String status = rs.getString("status");

                sites.add(new site(siteID, siteName, siteAddress, startDate, endDate, location, status));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return sites;
    }
    

    //select site by id
    public site selectSite(String siteID) {
        site site = null;
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_SITE_BY_ID);) {
            preparedStatement.setString(1, siteID);

            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String siteName = rs.getString("siteName");
                String siteAddress = rs.getString("siteAddress");
                String startDate = rs.getString("startDate");
                String endDate = rs.getString("endDate");
                String location = rs.getString("location");
                String status = rs.getString("status");
                site = new site(siteID, siteName, siteAddress, startDate, endDate, location, status);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return site;
    }

    //update sITE
    public boolean updateSite(site updateSite) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement ps = connection.prepareStatement(UPDATE_SITE_SQL);) {
            ps.setString(1, updateSite.getSiteName());
            ps.setString(2, updateSite.getSiteAddress());
            ps.setString(3, updateSite.getStartDate());
            ps.setString(4, updateSite.getEndDate());
            ps.setString(5, updateSite.getLocation());
            ps.setString(6, updateSite.getStatus());
            ps.setString(7, updateSite.getSiteID());

            rowUpdated = ps.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    public boolean deleteSite(String siteID) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_SITE_SQL);) {
            statement.setString(1, siteID);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
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
