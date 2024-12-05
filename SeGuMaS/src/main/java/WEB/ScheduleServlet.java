/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package WEB;

import DAO.ScheduleDAO;
import DAO.SiteDAO;
import DAO.guardDAO;
import MODEL.Schedule;
import MODEL.guardPersonalDetails;
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
@WebServlet("/ScheduleServlet")
public class ScheduleServlet extends HttpServlet {

    private ScheduleDAO scheduleDAO;
    private guardDAO GuardDAO;
    private SiteDAO siteDAO;

    public void init() {
        scheduleDAO = new ScheduleDAO(); // Initialize your DAO here
        GuardDAO = new guardDAO();
        siteDAO = new SiteDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getServletPath();
        switch (action) {

            case "/ScheduleServlet":

            case "/newSchedule":
                showNewFormSchedule(request, response);
                break;

            case "/insertSchedule":
                insertSchedule(request, response);
                break;

//                case "/deleteSchedule":
//                    deleteSite(request, response);
//                    break;
//
//                case "/editSite":
//                    showEditForm(request, response);
//                    break;
//
//                case "/updateSite":
//                    updateSite(request, response);
//                    break;
//
//                case "/listSite":
//                    listSite(request, response);
//                    break;
            default:
                listSchedule(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
    
    private void showNewFormSchedule(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<guardPersonalDetails> listGuard = GuardDAO.selectAllGuardPersonalDetails();
        request.setAttribute("listGuard", listGuard);
        
        List<site> listSite = siteDAO.selectAllSite();
        request.setAttribute("listSite", listSite); 
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("createSchedule.jsp");
        dispatcher.forward(request, response);
    }

    private void insertSchedule(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String guardID = request.getParameter("guardID");
        int siteID = Integer.parseInt(request.getParameter("siteID"));
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String shift = request.getParameter("shift");
        
        System.out.println("guardID : "+guardID
                + "  siteID : "+siteID
                        + "  startDate : "+startDate
                                + "  endDate : "+endDate
                                + "  shift : "+shift);

        Schedule newSchedule = new Schedule(guardID, siteID, startDate, endDate, shift);
        scheduleDAO.insertSchedule(newSchedule);

        List<guardPersonalDetails> listGuard = GuardDAO.selectAllGuardPersonalDetails();
        request.setAttribute("listGuard", listGuard);
        
        List<site> listSite = siteDAO.selectAllSite();
        request.setAttribute("listSite", listSite);

        List<Schedule> schedules = scheduleDAO.getAllSchedules();
        request.setAttribute("schedules", schedules);

        RequestDispatcher dispatcher = request.getRequestDispatcher("createSchedule.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void listSchedule(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
