/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import MODEL.guard;
import MODEL.guardEduBg;
import MODEL.guardExArmyOrPolice;
import MODEL.guardFamilyDetails;
import MODEL.guardPersonalDetails;
import MODEL.guardPreviousJob;
import MODEL.guardReference;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.logging.Logger;

/**
 *
 * @author edrag
 */
public class guardDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/segumas";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    //insert
    private static final String INSERT_GUARD_SQL = "INSERT INTO guardpersonaldetails (guardID, img, guardSalary, guardName, guardICNO, guardAddress, guardPhoneNo, nationality, guardDOB, guardPOB, guardEPFNo, religion, guardGender, guardSocsoNo, guardRace, guardAccNo, guardNOB, guardStatus,dateWorkStart,dateContractEnd) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    private static final String INSERT_GUARD2_SQL = "INSERT INTO guardFamilyDetails (guardID, maritalStatus, guardSpName, guardFamOccu, guardFamNoP1, guardNumOfChild, guardSpAdd, guardFN, guardFOccu, guardMomName, guardMomOccu, guardParentAdd) values (?,?,?,?,?,?,?,?,?,?,?,?)";
    private static final String INSERT_GUARD3_SQL = "INSERT INTO guardedubg (guardID, school, state, dateStart, dateTo) values (?,?,?,?,?)";
    private static final String INSERT_GUARD4_SQL = "INSERT INTO guardprevjob (guardID, employerName, positionHeld, dateStart, dateTo, EA, RoL) values (?,?,?,?,?,?,?)";
    private static final String INSERT_GUARD5_SQL = "INSERT INTO guardexpolorarmy (guardID, exArmyOrPolice, guardServiceNo, guardPosition, dateStart, dateTo, guardBranch, guardRFLPA) values (?,?,?,?,?,?,?,?)";
    private static final String INSERT_GUARD6_SQL = "INSERT INTO guardreference (referenceId, guardID, guardReferName, guardReferJob, guardReferAddress, guardReferRelation, guardReferPhoneNo) VALUES (?,?,?,?,?,?,?)";

    //select
    private static final String SELECT_ALL_GUARD = "SELECT * from guardprofile";
    private static final String SELECT_GUARD_PERDETAILS = "SELECT guardID, siteID, img, guardName,guardICNO,guardAddress,guardPhoneNo,guardStatus FROM guardpersonaldetails";
    private static final String SELECT_GUARD_BY_ID = "SELECT guardID, img, guardSalary, guardName, guardICNO, guardAddress, guardPhoneNo, nationality, guardDOB, guardPOB, guardEPFNo, religion, guardGender, guardSocsoNo, guardRace, guardAccNo, guardNOB, guardStatus,dateWorkStart,dateContractEnd from guardpersonaldetails where guardID = ?";
    private static final String SELECT_ALL_GUARD_FAM = "SELECT * FROM guardfamilydetails WHERE guardID = ?";
    private static final String SELECT_ALL_GUARD_EDU = "SELECT * FROM `guardedubg` WHERE guardID=?";
    private static final String SELECT_ALL_GUARD_PREVJOB = "SELECT * FROM `guardprevjob` WHERE guardID=?";
    private static final String SELECT_ALL_GUARD_EXARMYPOLICE = "SELECT * FROM guardexpolorarmy WHERE guardID = ?";
    private static final String SELECT_ALL_GUARD_REFER_BY_ID = "SELECT * FROM guardreference WHERE guardID = ?";
    //join table select
    private static final String JOIN_SELECT_SITE_SQL = "SELECT g.*, s.siteName, s.siteAddress FROM guardpersonaldetails g LEFT JOIN site s ON g.siteID = s.siteID;";

    //update
    private static final String UPDATE_GUARD_SQL = "UPDATE guardprofile set guardName=?, guardAge=?, guardGender=?, guardPhoneNo=?, guardEmail=?, nationality=?, guardRace=?, guardSalary=?, guardDOB=?, branchID=?, siteID=? where guardID = ?";
    private static final String UPDATE_GUARD_BY_ID = "UPDATE guardpersonaldetails "
            + "SET guardSalary = ?, guardName = ?, guardICNO = ?, guardAddress = ?, "
            + "guardPhoneNo = ?, nationality = ?, guardDOB = ?, guardPOB = ?, guardEPFNo = ?, "
            + "religion = ?, guardGender = ?, guardSocsoNo = ?, guardRace = ?, guardAccNo = ?, "
            + "guardNOB = ?, guardStatus = ?, dateWorkStart = ?, dateContractEnd = ? WHERE guardID = ?";

    private static final String UPDATE_GUARD_FAMILY_BY_ID = "UPDATE guardfamilydetails "
            + "SET maritalStatus = ?, guardSpName = ?, guardFamOccu = ?, guardFamNoP1 = ?, "
            + "guardNumOfChild = ?, guardSpAdd = ?, guardFN = ?, guardFOccu = ?, guardMomName = ?, "
            + "guardMomOccu = ?, guardParentAdd = ? WHERE guardID = ?";

    private static final String UPDATE_EDU = "UPDATE guardedubg SET school = ?, state = ?, dateStart = ?, dateTo = ? WHERE id = ?";
    private static final String UPDATE_PREVJOB = "UPDATE guardprevjob SET employerName = ?, positionHeld = ?, dateStart = ?, dateTo = ?, EA = ? WHERE prevJobId = ?";
    private static final String UPDATE_GUARD_POLAR_SQL = "UPDATE guardexpolorarmy set exArmyOrPolice=?, guardServiceNo=?, guardPosition=?, dateStart=?, dateTo=?, guardBranch=?, guardRFLPA=? where guardID = ?";
    private static final String UPDATE_GUARD_REFER_SQL = "UPDATE guardreference set guardReferName=?, guardReferJob=?, guardReferAddress=?, guardReferRelation=?, guardReferPhoneNo=? where guardID = ?";
    private static final String UPDATE_GUARD_SITE_SQL = "UPDATE guardpersonaldetails set siteID=? where guardID = ?";

    //delete
    private static final String DELETE_GUARD_PERSONAL_SQL = "DELETE from guardpersonaldetails where guardID =?";
    private static final String DELETE_GUARD_EDU_SQL = "DELETE from guardedubg where guardID =?";
    private static final String DELETE_GUARD_REFER_SQL = "DELETE from guardreference where guardID =?";
    private static final String DELETE_GUARD_PREVJOB_SQL = "DELETE from guardprevjob where guardID =?";
    private static final String DELETE_GUARD_FAMDETAILS_SQL = "DELETE from guardfamilydetails where guardID =?";
    private static final String DELETE_GUARD_EXU_SQL = "DELETE from guardexpolorarmy where guardID =?";

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

    //insert personal details untuk guard sahaja 
    public String insertGuard(guardPersonalDetails newGuard) {
        System.out.println(INSERT_GUARD_SQL);
        String guardID = null;

        try (Connection connection = getConnection();//connect database guna method getConnection 
                 PreparedStatement ps = connection.prepareStatement(INSERT_GUARD_SQL, PreparedStatement.RETURN_GENERATED_KEYS);) { //insert data SQL
            ps.setString(1, newGuard.getGuardID());
            ps.setBlob(2, newGuard.getImg());
            ps.setString(3, newGuard.getGuardSalary());
            ps.setString(4, newGuard.getGuardName());
            ps.setString(5, newGuard.getGuardICNO());
            ps.setString(6, newGuard.getGuardAddress());
            ps.setString(7, newGuard.getGuardPhoneNo());
            ps.setString(8, newGuard.getNationality());
            ps.setString(9, newGuard.getGuardDOB());
            ps.setString(10, newGuard.getGuardPOB());
            ps.setString(11, newGuard.getGuardEPFNo());
            ps.setString(12, newGuard.getReligion());
            ps.setString(13, newGuard.getGuardGender());
            ps.setString(14, newGuard.getGuardSocsoNo());
            ps.setString(15, newGuard.getGuardRace());
            ps.setString(16, newGuard.getGuardAccNo());
            ps.setString(17, newGuard.getGuardNOB());
            ps.setString(18, newGuard.getGuardStatus());
            ps.setString(19, newGuard.getDateWorkStart());
            ps.setString(20, newGuard.getDateContractEnd());
            System.out.println(ps);

            int affectedRows = ps.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Inserting guard failed, no rows affected.");
            }

            // Retrieve the generated keys (auto-generated ID)
            try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    int id = generatedKeys.getInt(1); // Get the auto-generated ID
                    guardID = "JPS" + id; // Construct the guardID

                    // Set the generated ID and guardID in the guardPersonalDetails object
                    newGuard.setId(id);
                    newGuard.setGuardID(guardID);

                    // Update the guardID in the database (optional step)
                    updateGuardID(newGuard);

                    // Create a new guardFamilyDetails object and set guardID
                    guardFamilyDetails newGuard2 = new guardFamilyDetails(guardID);
                    newGuard2.setGuardID(guardID);

                    // Insert guardFamilyDetails (assuming insertGuard2 method is correctly implemented)
                    //insertGuard2(newGuard2);
                    // Assuming guardID is obtained and not null
                    System.out.println("Guard saved successfully with ID: " + newGuard.getGuardID());

                } else {
                    throw new SQLException("Inserting guard failed, no ID obtained.");
                }
            }

        } catch (SQLException e) {
            printSQLException(e);
            e.printStackTrace();
        }

        return guardID;
    }

    //update for guardID ONLY >> BUAT UNTUK GUARD ID GABUNG DENGAN AUTO INCREMENT ID
    // Method to update the guardID in the database
    private void updateGuardID(guardPersonalDetails guard) {
        String UPDATE_GUARD_ID_SQL = "UPDATE guardpersonaldetails SET guardID = ? WHERE id = ?";

        String guardID = guard.getGuardID();

        try (Connection connection = getConnection(); PreparedStatement ps = connection.prepareStatement(UPDATE_GUARD_ID_SQL)) {

            System.out.println("hello" + guard.getId() + " Guard Id : " + guard.getGuardID());
            System.out.println(guard.getGuardID());
            ps.setString(1, guard.getGuardID());
            ps.setInt(2, guard.getId()); // Assuming you have a method to get the auto-generated id

            ps.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
            e.printStackTrace();
        }

    }

    //INSERT NEW GUARD (FAMILY DETAILS)
    public void insertGuard2(guardFamilyDetails newGuard2) {
        System.out.println(INSERT_GUARD2_SQL);

        String id = newGuard2.getGuardID();
        newGuard2.setGuardID(id);

        try (Connection connection = getConnection();//connect database guna method getConnection 
                 PreparedStatement ps = connection.prepareStatement(INSERT_GUARD2_SQL);) { //insert data SQL

            System.out.println("==================");
            System.out.println("hello -- > " + newGuard2.getGuardID());
            newGuard2.setGuardID(id);
            System.out.println("==================");
            System.out.println("hello -- > " + newGuard2.getGuardID());
            System.out.println("id -- > " + id);

            ps.setString(1, newGuard2.getGuardID());
            ps.setString(2, newGuard2.getMaritalStatus());
            ps.setString(3, newGuard2.getGuardSpName());
            ps.setString(4, newGuard2.getGuardFamOccu());
            ps.setString(5, newGuard2.getGuardFamNoP1());
            ps.setString(6, newGuard2.getGuardNumOfChild());
            ps.setString(7, newGuard2.getGuardSpAdd());
            ps.setString(8, newGuard2.getGuardFN());
            ps.setString(9, newGuard2.getGuardFOccu());
            ps.setString(10, newGuard2.getGuardMomName());
            ps.setString(11, newGuard2.getGuardMomOccu());
            ps.setString(12, newGuard2.getGuardParentAdd());
            System.out.println(ps);

            int affectedRows = ps.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
            e.printStackTrace();
        }
    }

    //insert guard 3 for guard Edu Bg
    public void insertGuard3(List<guardEduBg> eduBgList) {
        System.out.println(INSERT_GUARD3_SQL);

        try (Connection connection = getConnection();//connect database guna method getConnection 
                 PreparedStatement ps = connection.prepareStatement(INSERT_GUARD3_SQL);) { //insert data SQL

            for (guardEduBg eduBg : eduBgList) {
                System.out.println("==================");
                System.out.println("hello Insert Guard Edu -- > " + eduBg.getGuardID());

                ps.setString(1, eduBg.getGuardID());
                ps.setString(2, eduBg.getSchool());
                ps.setString(3, eduBg.getState());
                ps.setString(4, eduBg.getDateStart());
                ps.setString(5, eduBg.getDateTo());
                ps.addBatch(); // Add to batch for efficient batch insertion
                System.out.println(ps);
            }

            // Execute batch insert
            int[] affectedRows = ps.executeBatch();

        } catch (SQLException e) {
            printSQLException(e);
            e.printStackTrace();
        }
    }

    //insert guard 3 for guard Edu Bg
    public void insertGuard4(List<guardPreviousJob> previousJobList) {
        System.out.println(INSERT_GUARD4_SQL);

        try (Connection connection = getConnection();//connect database guna method getConnection 
                 PreparedStatement ps = connection.prepareStatement(INSERT_GUARD4_SQL);) { //insert data SQL

            for (guardPreviousJob prevJob : previousJobList) {
                System.out.println("==================");
                System.out.println("hello Insert Guard Previous Job -- > " + prevJob.getGuardID());

                ps.setString(1, prevJob.getGuardID());
                ps.setString(2, prevJob.getEmployerName());
                ps.setString(3, prevJob.getPositionHeld());
                ps.setString(4, prevJob.getDateStart());
                ps.setString(5, prevJob.getDateTo());
                ps.setString(6, prevJob.getEA());
                ps.setString(7, prevJob.getRoL());
                ps.addBatch(); // Add to batch for efficient batch insertion
                System.out.println(ps);
            }

            // Execute batch insert
            int[] affectedRows = ps.executeBatch();

        } catch (SQLException e) {
            printSQLException(e);
            e.printStackTrace();
        }
    }

    //insert guard 5 for guardExArmyOrPolice
    public void insertGuard5(guardExArmyOrPolice newGuard5) {
        System.out.println(INSERT_GUARD5_SQL);

        try (Connection connection = getConnection();//connect database guna method getConnection 
                 PreparedStatement ps = connection.prepareStatement(INSERT_GUARD5_SQL);) { //insert data SQL

            System.out.println("==================");
            System.out.println("hello Insert Guard Ex Army or Police -- > " + newGuard5.getGuardID());

            ps.setString(1, newGuard5.getGuardID());
            ps.setString(2, newGuard5.getExArmyOrPolice());
            ps.setString(3, newGuard5.getGuardServiceNo());
            ps.setString(4, newGuard5.getGuardPosition());
            ps.setString(5, newGuard5.getDateStart());
            ps.setString(6, newGuard5.getDateTo());
            ps.setString(7, newGuard5.getGuardBranch());
            ps.setString(8, newGuard5.getGuardRFLPA());
            System.out.println(ps);

            // Execute batch insert
            int affectedRows = ps.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
            e.printStackTrace();
        }
    }

    //insert guard 6 for guard reference
    public void insertGuard6(guardReference newGuard6) {
        System.out.println(INSERT_GUARD6_SQL);

        try (Connection connection = getConnection();//connect database guna method getConnection 
                 PreparedStatement ps = connection.prepareStatement(INSERT_GUARD6_SQL);) { //insert data SQL

            System.out.println("==================");
            System.out.println("hello Insert guard reference -- > " + newGuard6.getGuardID());

            ps.setString(1, "0");
            ps.setString(2, newGuard6.getGuardID());
            ps.setString(3, newGuard6.getGuardReferName());
            ps.setString(4, newGuard6.getGuardReferJob());
            ps.setString(5, newGuard6.getGuardReferAddress());
            ps.setString(6, newGuard6.getGuardReferRelation());
            ps.setString(7, newGuard6.getGuardReferPhoneNo());
            System.out.println(ps);

            // Execute batch insert
            int affectedRows = ps.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
            e.printStackTrace();
        }
    }

    //select all staff
