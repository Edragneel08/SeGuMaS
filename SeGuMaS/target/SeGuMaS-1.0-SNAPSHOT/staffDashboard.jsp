<%-- 
    Document   : staffDashboard
    Created on : 8 Jun 2024, 6:46:05 pm
    Author     : edrag
--%>

<%-- 
    Document   : adminMenu
    Created on : 14 Jan 2024, 1:35:50 pm
    Author     : edrag
--%>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="java.util.List, java.util.ArrayList, java.util.HashMap, java.util.Map" %>
<%@ page import="DAO.SiteDAO" %>
<%@ page import="MODEL.site" %>
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
        <title>Staff Menu Dashboard</title>

        <!-- Favicons -->
        <link href="img/favicon.png" rel="icon">
        <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Bootstrap core CSS -->
        <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!--external css-->
        <link href="lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="css/zabuto_calendar.css">
        <link rel="stylesheet" type="text/css" href="lib/gritter/css/jquery.gritter.css" />
        <!-- Custom styles for this template -->
        <link href="css/style.css" rel="stylesheet">
        <link href="css/style-responsive.css" rel="stylesheet">
        <script src="lib/chart-master/Chart.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

        <!-- alert check the session -->
        <%@ include file="sessionCheck.jsp" %>
        <%@ include file="graphDashboard.jsp" %>
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
                                <a class="active" href="adminDashboard.jsp">
                                    <i class="fa fa-dashboard"></i>
                                    <span>Dashboard</span>
                                </a>
                            </li>
                        </c:if>

                        <!-- Staff Dashboard Link -->
                        <c:if test="${role == 'staff'}">
                            <li class="mt">
                                <a class="active" href="staffDashboard.jsp">
                                    <i class="fa fa-dashboard"></i>
                                    <span>Dashboard</span>
                                </a>
                            </li>
                        </c:if>

                        <c:if test="${role == 'manager'}">
                            <li class="mt">
                                <a class="active" href="staffDashboard.jsp">
                                    <i class="fa fa-dashboard"></i>
                                    <span>Dashboard</span>
                                </a>
                            </li>
                        </c:if>

                        <c:if test="${role == 'Admin'}">
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
                        </c:if>
                        <c:if test="${role == 'manager'}">
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
                        </c:if>

                        <c:if test="${role == 'Admin'}">
                            <li class="sub-menu">
                                <a href="javascript:;">
                                    <i class="fa fa-cogs"></i>
                                    <span>MANAGE SITES</span>
                                </a>
                                <ul class="sub">
                                    <li><a href="addSite.jsp">ADD NEW SITE</a></li>
                                    <li><a href="<%=request.getContextPath()%>/listSite">LIST OF SITE</a></li>
                                </ul>
                            </li>
                        </c:if>
                        <c:if test="${role == 'manager'}">
                            <li class="sub-menu">
                                <a href="javascript:;">
                                    <i class="fa fa-cogs"></i>
                                    <span>MANAGE SITES</span>
                                </a>
                                <ul class="sub">
                                    <li><a href="addSite.jsp">ADD NEW SITE</a></li>
                                    <li><a href="<%=request.getContextPath()%>/listSite">LIST OF SITE</a></li>
                                </ul>
                            </li>
                        </c:if>

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
                                    <c:if test="${role == 'Admin'}">
                                    <li><a href="<%=request.getContextPath()%>/listLeave">View List</a></li>
                                    </c:if>
                                    <c:if test="${role == 'manager'}">
                                    <li><a href="<%=request.getContextPath()%>/listLeave">View List</a></li>
                                    </c:if>
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
                    <div class="col-md-12">
                        <div class="col-md-8">
                            <canvas id="myChart" width="100" height="74"></canvas>
                        </div>
                        <div class="col-md-4">
                            <div class="col-md-2"></div>
                            <div class="col-md-2"></div>
                            <!-- CALENDAR-->
                            <div id="calendar" class="mb">
                                <div class="panel green-panel no-margin">
                                    <div class="panel-body">
                                        <div id="date-popover" class="popover top" style="cursor: pointer; disadding: block; margin-left: 33%; width: 175px;">
                                            <div class="arrow"></div>
                                            <h3 class="popover-title" style="disadding: none;"></h3>
                                            <div id="date-popover-content" class="popover-content"></div>
                                        </div>
                                        <div id="my-calendar"></div>
                                    </div>
                                </div>
                            </div>
                            <!-- / calendar -->
                        </div>
                    </div>

                    <div class="col-md-12">

                    </div>
                </section>
            </section>
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
        <script class="include" type="text/javascript" src="lib/jquery.dcjqaccordion.2.7.js"></script>
        <script src="lib/jquery.scrollTo.min.js"></script>
        <script src="lib/jquery.nicescroll.js" type="text/javascript"></script>
        <script src="lib/jquery.sparkline.js"></script>
        <!--common script for all pages-->
        <script src="lib/common-scripts.js"></script>
        <script type="text/javascript" src="lib/gritter/js/jquery.gritter.js"></script>
        <script type="text/javascript" src="lib/gritter-conf.js"></script>
        <!--script for this page-->
        <script src="lib/sparkline-chart.js"></script>
        <script src="lib/zabuto_calendar.js"></script>

        <!<!-- calendar -->
        <script type="application/javascript">
            $(document).ready(function() {
            $("#date-popover").popover({
            html: true,
            trigger: "manual"
            });
            $("#date-popover").hide();
            $("#date-popover").click(function(e) {
            $(this).hide();
            });
            $("#my-calendar").zabuto_calendar({
            action: function() {
            return myDateFunction(this.id, false);
            },
            action_nav: function() {
            return myNavFunction(this.id);
            },
            ajax: {
            url: "show_data.php?action=1",
            modal: true
            },
            legend: [{
            type: "text",
            label: "Special event",
            badge: "00"
            },
            {
            type: "block",
            label: "Regular event",
            }
            ]
            });
            });
        </script>
        <!--graph script-->
        <script>
const siteNames = <%= siteNamesJson %>;
const activeCounts = <%= activeCountsJson %>;

const ctx = document.getElementById('myChart').getContext('2d');
const myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: siteNames,
        datasets: [{
                label: 'Active Sites',
                data: activeCounts,
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 1
            }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true,
                ticks: {
                    callback: function (value) {
                        if (Number.isInteger(value)) {
                            return value;
                        }
                    },
                    stepSize: 1
                }
            }
        },
        plugins: {
            title: {
                display: true,
                text: 'Number of Active Sites by Name'
            }
        }
    }
});
        </script>
    </body>
</html>

