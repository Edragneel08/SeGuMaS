<%-- 
    Document   : addNewGuard
    Created on : 8 Jun 2024, 12:07:12 pm
    Author     : edrag
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
        <link href="lib/bootstrap/css/bootstrap.css" rel="stylesheet">

        <!--external css-->
        <link href="lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <!-- Custom styles for this template -->
        <link href="css/style.css" rel="stylesheet">
        <link href="css/style-responsive.css" rel="stylesheet">
        <link rel="stylesheet" href="css/addHR.css">
        <link rel="stylesheet" type="text/css" href="css/lib/bootstrap-fileupload/bootstrap-fileupload.css">

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
                <a href="index.html" class="logo"><b>Bintara<span>CAMAR</span></b></a>
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
                        <p class="centered"><a href="profile.jsp"><img src="img/ui-sam.jpg" class="img-circle" width="80"></a></p>
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
                            <a class="active" href="javascript:;">
                                <i class="fa fa-desktop"></i>
                                <span>MANAGE HR STAFF</span>
                            </a>
                            <ul class="sub">
                                <li><a href="addHRstaff.jsp" style="color: blue;">ADD NEW STAFF</a></li>
                                <li><a href="<%=request.getContextPath()%>/listStaff">LIST OF STAFF</a></li>
                            </ul>
                        </li>
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
                    <c:if test="${staff != null}">
                        <h3><i class="fa fa-angle-right"></i> EDIT STAFF</h3>
                    </c:if>
                    <c:if test="${staff == null}">
                        <h3><i class="fa fa-angle-right"></i> ADD NEW STAFF</h3>
                    </c:if>
                    <div class="row mt">
                        <div class="col-lg-1">
                        </div>
                        <div class="col-lg-10">
                            <div class="form-panel1">
                                <div class="form">

                                    <c:if test="${staff == null}">
                                        <form class="cmxform form-horizontal style-form" id="commentForm" action="insert" method="POST" enctype="multipart/form-data">
                                            <!--<input type='hidden' name="action" value="insert">-->
                                        </c:if>

                                        <c:if test="${staff != null}">
                                            <form class="cmxform form-horizontal style-form" id="commentForm" action="update" method="POST" enctype="multipart/form-data">

                                                <div class="form-group ">
                                                    <label for="staffid" class="control-label col-lg-2">Staff ID</label>
                                                    <div class="col-lg-10">
                                                        <input type="text" value="<c:out value='${staff.SID}' />" 
                                                               class="form-control" id="disabledInput" name="SID" placeholder="Disabled input here..." readonly>
                                                        <input type="hidden" value="<c:out value='${staff.staffID}' />" 
                                                               class="form-control" id="disabledInput" name="staffID" placeholder="Disabled input here..." readonly>
                                                    </div>
                                                </div>
                                            </c:if>

                                            <div class="form-group">
                                                <label for="staffName" class="control-label col-lg-2">Name (required)</label>
                                                <div class="col-lg-10">
                                                    <input type="text" value="<c:out value='${staff.fullname}' />"
                                                           class="form-control" name="fullname" required="required"/>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="ICNO" class="control-label col-lg-2">IC NO (required)</label>
                                                <div class="col-lg-10">
                                                    <input type="text" value="<c:out value='${staff.ICNO}' />"
                                                           class="form-control" name="ICNO" required="required"/>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="noPhone" class="control-label col-lg-2">No Phone (required)</label>
                                                <div class="col-lg-10">
                                                    <input type="text" value="<c:out value='${staff.noPhone}' />"
                                                           class="form-control" name="noPhone" required="required"/>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="img" class="control-label col-lg-2">Staff Image (required)</label>

                                                <div class="fileupload fileupload-new col-lg-10" data-provides="fileupload">
                                                    <div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">
                                                        <c:if test="${staff == null}">

                                                            <img src="data:image/jpeg;base64,<c:out value='${staff.base64Img}' />" alt="Guard Image">
                                                        </c:if>
                                                        <c:if test="${staff != null}">
                                                            <!-- Display existing image or placeholder -->

                                                            <img src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image" alt="No image">

                                                        </c:if>

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

                                                <div class="form-group ">
                                                    <label for="email" class="control-label col-lg-2">E-mail (required)</label>
                                                    <div class="col-lg-10">
                                                        <input type="text" value="<c:out value='${staff.email}' />" 
                                                               class="form-control" name="email"/>
                                                    </div>
                                                </div>

                                                <div class="form-group ">
                                                    <label for="username" class="control-label col-lg-2">Username (required)</label>
                                                    <div class="col-lg-10">
                                                        <input type="text" value="<c:out value='${staff.username}' />" 
                                                               class="form-control" name="username"/>
                                                    </div>
                                                </div>

                                                <div class="form-group ">
                                                    <label for="password" class="control-label col-lg-2">Password (required)</label>
                                                    <div class="col-lg-10">
                                                        <input type="text" value="<c:out value='${staff.password}' />" 
                                                               class="form-control" name="password"/>
                                                    </div>
                                                </div>

                                                <c:if test="${staff != null}">
                                                    <div class="form-group">
                                                        <div class="col-lg-offset-2 col-lg-10">
                                                            <button class="btn btn-theme" type="submit">Update</button>
                                                            <input type='hidden' name="action" value="update">
                                                            <button class="btn btn-theme04" type="reset">Cancel</button>
                                                        </div>
                                                    </div>
                                                </c:if>
                                                <c:if test="${staff == null}">
                                                    <div class="form-group">
                                                        <div class="col-lg-offset-2 col-lg-10">
                                                            <button class="btn btn-theme" type="submit">Save</button>
                                                            <button class="btn btn-theme04" type="reset">Cancel</button>
                                                        </div>
                                                    </div>
                                                </c:if>
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
        <script type="text/javascript" src="css/lib/bootstrap-fileupload/bootstrap-fileupload.js"></script>

    </body>
</html>
