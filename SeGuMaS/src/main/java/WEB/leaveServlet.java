/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package WEB;

import DAO.leaveDAO;
import MODEL.leave;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author edrag
 */
@WebServlet("/leaveServlet")
public class leaveServlet extends HttpServlet {

    private leaveDAO LeaveDAO;

    public void init() {
        LeaveDAO = new leaveDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String action = request.getServletPath();
            switch (action) {
                case "/leaveServlet":

                case "/newLeave":
                    showNewFormLeave(request, response);
                    break;

                case "/insertLeave":
                    insertLeave(request, response);
                    break;

                case "/deleteLeave":
                    deleteLeave(request, response);
                    break;

                case "/editLeave":
                    showEditFormLeave(request, response);
                    break;

                case "/updateLeave":
                    updateLeave(request, response);
                    break;

                case "/updateGuardLeave":
                    updateGuardLeave(request, response);
                    break;

                case "/listLeave":
                    listLeave(request, response);
                    break;

                case "/listLeave_Staff":
                    listLeave_Staff(request, response);
                    break;

                default:
                    listLeave(request, response);
                    break;
            }
        } catch (SQLException ex) {
            Logger.getLogger(leaveServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    private void showNewFormLeave(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("addLeave.jsp");
        dispatcher.forward(request, response);
    }

    private void insertLeave(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String guardInfo = request.getParameter("guardInfo");
        if (guardInfo != null && !guardInfo.isEmpty()) {
            int leaveID = 0;
            String[] parts = guardInfo.split(":");
            String guardID = parts[0];
            String guardName = parts[1];
            // Process guardID and guardName as needed

            String leaveType = request.getParameter("leaveType");
            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");
            String reason = request.getParameter("reason");
            String status = "In Process";
            leave newLeave = new leave(leaveID, guardID, guardName, leaveType, startDate, endDate, reason, status);
            LeaveDAO.insertLeave(newLeave);
        }

        response.sendRedirect("listLeave");
    }

    private void showEditFormLeave(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int leaveID = Integer.parseInt(request.getParameter("leaveID"));
        leave existingLeave = LeaveDAO.selectLeave(leaveID);
        RequestDispatcher dispatcher = request.getRequestDispatcher("addLeave.jsp");
        request.setAttribute("leave", existingLeave);
        dispatcher.forward(request, response);
    }

    private void deleteLeave(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        int leaveID = Integer.parseInt(request.getParameter("leaveID"));
        LeaveDAO.deleteLeave(leaveID);
        response.sendRedirect("listLeave_Staff");
    }

    //update guard leave 
    private void updateGuardLeave(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {

        // Get leaveID and status parameters from the request
        int leaveID = Integer.parseInt(request.getParameter("leaveID"));
        String leaveType = request.getParameter("leaveType");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String reason = request.getParameter("reason");

        leave updateGuardLeave = new leave(leaveID, leaveType, startDate, endDate, reason);
        LeaveDAO.updateLeaveDetails(updateGuardLeave);
        response.getWriter().write("Leave status updated successfully");
        response.sendRedirect("viewLeaveList_Staff");
    }

    private void updateLeave(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {

        // Get leaveID and status parameters from the request
        int leaveID = Integer.parseInt(request.getParameter("leaveID"));
        String status = request.getParameter("status");

        leave updateLeave = new leave(leaveID, status);
        LeaveDAO.updateLeaveStatus(updateLeave);
        response.setContentType("text/plain");
        response.getWriter().write("Leave status updated successfully");
        response.sendRedirect("listLeave");
    }

    private void listLeave(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<leave> listLeave = LeaveDAO.selectAllLeave();
        request.setAttribute("listLeave", listLeave);
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewLeaveList.jsp");
        dispatcher.forward(request, response);
    }

    private void listLeave_Staff(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<leave> listLeave = LeaveDAO.selectAllLeave();
        request.setAttribute("listLeave", listLeave);
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewLeaveList_Staff.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
