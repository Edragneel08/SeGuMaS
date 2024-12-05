/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package WEB;

import DAO.StaffDAO;
import MODEL.staff;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author edrag
 */
@WebServlet("/manageHrStaffServlet")
@MultipartConfig(maxFileSize = 16177215) // 16 MB
public class manageHrStaffServlet extends HttpServlet {

    private StaffDAO staffDAO;

    public void init() {
        staffDAO = new StaffDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getServletPath();

        try {
            switch (action) {

                case "/manageHrStaffServlet":

                case "/new":
                    showNewForm(request, response);
                    break;

                case "/insert":
                    insertStaff(request, response);
                    break;

                case "/delete":
                    deleteStaff(request, response);
                    break;

                case "/edit":
                    showEditForm(request, response);
                    break;

                case "/update":
                    updateStaff(request, response);
                    break;

                case "/updateProfileStaff":
//                    updateProfileStaff(request, response);
                    break;

                case "/logout":
                    logout(request, response);
                    break;

                default:
                    listStaff(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    //showInsertForm
    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("addHRstaff.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String staffID = request.getParameter("staffID");
        staff existingStaff = staffDAO.selectStaff(staffID);
        request.setAttribute("staff", existingStaff);
        RequestDispatcher dispatcher = request.getRequestDispatcher("addHRstaff.jsp");
        dispatcher.forward(request, response);
    }

    //insert staff
    private void insertStaff(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {

        String staffID = "0";
        String SID = "0";
        String fullname = request.getParameter("fullname");
        String ICNO = request.getParameter("ICNO");
        String noPhone = request.getParameter("noPhone");
        InputStream img = null;

        Part filePart = request.getPart("img");
        if (filePart != null) {
            img = filePart.getInputStream();
        }

        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Debugging logs
        System.out.println("fullname: " + fullname);
        System.out.println("ICNO: " + ICNO);
        System.out.println("noPhone: " + noPhone);
        System.out.println("filePart: " + filePart);
        System.out.println("email: " + email);
        System.out.println("username: " + username);
        System.out.println("password: " + password);

        staff newStaff = new staff(staffID, SID, ICNO, noPhone, img, email, fullname, username, password);
        staffDAO.insertStaff(newStaff);
        response.sendRedirect("listStaff");
    }

    //listStaff
    private void listStaff(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<staff> listStaff = staffDAO.selectAllStaff();
        request.setAttribute("listStaff", listStaff);
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewListStaff.jsp");
        dispatcher.forward(request, response);
    }

    //update staff
    private void updateStaff(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String staffID = request.getParameter("staffID");
        String SID = request.getParameter("SID");
        String ICNO = request.getParameter("ICNO");
        String noPhone = request.getParameter("noPhone");

        InputStream img = null;

        Part filePart = request.getPart("img");
        if (filePart != null) {
            img = filePart.getInputStream();
        }

        String email = request.getParameter("email");
        String fullname = request.getParameter("fullname");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        staff updateStaff = new staff(staffID, SID, ICNO, noPhone, img, email, fullname, username, password);
        staffDAO.updateStaff(updateStaff);
        response.sendRedirect("listStaff");
    }

    //delete staff
    private void deleteStaff(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String staffID = request.getParameter("staffID");
        staffDAO.deleteStaff(staffID);
        response.sendRedirect("listStaff");
    }

    //logout staff
    private void logout(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        HttpSession session = request.getSession(false);

        if (session != null) {
            session.invalidate();
        }

        // Redirect to the login page or any other page after logout
        response.sendRedirect("index.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
