<%-- 
    Document   : viewLeaveList
    Created on : 8 Jun 2024, 8:37:14 pm
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
                            <a class="active" href="javascript:;">
                                <i class="fa fa-desktop"></i>
                                <span>MANAGE HR STAFF</span>
                            </a>
                            <ul class="sub">
                                <li><a href="addHRstaff.jsp">ADD NEW STAFF</a></li>
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
                            <a class="active" href="javascript:;">
                                <i class="fa fa-th"></i>
                                <span>MANAGE LEAVE</span>
                            </a>
                            <ul class="sub">
                                <li><a href="<%=request.getContextPath()%>/listGuarddropDown">Create New Leave</a></li>
                                <li><a href="<%=request.getContextPath()%>/listLeave" style="color: blue;">View List</a></li>
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
                    <div>
                        <h2 class="mt-5">Leave Requests List</h2>
                        <div class="search-container">
                            <input type="text" id="searchInput" class="form-control" placeholder="Search..." onkeyup="searchTable()">
                        </div>
                        <br>
                        <div class="table-wrapper">
                            <table class="table table-striped table-bordered table-hover" id="leaveTable">
                                <thead class="thead-dark">
                                    <tr>
                                        <th>Leave ID</th>
                                        <th>Guard ID</th>
                                        <th>Guard Name</th>
                                        <th>Leave Type</th>
                                        <th>Start Date</th>
                                        <th>End Date</th>
                                        <th>Reason</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody id="leaveTableBody" style="background-color:white"> 
                                    <c:forEach var="leave" items="${listLeave}">
                                        <tr>
                                            <td><c:out value="${leave.leaveID}" /></td>
                                            <td><c:out value="${leave.guardID}" /></td>
                                            <td><c:out value="${leave.guardName}" /></td>
                                            <td><c:out value="${leave.leaveType}" /></td>
                                            <td><c:out value="${leave.startDate}" /></td>
                                            <td><c:out value="${leave.endDate}" /></td>
                                            <td><c:out value="${leave.reason}" /></td>
                                            <td style="text-align: center;">
                                                <button id="statusButton-${leave.leaveID}" class="btn" style="background-color: ${leave.status eq 'Approved' ? '#50C878' : (leave.status eq 'Rejected' ? 'red' : '')}; color:black;" onclick="toggleStatus(${leave.leaveID})">
                                                    <c:out value="${leave.status}" />
                                                </button>
                                            </td>

                                            <td style="text-align: center;">
                                                <c:if test="${leave.status eq 'Approved' or leave.status eq 'Rejected'}">
                                                    <button id="completeButton-${leave.leaveID}" class="btn btn-success" onclick="updateStatus(${leave.leaveID}, 'COMPLETED')">COMPLETED</button>
                                                </c:if>

                                                <c:if test="${leave.status eq 'In Process'}">
                                                    <button id="approveButton-${leave.leaveID}" class="btn btn-success" onclick="updateStatus(${leave.leaveID}, 'Approved')">Approve</button>
                                                    <button id="rejectButton-${leave.leaveID}" class="btn btn-danger" onclick="updateStatus(${leave.leaveID}, 'Rejected')">Reject</button>
                                                </c:if>

                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <input type="hidden" id="listLeaveSize" value="${listLeave.size()}">
                            <input type="hidden" id="itemsPerPage" value="10">

                            <nav>
                                <ul class="pagination justify-content-center" id="pagination">
                                    <!-- Pagination links will be added here by JavaScript -->
                                </ul>
                            </nav>
                        </div>


                        <script>
                            // Function to update leave status
                            function updateStatus(leaveID, status) {
                                // Disable both buttons to prevent further clicks
                                document.getElementById('approveButton-' + leaveID).disabled = true;
                                document.getElementById('rejectButton-' + leaveID).disabled = true;

                                $.ajax({
                                    url: 'updateLeave', // URL to your server-side servlet
                                    method: 'POST',
                                    data: {leaveID: leaveID, status: status},
                                    success: function (response) {
                                        // Update status cell in the table
                                        document.getElementById('status-' + leaveID).innerText = status;

                                        // Change the button texts to "Completed"
                                        if (status === 'Approved' || status === 'Rejected') {
                                            document.getElementById('approveButton-' + leaveID).innerText = "Completed";
                                            document.getElementById('rejectButton-' + leaveID).style.display = 'none'; // Hide the other button
                                        } else {
                                            document.getElementById('rejectButton-' + leaveID).innerText = "Completed";
                                            document.getElementById('approveButton-' + leaveID).style.display = 'none'; // Hide the other button
                                        }

                                        // Optional: Notify the user of the successful status update
                                        alert('Leave status updated successfully');
                                    },
                                    error: function (xhr, status, error) {
                                        console.error('Error updating leave status:', error);
                                        // Optional: Notify the user of the error
                                        alert('Error updating leave status');
                                    }
                                });

                                // Reload the page
                                location.reload();
                            }

                            //search function
                            function searchTable() {
                                var input, filter, table, tr, td, i, txtValue;
                                input = document.getElementById("searchInput");
                                filter = input.value.toUpperCase();
                                table = document.getElementById("leaveTableBody");
                                tr = table.getElementsByTagName("tr");

                                for (i = 0; i < tr.length; i++) {
                                    td = tr[i].getElementsByTagName("td");
                                    var found = false;
                                    if (filter === "") { // Check if the filter is empty
                                        // Reset pagination
                                        generatePagination();
                                    } else {
                                        for (var j = 0; j < td.length; j++) {
                                            txtValue = td[j].textContent || td[j].innerText;
                                            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                                                found = true;
                                                break;
                                            }
                                        }
                                        if (found) {
                                            tr[i].style.display = ""; // Show the row if found
                                        } else {
                                            tr[i].style.display = "none"; // Hide the row if not found
                                        }
                                    }
                                }
                            }

                            function showPage(pageNumber) {
                                var itemsPerPage = parseInt(document.getElementById('itemsPerPage').value);
                                var rows = document.getElementById('leaveTableBody').rows;

                                var startIndex = (pageNumber - 1) * itemsPerPage;
                                var endIndex = Math.min(startIndex + itemsPerPage, rows.length);

                                for (var i = 0; i < rows.length; i++) {
                                    rows[i].style.display = 'none';
                                }

                                for (var i = startIndex; i < endIndex; i++) {
                                    rows[i].style.display = '';
                                }

                                updatePagination(pageNumber);
                            }

                            function generatePagination() {
                                var itemsPerPage = parseInt(document.getElementById('itemsPerPage').value);
                                var totalItems = parseInt(document.getElementById('listLeaveSize').value);
                                var totalPages = Math.ceil(totalItems / itemsPerPage);
                                var paginationElement = document.getElementById('pagination');
                                paginationElement.innerHTML = '';

                                for (var i = 1; i <= totalPages; i++) {
                                    var li = document.createElement('li');
                                    var link = document.createElement('a');
                                    link.href = '#';
                                    link.innerHTML = i;
                                    link.onclick = (function (page) {
                                        return function () {
                                            showPage(page);
                                        };
                                    })(i);
                                    li.appendChild(link);
                                    paginationElement.appendChild(li);
                                }

                                showPage(1);
                            }

                            function updatePagination(currentPage) {
                                var paginationElement = document.getElementById('pagination');
                                var paginationItems = paginationElement.getElementsByTagName('li');

                                for (var i = 0; i < paginationItems.length; i++) {
                                    paginationItems[i].classList.remove('active');
                                }

                                paginationItems[currentPage - 1].classList.add('active');
                            }

                            generatePagination();
                        </script>
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

    </body>
</html>
