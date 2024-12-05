/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package WEB;

import DAO.SiteDAO;
import MODEL.site;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author edrag
 */
@WebServlet("/siteServlet")
public class siteServlet extends HttpServlet {

    private SiteDAO siteDAO;

    public void init() {
        siteDAO = new SiteDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getServletPath();

        try {
            switch (action) {

                case "/siteServlet":

                case "/newSite":
                    showNewForm(request, response);
                    break;

                case "/insertSite":
                    insertSite(request, response);
                    break;

                case "/deleteSite":
                    deleteSite(request, response);
                    break;

                case "/editSite":
                    showEditForm(request, response);
                    break;

                case "/updateSite":
                    updateSite(request, response);
                    break;

                case "/listSite":
                    listSite(request, response);
                    break;

                default:
                    listSite(request, response);
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
        RequestDispatcher dispatcher = request.getRequestDispatcher("addSite.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String siteID = request.getParameter("siteID");
        site existingSite = siteDAO.selectSite(siteID);
        RequestDispatcher dispatcher = request.getRequestDispatcher("addSite.jsp");
        request.setAttribute("site", existingSite);
        dispatcher.forward(request, response);

    }

    //insert staff
    private void insertSite(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        String siteID = "0";
        String siteName = request.getParameter("siteName");
        String siteAddress = request.getParameter("siteAddress");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String location = request.getParameter("location");
        String status = request.getParameter("status");

        site newSite = new site(siteID, siteName, siteAddress, startDate, endDate, location, status);
        siteDAO.insertSite(newSite);
        response.sendRedirect("listSite");
    }

    //listStaff
    private void listSite(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<site> listSite = siteDAO.selectAllSite();
        request.setAttribute("listSite", listSite);
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewListSite.jsp");
        dispatcher.forward(request, response);
    }

    //update staff
    private void updateSite(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        
        String siteID = request.getParameter("siteID");
        String siteName = request.getParameter("siteName");
        String siteAddress = request.getParameter("siteAddress");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String location = request.getParameter("location");
        String status = request.getParameter("status");
        site updateSite = new site(siteID, siteName, siteAddress, startDate, endDate, location, status);
        siteDAO.updateSite(updateSite);
        response.sendRedirect("listSite");
    }
    

    //delete staff
    private void deleteSite(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String siteID = request.getParameter("siteID");
        siteDAO.deleteSite(siteID);
        response.sendRedirect("listSite");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