//    public List<guard> selectAllGuard() {
//
//        List<guard> guards = new ArrayList<>();
//        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_GUARD);) {
//            System.out.println(preparedStatement);
//            ResultSet rs = preparedStatement.executeQuery();
//
//            while (rs.next()) {
//                String guardID = rs.getString("guardID");
//                String guardName = rs.getString("guardName");
//                int guardAge = rs.getInt("guardAge");
//                String guardGender = rs.getString("guardGender");
//                String guardPhoneNo = rs.getString("guardPhoneNo");
//                String guardEmail = rs.getString("guardEmail");
//                String nationality = rs.getString("nationality");
//                String guardRace = rs.getString("guardRace");
//                double guardSalary = rs.getDouble("guardSalary");
//                String guardDOB = rs.getString("guardDOB");
//                String branchID = rs.getString("branchID");
//                String siteID = rs.getString("siteID");
//
//                System.out.println(guardID);
//
//                guards.add(new guard(guardID, guardName, guardAge, guardGender, guardPhoneNo, guardEmail, nationality, guardRace, guardSalary, guardDOB, branchID, siteID));
//            }
//        } catch (SQLException e) {
//            printSQLException(e);
//        }
//        return guards;
//    }
    //SELECT_GUARD_PERDETAILS
    public List<guardPersonalDetails> selectAllGuardPersonalDetails() {
        List<guardPersonalDetails> guards = new ArrayList<>();
        // Initialize a logger for logging siteID values
        Logger logger = Logger.getLogger(getClass().getName());

        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(JOIN_SELECT_SITE_SQL); ResultSet rs = preparedStatement.executeQuery()) {
            while (rs.next()) {
                String guardID = rs.getString("guardID");
                int siteID = rs.getInt("siteID");
                String guardName = rs.getString("guardName");
                String guardICNO = rs.getString("guardICNO");
                String guardAddress = rs.getString("guardAddress");
                String guardPhoneNo = rs.getString("guardPhoneNo");

                InputStream imgStream = rs.getBinaryStream("img");
                String base64Img = convertInputStreamToBase64(imgStream);

                String guardStatus = rs.getString("guardStatus");
                String siteName = rs.getString("siteName");
                String siteAddress = rs.getString("siteAddress");

                // Log the siteID value for debugging purposes
                logger.info("Site ID for guardID " + guardID + ": " + siteID);

                guards.add(new guardPersonalDetails(guardID, siteID, base64Img, guardName, guardICNO, guardAddress, guardPhoneNo, guardStatus, siteName, siteAddress));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return guards;
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

//    //select guard by id
    public guardPersonalDetails selectGuard(String guardID) {
        guardPersonalDetails guardPersonalDetail = null;
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_GUARD_BY_ID);) {
            preparedStatement.setString(1, guardID);

            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {

                InputStream imgStream = rs.getBinaryStream("img");
                String base64Img = convertInputStreamToBase64(imgStream);
                String guardSalary = rs.getString("guardSalary");
                String guardName = rs.getString("guardName");
                String guardICNO = rs.getString("guardICNO");
                String guardAddress = rs.getString("guardAddress").trim();
                String guardPhoneNo = rs.getString("guardPhoneNo");
                String nationality = rs.getString("nationality");
                String guardDOB = rs.getString("guardDOB");
                String guardPOB = rs.getString("guardPOB");
                String guardEPFNo = rs.getString("guardEPFNo");
                String religion = rs.getString("religion");
                String guardGender = rs.getString("guardGender");
                String guardSocsoNo = rs.getString("guardSocsoNo");
                String guardRace = rs.getString("guardRace");
                String guardAccNo = rs.getString("guardAccNo");
                String guardNOB = rs.getString("guardNOB");
                String guardStatus = rs.getString("guardStatus");
                String dateWorkStart = rs.getString("dateWorkStart");
                String dateContractEnd = rs.getString("dateContractEnd");

                System.out.println(guardID);
                guardPersonalDetail = new guardPersonalDetails(guardID, base64Img, guardSalary, guardName, guardICNO, guardAddress, guardPhoneNo, nationality, guardDOB, guardPOB, guardEPFNo, religion, guardGender, guardSocsoNo, guardRace, guardAccNo, guardNOB, guardStatus, dateWorkStart, dateContractEnd);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return guardPersonalDetail;
    }

    //guard fam BY ID
    public guardFamilyDetails selectGuardFam(String guardID) {
        guardFamilyDetails guardFamilyDetail = null;
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_GUARD_FAM);) {
            preparedStatement.setString(1, guardID);

            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String maritalStatus = rs.getString("maritalStatus");
                String guardSpName = rs.getString("guardSpName");
                String guardFamOccu = rs.getString("guardFamOccu");
                String guardFamNoP1 = rs.getString("guardFamNoP1").trim();
                String guardNumOfChild = rs.getString("guardNumOfChild");
                String guardSpAdd = rs.getString("guardSpAdd");
                String guardFN = rs.getString("guardFN");
                String guardFOccu = rs.getString("guardFOccu");
                String guardMomName = rs.getString("guardMomName");
                String guardMomOccu = rs.getString("guardMomOccu");
                String guardParentAdd = rs.getString("guardParentAdd");

                System.out.println(guardID);
                guardFamilyDetail = new guardFamilyDetails(guardID, maritalStatus, guardSpName, guardFamOccu, guardFamNoP1, guardNumOfChild, guardSpAdd, guardFN, guardFOccu, guardMomName, guardMomOccu, guardParentAdd);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return guardFamilyDetail;
    }

    //guard edu 
    public List<guardEduBg> selectGuardEDU(String guardID) {
        List<guardEduBg> guardEduList = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_GUARD_EDU)) {
            preparedStatement.setString(1, guardID);

            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String school = rs.getString("school");
                String state = rs.getString("state");
                String dateStart = rs.getString("dateStart");
                String dateTo = rs.getString("dateTo");

                System.out.println(guardID);
                guardEduBg guardEdu = new guardEduBg(id, guardID, school, state, dateStart, dateTo);
                guardEduList.add(guardEdu);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return guardEduList;
    }

    //select guard previous job
    public List<guardPreviousJob> selectGuardPrevJob(String guardID) {
        List<guardPreviousJob> guardPreviousJobList = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_GUARD_PREVJOB)) {

            preparedStatement.setString(1, guardID);

            System.out.println("Executing query: " + preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int prevJobId = rs.getInt("prevJobId");
                String employerName = rs.getString("employerName");
                String positionHeld = rs.getString("positionHeld");
                String dateStart = rs.getString("dateStart");
                String dateTo = rs.getString("dateTo");
                String EA = rs.getString("EA");
                String RoL = rs.getString("RoL");

                guardPreviousJob guardPreviousJob = new guardPreviousJob(prevJobId, guardID, employerName, positionHeld, dateStart, dateTo, EA, RoL);
                guardPreviousJobList.add(guardPreviousJob);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return guardPreviousJobList;
    }

    //select pol or army selectGuardExArmyOrPolice
    public guardExArmyOrPolice selectGuardExArmyOrPolice(String guardID) {
        guardExArmyOrPolice guardExArmyOrPolices = null;
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_GUARD_EXARMYPOLICE);) {
            preparedStatement.setString(1, guardID);

            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String exArmyOrPolice = rs.getString("exArmyOrPolice");
                String guardServiceNo = rs.getString("guardServiceNo");
                String guardPosition = rs.getString("guardPosition");
                String dateStart = rs.getString("dateStart");
                String dateTo = rs.getString("dateTo");
                String guardBranch = rs.getString("guardBranch");
                String guardRFLPA = rs.getString("guardRFLPA");

                System.out.println(guardID);
                System.out.println(rs);
                guardExArmyOrPolices = new guardExArmyOrPolice(guardID, exArmyOrPolice, guardServiceNo, guardPosition, dateStart, dateTo, guardBranch, guardRFLPA);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return guardExArmyOrPolices;
    }

    //guard references select
    public guardReference selectGuardReference(String guardID) {
        guardReference guardReferences = null;
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_GUARD_REFER_BY_ID);) {
            preparedStatement.setString(1, guardID);

            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String guardReferName = rs.getString("guardReferName");
                String guardReferJob = rs.getString("guardReferJob");
                String guardReferAddress = rs.getString("guardReferAddress");
                String guardReferRelation = rs.getString("guardReferRelation");
                String guardReferPhoneNo = rs.getString("guardReferPhoneNo");

                System.out.println(guardID);
                System.out.println(rs);
                guardReferences = new guardReference(guardID, guardReferName, guardReferJob, guardReferAddress, guardReferRelation, guardReferPhoneNo);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return guardReferences;
    }

    //selectjoin
    
    
    
    //updateguardPersonalDetails
    public boolean updateGuardPersonalDetails(guardPersonalDetails updateGuardPersonalDetails) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement ps = connection.prepareStatement(UPDATE_GUARD_BY_ID)) {

            // Set parameters     
            System.out.println(UPDATE_GUARD_BY_ID);
            System.out.println(updateGuardPersonalDetails.getImg());
            ps.setString(1, updateGuardPersonalDetails.getGuardSalary());
            ps.setString(2, updateGuardPersonalDetails.getGuardName());
            ps.setString(3, updateGuardPersonalDetails.getGuardICNO());
            ps.setString(4, updateGuardPersonalDetails.getGuardAddress());
            ps.setString(5, updateGuardPersonalDetails.getGuardPhoneNo());
            ps.setString(6, updateGuardPersonalDetails.getNationality());
            ps.setString(7, updateGuardPersonalDetails.getGuardDOB());
            ps.setString(8, updateGuardPersonalDetails.getGuardPOB());
            ps.setString(9, updateGuardPersonalDetails.getGuardEPFNo());
            ps.setString(10, updateGuardPersonalDetails.getReligion());
            ps.setString(11, updateGuardPersonalDetails.getGuardGender());
            ps.setString(12, updateGuardPersonalDetails.getGuardSocsoNo());
            ps.setString(13, updateGuardPersonalDetails.getGuardRace());
            ps.setString(14, updateGuardPersonalDetails.getGuardAccNo());
            ps.setString(15, updateGuardPersonalDetails.getGuardNOB());
            ps.setString(16, updateGuardPersonalDetails.getGuardStatus());
            ps.setString(17, updateGuardPersonalDetails.getDateWorkStart());
            ps.setString(18, updateGuardPersonalDetails.getDateContractEnd());
            ps.setString(19, updateGuardPersonalDetails.getGuardID());

            // Execute update
            rowUpdated = ps.executeUpdate() > 0;
            System.out.println(ps);

        } catch (SQLException e) {
            e.printStackTrace();
            rowUpdated = false;
        }
        return rowUpdated;
    }

    //Guard Family Details
    public boolean updateGuardFamilyDetails(guardFamilyDetails updateGuardFam) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement ps = connection.prepareStatement(UPDATE_GUARD_FAMILY_BY_ID);) {
            ps.setString(1, updateGuardFam.getMaritalStatus());
            ps.setString(2, updateGuardFam.getGuardSpName());
            ps.setString(3, updateGuardFam.getGuardFamOccu());
            ps.setString(4, updateGuardFam.getGuardFamNoP1());
            ps.setString(5, updateGuardFam.getGuardNumOfChild());
            ps.setString(6, updateGuardFam.getGuardSpAdd());
            ps.setString(7, updateGuardFam.getGuardFN());
            ps.setString(8, updateGuardFam.getGuardFOccu());
            ps.setString(9, updateGuardFam.getGuardMomName());
            ps.setString(10, updateGuardFam.getGuardMomOccu());
            ps.setString(11, updateGuardFam.getGuardParentAdd());
            ps.setString(12, updateGuardFam.getGuardID());
            rowUpdated = ps.executeUpdate() > 0;
        }
        return rowUpdated;
    }

