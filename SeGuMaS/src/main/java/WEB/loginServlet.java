package WEB;

import DAO.SiteDAO;
import DAO.leaveDAO;
import DAO.loginDAO;
import MODEL.leave;
import MODEL.site;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/")
public class loginServlet extends HttpServlet {

    private loginDAO LoginDAO;
    private leaveDAO LeaveDAO;
    private SiteDAO siteDAO;

    public void init() {
        LoginDAO = new loginDAO();
        LeaveDAO = new leaveDAO();
        siteDAO = new SiteDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Get the role, username, and password from the request parameters
        String role = request.getParameter("role");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        HttpSession session = request.getSession(true);
        List<site> sites = siteDAO.selectAllSite();

        switch (role) {
            case "Admin":
                if (session.getAttribute("username") == null) {
                    if (!LoginDAO.validate(username, password)) {
                        session.removeAttribute("username");
                        session.removeAttribute("role");
                        showErrorAlert(response);
                        return;
                    } else {
                        int adminID = LoginDAO.getAdminId(username, password);
                        session.setAttribute("username", username);
                        session.setAttribute("role", "Admin");
                        session.setAttribute("adminID", String.valueOf(adminID));
                    }
                }

                request.setAttribute("sites", sites);
                List<leave> leaveCounts = LeaveDAO.selectAllLeaveCounts();
                request.setAttribute("leaveCounts", leaveCounts);
                forwardRequest(request, response, "adminDashboard.jsp");
                break;

            case "staff":
                if (session.getAttribute("username") == null) {
                    if (!LoginDAO.validateStaff(username, password)) {
                        session.removeAttribute("username");
                        session.removeAttribute("role");
                        showErrorAlert(response);
                        return;
                    } else {
                        int staffID = LoginDAO.getStaffId(username, password);
                        session.setAttribute("username", username);
                        session.setAttribute("role", "staff");
                        session.setAttribute("staffID", String.valueOf(staffID));
                    }
                }
                request.setAttribute("sites", sites);
                forwardRequest(request, response, "staffDashboard.jsp");
                break;

            case "manager":
                if (session.getAttribute("username") == null) {
                    if (!LoginDAO.validateStaff(username, password)) { 
                        session.removeAttribute("username");
                        session.removeAttribute("role");
                        showErrorAlert(response);
                        return;
                    } else {
                        int staffID = LoginDAO.getStaffId(username, password);
                        session.setAttribute("username", username);
                        session.setAttribute("role", "manager");
                        session.setAttribute("staffID", String.valueOf(staffID));
                    }
                }
                // Additional logic specific to manager role if needed
                forwardRequest(request, response, "staffDashboard.jsp");
                break;

            default:
                showErrorAlert(response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    private void showErrorAlert(HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head>");
        out.println("</head>");
        out.println("<body>");
        out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
        out.println("<script type='text/javascript'>");
        out.println("Swal.fire({");
        out.println("  icon: 'error',");
        out.println("  title: 'Oops...',");
        out.println("  text: 'Sorry, Please insert the right information. Have a great day!'");
        out.println("}).then(() => {");
        out.println("  window.location.replace('index.jsp');");
        out.println("});");
        out.println("</script>");
        out.println("</body>");
        out.println("</html>");
        out.close();
    }

    private void forwardRequest(HttpServletRequest request, HttpServletResponse response, String path)
            throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher(path);
        rd.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
