<%-- 
    Document   : viewGuardList
    Created on : 10 Jun 2024, 11:08:06 pm
    Author     : edrag
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
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
        <title>GUARD LIST</title>

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

        <!-- SweetAlert CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
        <!-- SweetAlert JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
                            <a class="active" href="javascript:;">
                                <i class="fa fa-book"></i>
                                <span>MANAGE GUARD</span>
                            </a>
                            <ul class="sub">
                                <li><a href="addGuard.jsp">ADD NEW GUARD</a></li>
                                <li><a href="<%=request.getContextPath()%>/listGuard" style="color: blue;">LIST OF GUARD</a></li>
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
                                <li><a href="<%=request.getContextPath()%>/listLeave_Staff" style="color: blue;">View List Staff</a></li>
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

            <script type="text/javascript">
                // Function to periodically check session status
                function checkSessionStatus() {
                    var username = '<%= session.getAttribute("username") %>';
                    if (!username) {
                        showLoginPopup();
                    }
                }

                // Function to show login popup
                function showLoginPopup() {
                    alert('Your session has expired. Please log in again.');
                    window.location.href = '<%= request.getContextPath() %>/login'; // Redirect to login page
                }

                // Check session status initially
                checkSessionStatus();

                // Check session status every 5 minutes (300000 milliseconds)
                setInterval(checkSessionStatus, 300000); // Adjust the interval as needed
            </script>

            <section id="main-content">
                <section class="wrapper site-min-height">
                    <div>
                        <h2 class="mt-5">Guards List</h2>
                        <div>
                            <button style="float: right;" class="printButton" data-id="<c:out value='${guard.guardID}' />">PRINT CARD</button>
                        </div>
                        <iframe id="printFrameCard" style="display:none;"></iframe>
                        <script>
                            document.querySelectorAll('.printButton').forEach(function (button) {
                                button.onclick = function () {
                                    var id = this.getAttribute('data-id');
                                    var printFrame = document.getElementById('printFrameCard');

                                    // Load the guardProfilePrint.jsp in the iframe
                                    printFrame.src = 'guardCard.jsp?guardID=' + id;

                                    // Wait for the iframe to load and then trigger the print
                                    printFrame.onload = function () {
                                        printFrame.contentWindow.print();
                                    };
                                };
                            });
                        </script>
                        <br>
                        <div class="search-container">
                            <input type="text" id="searchInput" class="form-control" placeholder="Search..." onkeyup="searchTable()">
                        </div>
                        <br>
                        <div class="table-wrapper">
                            <table class="table table-bordered" id="security-guard-table">
                                <thead>
                                    <tr>
                                        <th>GUARD ID</th>
                                        <th>GUARD NAME</th>
                                        <th>GUARD PHOTO</th>
                                        <th>GUARD IC NO</th>
                                        <th>GUARD ADDRESS</th>
                                        <th>GUARD SITE</th>
                                        <th>PHONE NO</th>
                                        <th>STATUS</th>
                                        <th>GENERATE PROFILE</th>
                                        <th>ACTIONS</th>
                                    </tr>
                                </thead>

                                <tbody id="guardTableBody">
                                    <c:forEach var="guard" items="${listGuard}">
                                        <tr>
                                            <td>
                                                <c:out value="${guard.guardID}" />
                                            </td>
                                            <td>
                                                <c:out value="${guard.guardName}" />
                                            </td>
                                            <td style="text-align: center; vertical-align: middle;">
                                                <!-- Display Image -->
                                                <c:if test="${guard.base64Img != null}">
                                                    <img src="data:image/jpeg;base64,${guard.base64Img}" alt="Guard Image" style="width: 100px; height: 100px;" />
                                                </c:if>
                                                <c:if test="${guard.base64Img == null}">
                                                    <img src="http://www.placehold.it/100x100/EFEFEF/AAAAAA&amp;text=no+image" alt="No Image" style="width: 100px; height: 100px;" />
                                                </c:if>
                                            </td>
                                            <td>
                                                <c:out value="${guard.guardICNO}" />
                                            </td>
                                            <td>
                                                <c:out value="${guard.guardAddress}" />
                                            </td>
                                            <td style="text-align: center; align-content: center;">
                                                <c:if test="${guard.siteID == 0}">
                                                    <form action="updateSiteByGuardID" method="POST" >
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <input type="hidden" name="guardID" value="${guard.guardID}" />

                                                                    <select class="form-control" name="siteID">
                                                                        <c:forEach var="site" items="${listSite}">
                                                                            <c:if test="${site.status == 'Active'}">
                                                                                <option value="${site.siteID}">
                                                                                    <c:out value="${site.siteName}" /> : <c:out value="${site.siteAddress}" />
                                                                                </option>
                                                                            </c:if>
                                                                        </c:forEach>
                                                                    </select>
                                                                </td>
                                                                <td style="text-align: center;">
                                                                    <button type="submit" class="btn btn-success" style="display: block; margin: 20PX auto;">UPDATE</button>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </form>
                                                </c:if>
                                                <c:if test="${guard.siteID != 0}">
                                                    <p class="label label-success" style="font-size: 15px;">
                                                        <c:out value="${guard.siteName}"/> : <c:out value="${guard.siteAddress}"/>
                                                    </p>
                                                </c:if>

                                            </td>
                                            <td>
                                                <c:out value="${guard.guardPhoneNo}" />
                                            </td>
                                            <td style="text-align: center;">
                                                <c:choose>
                                                    <c:when test="${guard.guardStatus == 'Active'}">
                                                        <p class="label label-success"><c:out value="${guard.guardStatus}" /></p>
                                                    </c:when>
                                                    <c:when test="${guard.guardStatus == 'Not Active'}">
                                                        <p class="label label-danger"><c:out value="${guard.guardStatus}" /></p>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <p class="label label-default"><c:out value="${guard.guardStatus}" /></p>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td style="text-align: center;">
                                                <button class="btn btn-success printButton" data-id="<c:out value='${guard.guardID}' />">PRINT CARD</button>
                                                <iframe id="printFrameCard" style="display:none;"></iframe>
                                                <script>
                                                    document.querySelectorAll('.printButton').forEach(function (button) {
                                                        button.onclick = function () {
                                                            var id = this.getAttribute('data-id');
                                                            var printFrame = document.getElementById('printFrameCard');

                                                            // Load the guardProfilePrint.jsp in the iframe
                                                            printFrame.src = 'guardCard.jsp?guardID=' + id;

                                                            // Wait for the iframe to load and then trigger the print
                                                            printFrame.onload = function () {
                                                                printFrame.contentWindow.print();
                                                            };
                                                        };
                                                    });
                                                </script>

                                                <br><br>
                                                <button class="btn btn-success printBtn" data-id="<c:out value='${guard.guardID}' />">PRINT PROFILE</button>
                                                <iframe id="printFrame" style="display:none;"></iframe>
                                                <script>
                                                    document.querySelectorAll('.printBtn').forEach(function (button) {
                                                        button.onclick = function () {
                                                            var id = this.getAttribute('data-id');
                                                            var printFrame = document.getElementById('printFrame');

                                                            // Load the guardProfilePrint.jsp in the iframe
                                                            printFrame.src = 'guardProfilePrint.jsp?guardID=' + id;

                                                            // Wait for the iframe to load and then trigger the print
                                                            printFrame.onload = function () {
                                                                printFrame.contentWindow.print();
                                                            };
                                                        };
                                                    });
                                                </script>
                                            </td>
                                            <td>
                                                <a href="editGuard?guardID=<c:out value='${guard.guardID}' />">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp; 
                                                <a href="deleteGuard?guardID=<c:out value='${guard.guardID}' />">Delete</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <input type="hidden" id="listGuardSize" value="${listGuard.size()}">
                            <input type="hidden" id="itemsPerPage" value="5">

                            <nav>
                                <ul class="pagination justify-content-center" id="pagination">
                                    <!-- Pagination links will be added here by JavaScript -->
                                </ul>
                            </nav>
                        </div>

                        <script>

                            // Function to delete leave
                            function deleteLeave(leaveID) {
                                // Show SweetAlert confirmation dialog
                                Swal.fire({
                                    title: 'Are you sure?',
                                    text: "You won't be able to revert this!",
                                    icon: 'warning',
                                    showCancelButton: true,
                                    confirmButtonColor: '#3085d6',
                                    cancelButtonColor: '#d33',
                                    confirmButtonText: 'Yes, delete it!'
                                }).then((result) => {
                                    if (result.isConfirmed) {
                                        // If user confirms, proceed with deletion
                                        $.ajax({
                                            url: 'deleteLeave', // URL to your server-side servlet
                                            method: 'POST',
                                            data: {leaveID: leaveID},
                                            success: function (response) {
                                                // Remove the row from the table
                                                document.getElementById('leaveRow-' + leaveID).remove();
                                                // Show success message
                                                Swal.fire(
                                                        'Deleted!',
                                                        'Leave has been deleted.',
                                                        'success'
                                                        );
                                            },
                                            error: function (xhr, status, error) {
                                                console.error('Error deleting leave:', error);
                                                // Show error message
                                                Swal.fire(
                                                        'Error!',
                                                        'There was an error deleting the leave.',
                                                        'error'
                                                        );
                                                // Re-enable the delete button in case of error
                                                document.getElementById('deleteButton-' + leaveID).disabled = false;
                                            }
                                        });
                                        // Disable the delete button to prevent further clicks
                                        document.getElementById('deleteButton-' + leaveID).disabled = true;
                                    }
                                });
                            }

                            //search function
                            function searchTable() {
                                var input, filter, table, tr, td, i, txtValue;
                                input = document.getElementById("searchInput");
                                filter = input.value.toUpperCase();
                                table = document.getElementById("guardTableBody");
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
                                var rows = document.getElementById('guardTableBody').rows;

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
                                var totalItems = parseInt(document.getElementById('listGuardSize').value);
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

