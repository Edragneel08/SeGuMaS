<%-- 
    Document   : addSite
    Created on : 8 Jun 2024, 2:46:08 pm
    Author     : edrag
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="DAO.StaffDAO" %>
<%@ page import="MODEL.staff" %>


<%
    String staffID = (String) session.getAttribute("staffID");
    StaffDAO staffDAO = new StaffDAO();
    staff staff = staffDAO.getStaffById(staffID);
    request.setAttribute("staff", staff);
%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">
        <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
        <title>ADD NEW HR STAFF</title>

        <!-- Favicons -->
        <link href="img/favicon.png" rel="icon">
        <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Bootstrap core CSS -->
        <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!--external css-->
        <link href="lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <!-- Custom styles for this template -->
        <link href="css/style.css" rel="stylesheet">
        <link href="css/style-responsive.css" rel="stylesheet">
        <link rel="stylesheet" href="css/addHR.css">

        <!-- alert check the session -->
        <%@ include file="sessionCheck.jsp" %>
    </head>

    <body>
        <section id="container">
            <!-- **********************************************************************************************************************************************************
                           TOP BAR CONTENT & NOTIFICATIONS
                           *********************************************************************************************************************************************************** -->
            <!--header start-->
            <header class="header black-bg">
                <div class="sidebar-toggle-box">
                    <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
                </div>
                <!--logo start-->
                <a href="index.html" class="logo"><b>JASA<span>PERKASA</span></b></a>
                <!--logo end-->
                <div class="nav notify-row" id="top_menu">
                    <!--  notification start -->
                    <ul class="nav top-menu">
                        <!-- settings start -->
                        <li class="dropdown">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
                                <i class="fa fa-tasks"></i>
                                <span class="badge bg-theme">4</span>
                            </a>
                            <ul class="dropdown-menu extended tasks-bar">
                                <div class="notify-arrow notify-arrow-green"></div>
                                <li>
                                    <p class="green">You have 4 pending tasks</p>
                                </li>
                                <li>
                                    <a href="index.html#">
                                        <div class="task-info">
                                            <div class="desc">Dashio Admin Panel</div>
                                            <div class="percent">40%</div>
                                        </div>
                                        <div class="progress progress-striped">
                                            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                                <span class="sr-only">40% Complete (success)</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="external">
                                    <a href="#">See All Tasks</a>
                                </li>
                            </ul>
                        </li>
                        <!-- notification dropdown end -->
                    </ul>
                    <!--  notification end -->
                </div>

                <div class="top-menu">
                    <ul class="nav pull-right top-menu">
                        <li><a class="logout" href="${pageContext.request.contextPath}/logout">Logout</a></li>
                    </ul>
                </div>
            </header>

            <!--header end-->
            <!-- **********************************************************************************************************************************************************
                MAIN SIDEBAR MENU
                *********************************************************************************************************************************************************** -->
            <!--sidebar start-->
            <aside>
                <div id="sidebar" class="nav-collapse ">
                    <!-- sidebar menu start-->
                    <ul class="sidebar-menu" id="nav-accordion">
                        <p class="centered">
                            <a href="profile.jsp">
                                <c:choose>
                                    <c:when test="${role == 'Admin'}">
                                        <img src="img/ui-sam.jpg" class="img-circle" width="80">                                    </c:when>
                                    <c:when test="${role == 'staff'}">
                                        <img src="data:image/jpeg;base64,<c:out value='${staff.base64Img}' />" alt="Profile Picture" class="img-circle" width="80">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="img/ui-sam.jpg" class="img-circle" width="80">
                                    </c:otherwise>
                                </c:choose>
                            </a>
                        </p>
                        <%
                        // Get the value of the "username" attribute from the session
                        username = (String) session.getAttribute("username");
                        String role = (String) session.getAttribute("role");
                        %>
                        <h5 class="centered">Hello, <%= username %></h5>

                        <!-- Admin Dashboard Link -->
                        <c:if test="${role == 'Admin'}">
                            <li class="mt">
                                <a href="adminDashboard.jsp">
                                    <i class="fa fa-dashboard"></i>
                                    <span>Dashboard</span>
                                </a>
                            </li>
                        </c:if>

                        <!-- Staff Dashboard Link -->
                        <c:if test="${role == 'staff'}">
                            <li class="mt">
                                <a href="staffDashboard.jsp">
                                    <i class="fa fa-dashboard"></i>
                                    <span>Dashboard</span>
                                </a>
                            </li>
                        </c:if>

                        <li class="sub-menu">
                            <a href="javascript:;">
                                <i class="fa fa-desktop"></i>
                                <span>MANAGE HR STAFF</span>
                            </a>
                            <ul class="sub">
                                <li><a href="addHRstaff.jsp">ADD NEW STAFF</a></li>
                                <li><a href="<%=request.getContextPath()%>/listStaff">LIST OF STAFF</a></li>
                            </ul>
                        </li>
                        <li class="sub-menu">
                            <a class="active" href="javascript:;">
                                <i class="fa fa-cogs"></i>
                                <span>MANAGE SITES</span>
                            </a>
                            <ul class="sub">
                                <li><a href="addSite.jsp" style="color: blue;" >ADD NEW SITE</a></li>
                                <li><a href="<%=request.getContextPath()%>/listSite">LIST OF SITE</a></li>
                            </ul>
                        </li>
                        <li class="sub-menu">
                            <a href="javascript:;">
                                <i class="fa fa-book"></i>
                                <span>MANAGE GUARD</span>
                            </a>
                            <ul class="sub">
                                <li><a href="addGuard.jsp">ADD NEW GUARD</a></li>
                                <li><a href="<%=request.getContextPath()%>/listGuard">LIST OF GUARD</a></li>
                            </ul>
                        </li>
                        <li class="sub-menu">
                            <a href="javascript:;">
                                <i class="fa fa-tasks"></i>
                                <span>MANAGE GUARD SCHEDULE</span>
                            </a>
                            <ul class="sub">
                                <li><a href="<%=request.getContextPath()%>/listGuardCreate" >ADD NEW SCHEDULE</a></li>
                                <li><a href="">LIST OF SCHEDULE</a></li>
                            </ul>
                        </li>
                        <li class="sub-menu">
                            <a href="javascript:;">
                                <i class="fa fa-th"></i>
                                <span>MANAGE LEAVE</span>
                            </a>
                            <ul class="sub">
                                <li><a href="<%=request.getContextPath()%>/listGuarddropDown">Create New Leave</a></li>
                                <li><a href="<%=request.getContextPath()%>/listLeave">View List</a></li>
                                <li><a href="<%=request.getContextPath()%>/listLeave_Staff">View List Staff</a></li>
                            </ul>
                        </li>

                        <!--                        MAIL BOX-->
                        <!--                        <li>
                                                    <a href="inbox.html">
                                                        <i class="fa fa-envelope"></i>
                                                        <span>Mail </span>
                                                        <span class="label label-theme pull-right mail-info">2</span>
                                                    </a>
                                                </li>-->


                        <li class="sub-menu">
                            <a href="javascript:;">
                                <i class=" fa fa-bar-chart-o"></i>
                                <span>CALCULATE SALARY</span>
                            </a>
                            <ul class="sub">
                                <li><a href="">View Salary Report</a></li>
                                <li><a href="">View Schedule Report</a></li>
                                <li><a href="">View Leave Report</a></li>
                            </ul>
                        </li>
                    </ul>
                    <!-- sidebar menu end-->
                </div>
            </aside>
            <!--sidebar end-->
            <!-- **********************************************************************************************************************************************************
                MAIN CONTENT
                *********************************************************************************************************************************************************** -->
            <!--main content start-->
            <section id="main-content">
                <section class="wrapper site-min-height">
                    <c:if test="${site != null}">
                        <h3><i class="fa fa-angle-right"></i> EDIT SITE</h3>
                    </c:if>
                    <c:if test="${site == null}">
                        <h3><i class="fa fa-angle-right"></i> ADD NEW SITE</h3>
                    </c:if>
                    <div class="row mt">
                        <div class="col-lg-1">
                        </div>
                        <div class="col-lg-10">
                            <div class="form-panel1">
                                <div class="form">
                                    <c:if test="${site != null}">
                                        <form class="cmxform form-horizontal style-form" id="commentForm" action="updateSite" method="GET">
                                            <div class="form-group">
                                                <label for="staffid" class="control-label col-lg-2">Staff ID</label>
                                                <div class="col-lg-10">
                                                    <input type="text" value="<c:out value='${site.siteID}' />"
                                                           class="form-control" id="disabledInput" name="siteID" placeholder="Disabled input here..." disabled="">
                                                    <input type="hidden" value="<c:out value='${site.siteID}' />"
                                                           class="form-control" name="siteID">
                                                </div>
                                            </div>
                                        </c:if>

                                        <c:if test="${site == null}">
                                            <form class="cmxform form-horizontal style-form" id="commentForm" action="insertSite" method="GET">
                                            </c:if>

                                            <div class="form-group">
                                                <label for="siteName" class="control-label col-lg-2">SITE NAME (ZONE)</label>
                                                <div class="col-lg-8">
                                                    <input type="text" value="<c:out value='${site.siteName}' />"
                                                           id="siteName" name="siteName" class="form-control" required>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="siteAddress" class="control-label col-lg-2">SITE ADDRESS</label>
                                                <div class="col-lg-8">
                                                    <textarea id="siteAddress" name="siteAddress" rows="5" class="form-control" required><c:out value="${site.siteAddress}" /></textarea>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="startDate" class="control-label col-lg-2">START DATE</label>
                                                <div class="col-lg-3">
                                                    <input type="date" value="<c:out value='${site.startDate}' />"
                                                           id="startDate" name="startDate" class="form-control" required>
                                                </div>

                                                <label for="endDate" class="control-label col-lg-2">END DATE</label>
                                                <div class="col-lg-3">
                                                    <input type="date" value="<c:out value='${site.endDate}' />"
                                                           id="endDate" name="endDate" class="form-control" required>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="location" class="control-label col-lg-2">LOCATION</label>
                                                <div class="col-lg-8">
                                                    <input type="text" value="<c:out value='${site.location}' />"
                                                           id="location" name="location" class="form-control" required>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="status" class="control-label col-lg-2">Status</label>
                                                <div class="col-lg-8">
                                                    <select id="status" name="status" class="form-control" required>
                                                        <option value="Choose" <c:if test="${site.status eq 'Choose'}">selected</c:if>>Choose</option>
                                                        <option value="Active" <c:if test="${site.status eq 'Active'}">selected</c:if>>Active</option>
                                                        <option value="Not Active" <c:if test="${site.status eq 'Not Active'}">selected</c:if>>Not Active</option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <div class="col-lg-offset-2 col-lg-8">
                                                    <c:if test="${site != null}">
                                                        <button type="submit" class="btn btn-success">UPDATE</button>
                                                        <input type='hidden' name="action" value="update">
                                                    </c:if>
                                                    <c:if test="${site == null}">
                                                        <button type="submit" class="btn btn-success">SUBMIT</button>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </form>
                                </div>

                            </div>
                        </div>
                        <div class="col-lg-1">
                        </div>
                    </div>   
                </section>
                <!-- /wrapper -->
            </section>
            <!-- /MAIN CONTENT -->
            <br>
            <!--main content end-->
            <!--footer start-->
            <footer class="site-footer">
                <div class="text-center">
                    <p>
                        &copy; Specially Made For Bintara Camar Security SDN BHD
                    </p>
                    <div class="credits">

                        Created with Love by Iruman
                    </div>
                </div>
            </footer>
            <!--footer end-->
        </section>
        <!-- js placed at the end of the document so the pages load faster -->
        <script src="lib/jquery/jquery.min.js"></script>
        <script src="lib/bootstrap/js/bootstrap.min.js"></script>
        <script src="lib/jquery-ui-1.9.2.custom.min.js"></script>
        <script src="lib/jquery.ui.touch-punch.min.js"></script>
        <script class="include" type="text/javascript" src="lib/jquery.dcjqaccordion.2.7.js"></script>
        <script src="lib/jquery.scrollTo.min.js"></script>
        <script src="lib/jquery.nicescroll.js" type="text/javascript"></script>
        <!--common script for all pages-->
        <script src="lib/common-scripts.js"></script>
        <!--script for this page-->

    </body>
</html>