// Update guard education details
    public boolean updateGuardEduDetails(List<guardEduBg> guardEduList) throws SQLException {
        boolean rowUpdated = false;

        try (Connection connection = getConnection(); PreparedStatement updateStatement = connection.prepareStatement(UPDATE_EDU)) {

            connection.setAutoCommit(false); // Disable auto-commit for transaction

            for (guardEduBg edu : guardEduList) {
                updateStatement.setString(1, edu.getSchool());
                updateStatement.setString(2, edu.getState());
                updateStatement.setString(3, edu.getDateStart());
                updateStatement.setString(4, edu.getDateTo());
                updateStatement.setInt(5, edu.getId());

                // Print SQL statement for debugging
                System.out.println("Executing update: " + updateStatement);
                updateStatement.addBatch();
            }

            int[] rowsUpdated = updateStatement.executeBatch();
            rowUpdated = rowsUpdated.length > 0;

            connection.commit(); // Commit transaction

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdated;
    }

    //updateGuardPrevEmploymentDetails
    public boolean updateGuardPrevEmploymentDetails(List<guardPreviousJob> guardPreviousJobList) throws SQLException {
        boolean rowUpdated = false;

        try (Connection connection = getConnection(); PreparedStatement updateStatement = connection.prepareStatement(UPDATE_PREVJOB)) {

            connection.setAutoCommit(false); // Disable auto-commit for transaction

            for (guardPreviousJob preJob : guardPreviousJobList) {
                updateStatement.setString(1, preJob.getEmployerName());
                updateStatement.setString(2, preJob.getPositionHeld());
                updateStatement.setString(3, preJob.getDateStart());
                updateStatement.setString(4, preJob.getDateTo());
                updateStatement.setString(5, preJob.getEA());
                updateStatement.setInt(6, preJob.getPrevJobId());

                // Print SQL statement for debugging
                System.out.println("Executing update: " + updateStatement);
                updateStatement.addBatch();
            }

            int[] rowsUpdated = updateStatement.executeBatch();
            rowUpdated = rowsUpdated.length > 0;

            connection.commit(); // Commit transaction

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdated;
    }

    //updateGuardPrevExPoliceOrArmyDetails
    public boolean updateGuardPrevExPoliceOrArmyDetails(guardExArmyOrPolice updateGuard) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement ps = connection.prepareStatement(UPDATE_GUARD_POLAR_SQL);) {
            ps.setString(1, updateGuard.getExArmyOrPolice());
            ps.setString(2, updateGuard.getGuardServiceNo());
            ps.setString(3, updateGuard.getGuardPosition());
            ps.setString(4, updateGuard.getDateStart());
            ps.setString(5, updateGuard.getDateTo());
            ps.setString(6, updateGuard.getGuardBranch());
            ps.setString(7, updateGuard.getGuardRFLPA());
            ps.setString(8, updateGuard.getGuardID());
            rowUpdated = ps.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    //updateGuardReference
    public boolean updateGuardReference(guardReference updateGuard) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement ps = connection.prepareStatement(UPDATE_GUARD_REFER_SQL);) {
            ps.setString(1, updateGuard.getGuardReferName());
            ps.setString(2, updateGuard.getGuardReferJob());
            ps.setString(3, updateGuard.getGuardReferAddress().trim());
            ps.setString(4, updateGuard.getGuardReferRelation());
            ps.setString(5, updateGuard.getGuardReferPhoneNo());
            ps.setString(6, updateGuard.getGuardID());
            rowUpdated = ps.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    //updateSiteByGuardID
    public boolean updateSiteByGuardID(guardPersonalDetails updateGuardSite) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement ps = connection.prepareStatement(UPDATE_GUARD_SITE_SQL);) {
            ps.setInt(1, updateGuardSite.getSiteID());
            ps.setString(2, updateGuardSite.getGuardID());
            rowUpdated = ps.executeUpdate() > 0;
        }
        return rowUpdated;
    }

