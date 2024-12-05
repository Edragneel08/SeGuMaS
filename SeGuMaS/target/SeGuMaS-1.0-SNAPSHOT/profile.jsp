<%-- 
    Document   : profile
    Created on : 22 Jun 2024, 1:53:18 pm
    Author     : edrag
--%>


<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <title>Profile Menu</title>

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
        <link rel="stylesheet" type="text/css" href="css/lib/bootstrap-fileupload/bootstrap-fileupload.css">

        <!-- alert check the session -->
        <%@ include file="sessionCheck.jsp" %>
        <style>
            .profile-header {
                text-align: center;
                margin-bottom: 20px;
            }
            .profile-picture img {
                width: 160px;
                height: 150px;
                border-radius: 10px;
                display: block;
                margin: 0 auto;
            }
            .profile-details {
                margin-top: 20px;
            }
            .profile-details p {
                font-size: 18px;
                margin: 5px 0;
            }
            .profile-actions {
                text-align: center;
                margin-top: 20px;
            }
            .profile-actions .btn {
                padding: 10px 20px;
                font-size: 16px;
                margin: 5px;
            }
        </style>
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
                        <c:if test="${role == 'manager'}">
                            <li class="mt">
                                <a href="staffDashboard.jsp">
                                    <i class="fa fa-dashboard"></i>
                                    <span>Dashboard</span>
                                </a>
                            </li>
                        </c:if>

                        <li class="sub-menu">
                            <a class="active" href="javascript:;">
                                <i class="fa fa-cogs"></i>
                                <span>PROFILE</span>
                            </a>
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
                    <div class="col-lg-12 mt">
                        <div class="row content-panel">
                            <div class="panel-heading">
                                <ul class="nav nav-tabs nav-justified">
                                    <li class="active">
                                        <a data-toggle="tab" id="#contact" class="#contact" href="#contact" class="contact-map">User Profile</a>
                                    </li>
                                    <li>
                                        <a data-toggle="tab" id="#edit" class="#edit" href="#edit">Edit Profile</a>
                                    </li>
                                </ul>
                            </div>
                            <!-- /panel-heading -->
                            <div class="panel-body">
                                <div class="tab-content">
                                    <!-- /tab-pane -->
                                    <div id="contact" class="tab-pane active">
                                        <div class="row">
                                            <div class="col-lg-8 col-lg-offset-2 detailed">
                                                <div class="profile-header">
                                                    <h1>User Profile</h1>
                                                </div>
                                                <c:if test="${staff != null}">
                                                    <div class="profile-content">
                                                        <div class="profile-picture">
                                                            <img src="data:image/jpeg;base64,<c:out value='${staff.base64Img}' />" alt="Profile Picture">
                                                        </div>
                                                        <div class="profile-details col-md-9 col-md-offset-2 mt">
                                                            <div class="form-group">
                                                                <label for="sid">Staff ID:</label>
                                                                <input type="text" id="sid" class="form-control" value="<c:out value='${staff.SID}' />" readonly>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="fullname">Name:</label>
                                                                <input type="text" id="fullname" class="form-control" value="<c:out value='${staff.fullname}' />" readonly>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="icno">IC NO:</label>
                                                                <input type="text" id="icno" class="form-control" value="<c:out value='${staff.ICNO}' />" readonly>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="phone">Phone Number:</label>
                                                                <input type="text" id="phone" class="form-control" value="<c:out value='${staff.noPhone}' />" readonly>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="email">Email:</label>
                                                                <input type="email" id="email" class="form-control" value="<c:out value='${staff.email}' />" readonly>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="username">Username:</label>
                                                                <input type="text" id="username" class="form-control" value="<c:out value='${staff.username}' />" readonly>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:if>
                                                <c:if test="${staff == null}">

                                                </c:if>

                                            </div>
                                        </div>                                        
                                        <!-- /row -->
                                    </div>
                                    <!-- /tab-pane -->
                                    <div id="edit" class="tab-pane">
                                        <div class="row">
                                            <div class="col-lg-8 col-lg-offset-2 detailed">
                                                <h4 class="mb">Personal Information</h4>
                                                <form role="form" class="form-horizontal" action="update" method="POST" enctype="multipart/form-data">
                                                    <div class="form-group">
                                                        <label class="col-lg-2 control-label"> PROFILE IMAGE</label>
                                                        <div class="col-lg-6">
                                                            <div class="fileupload fileupload-new col-lg-10" data-provides="fileupload">
                                                                <div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">
                                                                    <!-- Display existing image or placeholder -->
                                                                    <%
                                                                        if (staff != null && staff.getBase64Img() != null) { 
                                                                    %>
                                                                    <img src="data:image/jpeg;base64,<c:out value='${staff.base64Img}' />" alt="Guard Image">
                                                                    <% } else { %>
                                                                    <img src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image" alt="No image">
                                                                    <% } %>
                                                                </div>
                                                                <div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
                                                                <div>
                                                                    <span class="btn btn-theme02 btn-file">
                                                                        <span class="fileupload-new"><i class="fa fa-paperclip"></i> Select image</span>
                                                                        <span class="fileupload-exists"><i class="fa fa-undo"></i> Change</span>
                                                                        <input type="file" class="default" name="img">
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-lg-2 control-label">STAFF ID</label>
                                                        <div class="col-lg-6">
                                                            <input type="text" id="sid" name="SID" class="form-control" value="<c:out value='${staff.SID}' />" readonly>
                                                            <input type="hidden" id="sid" name="staffID" class="form-control" value="<c:out value='${staff.staffID}' />">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-lg-2 control-label">FULLNAME</label>
                                                        <div class="col-lg-6">
                                                            <input type="text" id="fullname" name="fullname" class="form-control" value="<c:out value='${staff.fullname}' />">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-lg-2 control-label">ICNO</label>
                                                        <div class="col-lg-6">
                                                            <input type="text" id="icno" name="ICNO" class="form-control" value="<c:out value='${staff.ICNO}' />">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-lg-2 control-label">PHONE NUMBER</label>
                                                        <div class="col-lg-6">
                                                            <input type="text" id="phone" name="noPhone" class="form-control" value="<c:out value='${staff.noPhone}' />">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-lg-2 control-label">EMAIL</label>
                                                        <div class="col-lg-6">
                                                            <input type="email" id="email" name="email" class="form-control" value="<c:out value='${staff.email}' />">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-lg-2 control-label">USERNAME</label>
                                                        <div class="col-lg-6">
                                                            <input type="text" id="username" name="username" class="form-control" value="<c:out value='${staff.username}' />">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-lg-2 control-label">PASSWORD</label>
                                                        <div class="col-lg-6">
                                                            <input type="text" id="password" name="password" class="form-control" value="<c:out value='${staff.password}' />">
                                                        </div>
                                                    </div>
                                                    <div class="profile-actions">
                                                        <button class="btn btn-edit btn-theme" onclick="location.href = 'editProfileUrl'">UPDATE</button>
                                                    </div>
                                                </form>
                                                <div class="col-lg-8 col-lg-offset-2 detailed">
                                                    <br><br><br><br>
                                                </div>
                                            </div>
                                            <!-- /col-lg-8 -->
                                        </div>
                                        <!-- /row -->
                                    </div>
                                    <!-- /tab-pane -->
                                </div>
                                <!-- /tab-content -->
                            </div>
                            <!-- /panel-body -->
                        </div>
                        <!-- /col-lg-12 -->
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
    </body>
</html>

