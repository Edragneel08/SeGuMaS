/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package WEB;

import DAO.SiteDAO;
import DAO.guardDAO;
import MODEL.guard;
import MODEL.guardEduBg;
import MODEL.guardExArmyOrPolice;
import MODEL.guardFamilyDetails;
import MODEL.guardPersonalDetails;
import MODEL.guardPreviousJob;
import MODEL.guardReference;
import MODEL.site;
import MODEL.staff;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author edrag
 */
@WebServlet("/guardServlet")
@MultipartConfig(maxFileSize = 16177215) // 16MB
public class guardServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private guardDAO GuardDAO;
    private SiteDAO siteDAO;

    public void init() {
        GuardDAO = new guardDAO();
        siteDAO = new SiteDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String action = request.getServletPath();
            System.out.println(action);

            switch (action) {
                case "/guardServlet":

                case "/newGuard":
                    showNewFormGuard(request, response);
                    break;

                case "/insertGuard":
                    insertGuard(request, response);
                    break;

                case "/deleteGuard":
                    deleteGuard(request, response);
                    break;

                case "/editGuard":
                    showEditFormGuard(request, response);
                    break;

                case "/updateGuard":
                    updateGuard(request, response);
                    break;

                case "/updateGuardPersonalDetails":
                    updateGuardPersonalDetails(request, response);
                    break;

                case "/updateGuardFamilyDetails":
                    updateGuardFamilyDetails(request, response);
                    break;

                case "/updateGuardEdu":
                    updateGuardEduDetails(request, response);
                    break;

                case "/updateGuardPrevEmployment":
                    updateGuardPrevEmploymentDetails(request, response);
                    break;

                case "/updateGuardPrevExPoliceOrArmy":
                    updateGuardPrevExPoliceOrArmyDetails(request, response);
                    break;

                case "/updateGuardReference":
                    updateGuardReferenceDetails(request, response);
                    break;

                case "/updateSiteByGuardID":
                    updateSiteByGuardID(request, response);
                    break;

//                case "/listGuardMenu":
//                    listGuardMenu(request, response);
//                    break;
                case "/listGuardCreate":
                    listGuardCreate(request, response);
                    break;

                case "/listGuarddropDown":
                    listGuarddropDown(request, response);
                    break;

                default:
                    listGuard(request, response);
                    break;
            }
        } catch (SQLException ex) {
            Logger.getLogger(guardServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    private void showNewFormGuard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("addGuard.jsp");
        dispatcher.forward(request, response);
    }

    private void insertGuard(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        //PERSONAL DETAILS
        String guardID = request.getParameter("guardID");
        InputStream img = null;

        Part filePart = request.getPart("img");
        if (filePart != null) {
            img = filePart.getInputStream();
        }

        String guardSalary = request.getParameter("guardSalary") + ".00";
        String guardName = request.getParameter("guardName");
        String guardICNO = request.getParameter("guardICNO");
        String guardAddress = request.getParameter("guardAddress").trim();
        String guardPhoneNo = request.getParameter("guardPhoneNo");
        String nationality = request.getParameter("nationality");
        String guardDOB = request.getParameter("guardDOB");
        String guardPOB = request.getParameter("guardPOB");
        String guardEPFNo = request.getParameter("guardEPFNo");
        String religion = request.getParameter("religion");
        String guardGender = request.getParameter("guardGender");
        String guardSocsoNo = request.getParameter("guardSocsoNo");
        String guardRace = request.getParameter("guardRace");
        String guardAccNo = request.getParameter("guardAccNo");
        String guardNOB = request.getParameter("guardNOB");
        String guardStatus = "Active";
        String dateWorkStart = request.getParameter("dateWorkStart");
        String dateContractEnd = request.getParameter("dateContractEnd");

        //INSERTING INTO PERSONAL DETAILS
        guardPersonalDetails newGuard = new guardPersonalDetails(guardID, img, guardSalary, guardName, guardICNO, guardAddress, guardPhoneNo, nationality, guardDOB, guardPOB, guardEPFNo, religion, guardGender, guardSocsoNo, guardRace, guardAccNo, guardNOB, guardStatus, dateWorkStart, dateContractEnd);
        System.out.println("guard : " + guardSalary);
        // Call DAO method to insert guard and retrieve guardID
        guardID = GuardDAO.insertGuard(newGuard);

        if (guardID != null) {
            // Use the guardID returned by DAO
            System.out.println("Generated Guard ID: " + guardID);

            //family details
            System.out.println("Inserting Family Details");
            String maritalStatus = request.getParameter("maritalStatus");
            String guardSpName = request.getParameter("guardSpName");
            String guardFamOccu = request.getParameter("guardFamOccu");
            String guardFamNoP1 = request.getParameter("guardFamNoP1");
            String guardNumOfChild = request.getParameter("guardNumOfChild");
            String guardSpAdd = request.getParameter("guardSpAdd");
            String guardFN = request.getParameter("guardFN");
            String guardFOccu = request.getParameter("guardFOccu");
            String guardMomName = request.getParameter("guardMomName");
            String guardMomOccu = request.getParameter("guardMomOccu");
            String guardParentAdd = request.getParameter("guardParentAdd");

            // Create guardFamilyDetails object with guardID and other parameters
            guardFamilyDetails newGuard2 = new guardFamilyDetails(guardID, maritalStatus, guardSpName, guardFamOccu, guardFamNoP1, guardNumOfChild, guardSpAdd, guardFN, guardFOccu, guardMomName, guardMomOccu, guardParentAdd);
            // Call insertGuard2 method with the newGuard2 object
            GuardDAO.insertGuard2(newGuard2);

            //=========================================================
            System.out.println("Inserting Educational Background");
            guardID = guardID;
            String[] schools = request.getParameterValues("school[]");
            String[] states = request.getParameterValues("state[]");
            String[] dateStarts = request.getParameterValues("dateStart[]");
            String[] dateTos = request.getParameterValues("dateTo[]");
            System.out.println("Number of records to insert: " + schools.length);

            List<guardEduBg> eduBgList = new ArrayList<>();

            for (int i = 0; i < schools.length; i++) {
                guardID = guardID;
                String school = schools[i];
                String state = states[i];
                String dateStart = dateStarts[i];
                String dateTo = dateTos[i];

                System.out.println("----------------------------------------------");
                System.out.println("Data For Educational Background");
                System.out.println("0. ID : " + guardID);
                System.out.println("1. school : " + school);
                System.out.println("2. state : " + state);
                System.out.println("3. dateStart : " + dateStart);
                System.out.println("4. dateTo : " + dateTo);
                System.out.println("----------------------------------------------");

                //object
                guardEduBg newGuard3 = new guardEduBg(guardID, school, state, dateStart, dateTo);
                eduBgList.add(newGuard3);

            }
            GuardDAO.insertGuard3(eduBgList);

            //=========================================================
            System.out.println("Inserting Previous Job");
            guardID = guardID;
            String[] employerNames = request.getParameterValues("employerName[]");
            String[] positionHelds = request.getParameterValues("positionHeld[]");
            dateStarts = request.getParameterValues("dateStart[]");
            dateTos = request.getParameterValues("dateTo[]");
            String[] EAS = request.getParameterValues("EA[]");
            String[] RoLs = request.getParameterValues("RoL[]");
            System.out.println("Number of records to insert: " + schools.length);

            List<guardPreviousJob> previousJobList = new ArrayList<>();

            for (int i = 0; i < employerNames.length; i++) {
                guardID = guardID;
                String employerName = employerNames[i];
                String positionHeld = positionHelds[i];
                String dateStart = dateStarts[i];
                String dateTo = dateTos[i];
                String EA = EAS[i];
                String RoL = RoLs[i];

                System.out.println("----------------------------------------------");
                System.out.println("Data For Educational Background");
                System.out.println("0. ID : " + guardID);
                System.out.println("1. employerName : " + employerName);
                System.out.println("2. positionHeld : " + positionHeld);
                System.out.println("3. dateStart : " + dateStart);
                System.out.println("4. dateTo : " + dateTo);
                System.out.println("5. EA : " + EA);
                System.out.println("6. RoL : " + RoL);
                System.out.println("----------------------------------------------");

                //object
                guardPreviousJob newGuard4 = new guardPreviousJob(guardID, employerName, positionHeld, dateStart, dateTo, EA, RoL);
                previousJobList.add(newGuard4);

            }
            GuardDAO.insertGuard4(previousJobList);

            //=========================================================
            System.out.println("Insert Ex Police Or Army");
            guardID = guardID;
            String exArmyOrPolice = request.getParameter("exArmyOrPolice");
            String guardServiceNo = request.getParameter("guardServiceNo");
            String guardPosition = request.getParameter("guardPosition");
            String dateStart = request.getParameter("dateStart");
            String dateTo = request.getParameter("dateTo");
            String guardBranch = request.getParameter("guardBranch");
            String guardRFLPA = request.getParameter("guardRFLPA");

            if ("NO".equals(exArmyOrPolice)) {
                // Set date fields to null if they are empty
                dateStart = (dateStart.isEmpty()) ? null : dateStart;
                dateTo = (dateTo.isEmpty()) ? null : dateTo;
            }

            //INSERTING INTO PERSONAL DETAILS
            guardExArmyOrPolice newGuard5 = new guardExArmyOrPolice(guardID, exArmyOrPolice, guardServiceNo, guardPosition, dateStart, dateTo, guardBranch, guardRFLPA);
            GuardDAO.insertGuard5(newGuard5);

            //=========================================================
            System.out.println("Insert Guard Reference");
            guardID = guardID;
            String guardReferName = request.getParameter("guardReferName");
            String guardReferJob = request.getParameter("guardReferJob");
            String guardReferAddress = request.getParameter("guardReferAddress");
            String guardReferRelation = request.getParameter("guardReferRelation");
            String guardReferPhoneNo = request.getParameter("guardReferPhoneNo");

            //INSERTING INTO Guard Reference
            guardReference newGuard6 = new guardReference(guardID, guardReferName, guardReferJob, guardReferAddress, guardReferRelation, guardReferPhoneNo);
            GuardDAO.insertGuard6(newGuard6);

            // Redirect to the desired page
            response.sendRedirect("listGuard");
        } else {
            // Handle case where guardID is null or DAO operation failed
            // Redirect to error page or display error message
            response.sendRedirect("error.jsp");
        }

        //============================================================================================
    }

    private void deleteGuard(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String guardID = request.getParameter("guardID");
        GuardDAO.deleteGuard(guardID);
        response.sendRedirect("listGuard");
    }

    private void showEditFormGuard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String guardID = request.getParameter("guardID");

        // Fetch guard personal details
        guardPersonalDetails existingGuard = GuardDAO.selectGuard(guardID);
        if (existingGuard != null) {
            System.out.println("Existing Guard Personal Details:");
            System.out.println("Guard ID: " + existingGuard.getGuardID());
            System.out.println("Base64 Image: " + existingGuard.getBase64Img());
            System.out.println("Guard Salary: " + existingGuard.getGuardSalary());
            System.out.println("Guard Name: " + existingGuard.getGuardName());
            System.out.println("==========================");
        } else {
            System.out.println("Guard personal details not found or error occurred.");
        }

        // Fetch guard family details
        guardFamilyDetails existingGuardFam = GuardDAO.selectGuardFam(guardID);
        if (existingGuardFam != null) {
            System.out.println("Existing Guard Family Details:");
            System.out.println("Guard ID: " + existingGuardFam.getGuardID());
            System.out.println("Father Name: " + existingGuardFam.getGuardFN());
            System.out.println("==========================");
        } else {
            System.out.println("Guard family details not found or error occurred.");
        }

        // Fetch guard educational background details
        List<guardEduBg> existingGuardEDU = GuardDAO.selectGuardEDU(guardID);
        if (existingGuardEDU != null && !existingGuardEDU.isEmpty()) {
            System.out.println("Existing Guard EDU Details:");
            for (guardEduBg edu : existingGuardEDU) {
                System.out.println("Guard ID: " + edu.getGuardID());
                System.out.println("School: " + edu.getSchool());
                System.out.println("State: " + edu.getState());
                System.out.println("Date Start: " + edu.getDateStart());
                System.out.println("Date To: " + edu.getDateTo());
                System.out.println("--------------------------");
            }
            System.out.println("==========================");
        } else {
            System.out.println("Guard educational background details not found or error occurred.");
        }

        // Fetch guard previous job details
        List<guardPreviousJob> existingGuardPrevJob = GuardDAO.selectGuardPrevJob(guardID);
        if (existingGuardPrevJob != null && !existingGuardPrevJob.isEmpty()) {
            System.out.println("Existing Guard Previous Job Details:");
            for (guardPreviousJob prevJob : existingGuardPrevJob) {
                System.out.println("Guard ID: " + prevJob.getGuardID());
                System.out.println("Employer Name: " + prevJob.getEmployerName());
                System.out.println("--------------------------");
            }
            System.out.println("==========================");
        } else {
            System.out.println("Guard previous job details not found or error occurred.");
        }

        // Fetch guard ex-Army or Police details
        guardExArmyOrPolice existingGuardExArmyOrPolice = GuardDAO.selectGuardExArmyOrPolice(guardID);
        if (existingGuardExArmyOrPolice != null) {
            System.out.println("Existing Guard Family Details:");
            System.out.println("Guard ID: " + existingGuardExArmyOrPolice.getGuardID());
            System.out.println("Ex-Army/Police: " + existingGuardExArmyOrPolice.getExArmyOrPolice());
            System.out.println("Service No: " + existingGuardExArmyOrPolice.getGuardServiceNo());
            System.out.println("==========================");
        } else {
            System.out.println("Guard family details not found or error occurred.");
        }

        // Fetch guard ex-Army or Police details
        guardReference existingGuardReference = GuardDAO.selectGuardReference(guardID);
        if (existingGuardReference != null) {
            System.out.println("Existing Guard Reference Details:");
            System.out.println("Guard ID: " + existingGuardReference.getGuardID());
            System.out.println("getGuardReferName: " + existingGuardReference.getGuardReferName());
            System.out.println("getGuardReferPhoneNo: " + existingGuardReference.getGuardReferPhoneNo());
            System.out.println("==========================");
        } else {
            System.out.println("Guard Guard Reference not found or error occurred.");
        }

        // Set attributes for the JSP page
        request.setAttribute("guardReference", existingGuardReference);
        request.setAttribute("guardExArmyOrPolice", existingGuardExArmyOrPolice);
        request.setAttribute("guardPreviousJob", existingGuardPrevJob);
        request.setAttribute("guardEduBg", existingGuardEDU);
        request.setAttribute("guardFamilyDetails", existingGuardFam);
        request.setAttribute("guardPersonalDetails", existingGuard);

        // Forward to editGuard.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("editGuard.jsp");
        dispatcher.forward(request, response);
    }

    private void updateGuard(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {

        //personal details
        String guardID = request.getParameter("guardID");
        String guardName = request.getParameter("guardName");
        String guardICNO = request.getParameter("guardICNO");
        String guardAddress = request.getParameter("guardAddress");
        String guardPhoneNo = request.getParameter("guardPhoneNo");
        String nationality = request.getParameter("nationality");
        String guardDOB = request.getParameter("guardDOB");
        String guardPOB = request.getParameter("guardPOB");
        String guardEPFNo = request.getParameter("guardEPFNo");
        String religion = request.getParameter("religion");
        String guardGender = request.getParameter("guardGender");
        String guardSocsoNo = request.getParameter("guardSocsoNo");
        String guardRace = request.getParameter("guardRace");
        String guardAccNo = request.getParameter("guardAccNo");
        String guardNOB = request.getParameter("guardNOB");

        guardPersonalDetails updateGuard = new guardPersonalDetails(guardID, guardName, guardICNO, guardAddress, guardPhoneNo, nationality, guardDOB, guardPOB, guardEPFNo, religion, guardGender, guardSocsoNo, guardRace, guardAccNo, guardNOB);

        GuardDAO.updateGuard(updateGuard);
        response.sendRedirect("listGuard");
    }

    private void updateGuardPersonalDetails(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, ServletException {
        System.out.println("Inside updateGuardPersonalDetails method...");

        String guardID = request.getParameter("guardID");

        String guardSalary = request.getParameter("guardSalary");
        String guardName = request.getParameter("guardName");
        String guardICNO = request.getParameter("guardICNO");
        String guardAddress = request.getParameter("guardAddress").trim(); // Trim whitespace
        String guardPhoneNo = request.getParameter("guardPhoneNo");
        String nationality = request.getParameter("nationality");
        String guardDOB = request.getParameter("guardDOB");
        String guardPOB = request.getParameter("guardPOB");
        String guardEPFNo = request.getParameter("guardEPFNo");
        String religion = request.getParameter("religion");
        String guardGender = request.getParameter("guardGender");
        String guardSocsoNo = request.getParameter("guardSocsoNo");
        String guardRace = request.getParameter("guardRace");
        String guardAccNo = request.getParameter("guardAccNo");
        String guardNOB = request.getParameter("guardNOB");
        String guardStatus = request.getParameter("guardStatus");
        String dateWorkStart = request.getParameter("dateWorkStart");
        String dateContractEnd = request.getParameter("dateContractEnd");

        guardPersonalDetails updateGuardPersonalDetails = new guardPersonalDetails(
                guardID, guardSalary, guardName, guardICNO, guardAddress,
                guardPhoneNo, nationality, guardDOB, guardPOB, guardEPFNo, religion,
                guardGender, guardSocsoNo, guardRace, guardAccNo, guardNOB, guardStatus,
                dateWorkStart, dateContractEnd
        );

        GuardDAO.updateGuardPersonalDetails(updateGuardPersonalDetails);
        response.sendRedirect("listGuard");
    }

    private void updateGuardFamilyDetails(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, ServletException {
        System.out.println("Inside updateGuardFamilyDetails method...");

        // Retrieve parameters from the request
        String guardID = request.getParameter("guardID");
        String maritalStatus = request.getParameter("maritalStatus");
        String guardSpName = request.getParameter("guardSpName");
        String guardFamOccu = request.getParameter("guardFamOccu");
        String guardFamNoP1 = request.getParameter("guardFamNoP1");
        String guardNumOfChild = request.getParameter("guardNumOfChild");
        String guardSpAdd = request.getParameter("guardSpAdd");
        String guardFN = request.getParameter("guardFN");
        String guardFOccu = request.getParameter("guardFOccu");
        String guardMomName = request.getParameter("guardMomName");
        String guardMomOccu = request.getParameter("guardMomOccu");
        String guardParentAdd = request.getParameter("guardParentAdd");

        // Log the received parameters
        System.out.println("Received parameters:");
        System.out.println("guardID: " + guardID);
        System.out.println("maritalStatus: " + maritalStatus);
        System.out.println("guardSpName: " + guardSpName);
        System.out.println("guardFamOccu: " + guardFamOccu);
        System.out.println("guardFamNoP1: " + guardFamNoP1);
        System.out.println("guardNumOfChild: " + guardNumOfChild);
        System.out.println("guardSpAdd: " + guardSpAdd);
        System.out.println("guardFN: " + guardFN);
        System.out.println("guardFOccu: " + guardFOccu);
        System.out.println("guardMomName: " + guardMomName);
        System.out.println("guardMomOccu: " + guardMomOccu);
        System.out.println("guardParentAdd: " + guardParentAdd);

        // Create guardFamilyDetails object
        guardFamilyDetails guardFamilyDetails = new guardFamilyDetails(
                guardID, maritalStatus, guardSpName, guardFamOccu, guardFamNoP1, guardNumOfChild,
                guardSpAdd, guardFN, guardFOccu, guardMomName, guardMomOccu, guardParentAdd
        );

        // Log the guardFamilyDetails object
        System.out.println("guardFamilyDetails object: " + guardFamilyDetails);

        // Update the guard family details
        boolean success = GuardDAO.updateGuardFamilyDetails(guardFamilyDetails);
        System.out.println("Update success: " + success);

        // Redirect to the listGuard page
        response.sendRedirect("listGuard");
    }

    //edu
    private void updateGuardEduDetails(HttpServletRequest request, HttpServletResponse response)
            throws IOException, SQLException, ServletException {
        System.out.println("Inside updateGuardEduDetails");

        // Retrieve parameters for each educational background entry
        String[] idStrings = request.getParameterValues("id[]");
        String[] schools = request.getParameterValues("school[]");
        String[] states = request.getParameterValues("state[]");
        String[] dateStarts = request.getParameterValues("dateStart[]");
        String[] dateTos = request.getParameterValues("dateTo[]");

        // Log the received parameters
        System.out.println("Received educational background entries:");
        if (idStrings != null) {
            for (int i = 0; i < idStrings.length; i++) {
                System.out.println("ID: " + idStrings[i] + ", School: " + schools[i] + ", State: " + states[i]
                        + ", Date Start: " + dateStarts[i] + ", Date To: " + dateTos[i]);
            }
        } else {
            System.out.println("IDs are null");
        }

        // Create a list to hold the educational background entries
        List<guardEduBg> guardEduList = new ArrayList<>();

        // Loop through the parameters and create GuardEduBg objects
        for (int i = 0; i < schools.length; i++) {
            int id = Integer.parseInt(idStrings[i]); // Convert id to int
            guardEduBg edu = new guardEduBg(id, schools[i], states[i], dateStarts[i], dateTos[i]);
            guardEduList.add(edu);
        }

        try {
            boolean success = GuardDAO.updateGuardEduDetails(guardEduList);
            System.out.println("Update success: " + success);
            // Redirect to the listGuard page
            response.sendRedirect("listGuard"); // Replace with your actual redirect URL
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception as needed
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error updating educational details.");
        }
    }

    //updateGuardPrevEmploymentDetails
    private void updateGuardPrevEmploymentDetails(HttpServletRequest request, HttpServletResponse response)
            throws IOException, SQLException, ServletException {
        System.out.println("UpdateGuardPrevEmploymentDetails");

        // Retrieve parameters for each previous employment entry
        String[] prevJobIds = request.getParameterValues("prevJobId[]");
        String[] employerNames = request.getParameterValues("employerName[]");
        String[] positionHelds = request.getParameterValues("positionHeld[]");
        String[] dateStarts = request.getParameterValues("dateStart[]");
        String[] dateTos = request.getParameterValues("dateTo[]");
        String[] EAs = request.getParameterValues("EA[]");

        // Log the received parameters
        System.out.println("Received previous employment entries:");
        if (prevJobIds != null) {
            for (int i = 0; i < prevJobIds.length; i++) {
                System.out.println("PrevJob ID: " + prevJobIds[i] + ", Employer Name: " + employerNames[i]
                        + ", Position Held: " + positionHelds[i] + ", Date Start: " + dateStarts[i]
                        + ", Date To: " + dateTos[i] + ", EA: " + EAs[i]);
            }
        } else {
            System.out.println("PrevJob IDs are null");
        }

        // Create a list to hold the previous employment entries
        List<guardPreviousJob> guardPreviousJobList = new ArrayList<>();

        // Loop through the parameters and create GuardPreviousJob objects
        for (int i = 0; i < employerNames.length; i++) {
            // Convert prevJobId from String to int
            int prevJobId = Integer.parseInt(prevJobIds[i]);
            guardPreviousJob preJob = new guardPreviousJob(prevJobId, employerNames[i], positionHelds[i], dateStarts[i], dateTos[i], EAs[i]);
            guardPreviousJobList.add(preJob);
        }

        try {
            boolean success = GuardDAO.updateGuardPrevEmploymentDetails(guardPreviousJobList);
            System.out.println("Update success: " + success);
            // Redirect to the listGuard page
            response.sendRedirect("listGuard"); // Replace with your actual redirect URL
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception as needed
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error updating previous employment details.");
        }
    }

    //updateGuardPrevExPoliceOrArmyDetails
    private void updateGuardPrevExPoliceOrArmyDetails(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, ServletException {
        System.out.println("Inside updateGuardPrevExPoliceOrArmyDetails method...");

        // Retrieve parameters from the request
        String guardID = request.getParameter("guardID");
        String exArmyOrPolice = request.getParameter("exArmyOrPolice");
        String guardServiceNo = request.getParameter("guardServiceNo");
        String guardPosition = request.getParameter("guardPosition");
        String dateStart = request.getParameter("dateStart");
        String dateTo = request.getParameter("dateTo");
        String guardBranch = request.getParameter("guardBranch");
        String guardRFLPA = request.getParameter("guardRFLPA");

        // Log the received parameters
        System.out.println("Received parameters:");
        System.out.println("guardID: " + guardID);
        System.out.println("exArmyOrPolice: " + exArmyOrPolice);
        System.out.println("guardPosition: " + guardPosition);

        // Create guardFamilyDetails object
        guardExArmyOrPolice guardExArmyOrPolice = new guardExArmyOrPolice(guardID, exArmyOrPolice, guardServiceNo, guardPosition, dateStart, dateTo, guardBranch, guardRFLPA);

        // Log the guardFamilyDetails object
        System.out.println("guardExArmyOrPolices object: " + guardExArmyOrPolice);

        // Update the guard family details
        boolean success = GuardDAO.updateGuardPrevExPoliceOrArmyDetails(guardExArmyOrPolice);
        System.out.println("Update success: " + success);

        // Redirect to the listGuard page
        response.sendRedirect("listGuard");
    }

    //UPDATE REFERENCE  updateGuardReference
    private void updateGuardReferenceDetails(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, ServletException {
        System.out.println("Inside updateGuardReference method...");

        // Retrieve parameters from the request
        String guardID = request.getParameter("guardID");
        String guardReferName = request.getParameter("guardReferName");
        String guardReferJob = request.getParameter("guardReferJob");
        String guardReferAddress = request.getParameter("guardReferAddress");
        String guardReferRelation = request.getParameter("guardReferRelation");
        String guardReferPhoneNo = request.getParameter("guardReferPhoneNo");

        // Log the received parameters
        System.out.println("Received parameters:");
        System.out.println("guardID: " + guardID);
        System.out.println("guardReferName: " + guardReferName);
        System.out.println("guardReferPhoneNo: " + guardReferPhoneNo);

        // Create guardFamilyDetails object
        guardReference guardReference = new guardReference(guardID, guardReferName, guardReferJob, guardReferAddress, guardReferRelation, guardReferPhoneNo);

        // Log the guardFamilyDetails object
        System.out.println("guardReference object: " + guardReference);

        // Update the guard family details
        boolean success = GuardDAO.updateGuardReference(guardReference);
        System.out.println("Update success: " + success);

        // Redirect to the listGuard page
        response.sendRedirect("listGuard");
    }
    
    //updateSiteByGuardID
    private void updateSiteByGuardID(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, ServletException {
        System.out.println("Inside updateSiteByGuardID method...");

        // Retrieve parameters from the request
        String guardID = request.getParameter("guardID");
        int siteID = Integer.parseInt(request.getParameter("siteID"));

        // Log the received parameters
        System.out.println("Received parameters:");
        System.out.println("guardID: " + guardID);
        System.out.println("siteID: " + siteID);

        // Create guardFamilyDetails object
        guardPersonalDetails updateGuardSite = new guardPersonalDetails(guardID, siteID);

        // Log the guardFamilyDetails object
        System.out.println("updateGuardSite object: " + updateGuardSite);

        // Update the guard family details
        boolean success = GuardDAO.updateSiteByGuardID(updateGuardSite);
        System.out.println("Update success: " + success);

        // Redirect to the listGuard page
        response.sendRedirect("listGuard");
    }

    private void listGuard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<guardPersonalDetails> listGuard = GuardDAO.selectAllGuardPersonalDetails();
        request.setAttribute("listGuard", listGuard);
        
        List<site> listSite = siteDAO.selectAllSite();
        request.setAttribute("listSite", listSite);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewGuardList.jsp");
        dispatcher.forward(request, response);
    }

//    private void listGuardMenu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        List<guard> listGuard = GuardDAO.selectAllGuard();
//        request.setAttribute("listtGuard", listGuard);
//        RequestDispatcher dispatcher = request.getRequestDispatcher("adminMenu.jsp");
//        dispatcher.forward(request, response);
//    }
    //for CREATE SCHEDDULE
    private void listGuardCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<guardPersonalDetails> listGuard = GuardDAO.selectAllGuardPersonalDetails();
        request.setAttribute("listGuard", listGuard);

        List<site> listSite = siteDAO.selectAllSite();
        request.setAttribute("listSite", listSite);

        RequestDispatcher dispatcher = request.getRequestDispatcher("createSchedule.jsp");
        dispatcher.forward(request, response);
    }

    //for guard list in the leave dropdown 
    private void listGuarddropDown(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<guardPersonalDetails> listGuard = GuardDAO.selectAllGuardPersonalDetails();
        request.setAttribute("listGuard", listGuard);
        RequestDispatcher dispatcher = request.getRequestDispatcher("addLeave.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