//GUARD UPDATE
    public boolean updateGuard(guardPersonalDetails updateGuard) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement ps = connection.prepareStatement(UPDATE_GUARD_SQL);) {
            ps.setString(1, updateGuard.getGuardID());
            ps.setString(2, updateGuard.getGuardName());
            ps.setString(3, updateGuard.getGuardICNO());
            ps.setString(4, updateGuard.getGuardAddress());
            ps.setString(5, updateGuard.getGuardPhoneNo());
            ps.setString(6, updateGuard.getNationality());
            ps.setString(7, updateGuard.getGuardDOB());
            ps.setString(8, updateGuard.getGuardPOB());
            ps.setString(9, updateGuard.getGuardEPFNo());
            ps.setString(10, updateGuard.getReligion());
            ps.setString(11, updateGuard.getGuardGender());
            ps.setString(12, updateGuard.getGuardSocsoNo());
            ps.setString(13, updateGuard.getGuardRace());
            ps.setString(14, updateGuard.getGuardAccNo());
            ps.setString(15, updateGuard.getGuardNOB());

            rowUpdated = ps.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    //guard delete
    public boolean deleteGuard(String guardID) throws SQLException {
        boolean rowDeleted = false;

        try (Connection connection = getConnection()) {
            // Start a transaction
            connection.setAutoCommit(false);

            try (PreparedStatement statement1 = connection.prepareStatement(DELETE_GUARD_PERSONAL_SQL); PreparedStatement statement2 = connection.prepareStatement(DELETE_GUARD_EDU_SQL); PreparedStatement statement3 = connection.prepareStatement(DELETE_GUARD_REFER_SQL); PreparedStatement statement4 = connection.prepareStatement(DELETE_GUARD_PREVJOB_SQL); PreparedStatement statement5 = connection.prepareStatement(DELETE_GUARD_FAMDETAILS_SQL); PreparedStatement statement6 = connection.prepareStatement(DELETE_GUARD_EXU_SQL)) {

                // Set the parameter for each delete statement
                statement1.setString(1, guardID);
                statement2.setString(1, guardID);
                statement3.setString(1, guardID);
                statement4.setString(1, guardID);
                statement5.setString(1, guardID);
                statement6.setString(1, guardID);

                // Execute each delete statement and check if any rows were affected
                boolean rowsDeletedFromAllTables = statement1.executeUpdate() > 0
                        && statement2.executeUpdate() > 0
                        && statement3.executeUpdate() > 0
                        && statement4.executeUpdate() > 0
                        && statement5.executeUpdate() > 0
                        && statement6.executeUpdate() > 0;

                if (rowsDeletedFromAllTables) {
                    connection.commit(); // Commit the transaction if all deletes succeeded
                    rowDeleted = true;
                } else {
                    connection.rollback(); // Rollback the transaction if any delete failed
                }
            } catch (SQLException e) {
                connection.rollback(); // Rollback the transaction in case of an exception
                throw e;
            } finally {
                connection.setAutoCommit(true); // Restore the default auto-commit behavior
            }
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
