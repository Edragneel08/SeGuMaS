<%-- 
    Document   : viewLeaveList_Staff
    Created on : 5 Jun 2024, 3:10:46 pm
    Author     : edrag
--%>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Leave Requests List For Staff</title>
        <link rel="stylesheet" href="css/adminMenu.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="js/navBar.js"></script>
        <!-- SweetAlert CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
        <!-- SweetAlert JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <style>
            .table-wrapper {
                margin-top: 20px;
            }
            .search-container {
                margin-bottom: 20px;
            }
            .highlight {
                background-color: #ffff99; /* Light yellow */
            }

            .pagination {
                margin-top: 20px;
                list-style-type: none;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .pagination li {
                margin: 0 5px;
            }

            .pagination li a {
                text-decoration: none;
                color: #007bff;
                padding: 8px 12px;
                border: 1px solid #007bff;
                border-radius: 5px;
                transition: background-color 0.3s;
            }

            .pagination li a:hover {
                background-color: #007bff;
                color: #fff;
            }

            .pagination .active a {
                background-color: #007bff;
                color: #fff;
            }
        </style>
    </head>
    <body>
        <div class="sidebar">
            <a class="segu" href="#SEGUMAS">
                <img src="img/logo.png" alt="Logo" width="100%" height="100%">
            </a>
            <% String username = (String) session.getAttribute("username"); %>
            <h2 style="color: wheat">Welcome, <%= username %></h2>
            <a href="<%=request.getContextPath()%>/listGuardMenu">Home</a>
            <ul class="mainmenu">
                <li class="dropdown">
                    <a href="#" class="dropdown-link">Manage HR Staff</a>
                    <ul class="submenu">
                        <li><a href="addNewHrStaff.jsp">Add New Staff</a></li>
                        <li><a href="<%=request.getContextPath()%>/listStaff">View List Staff</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-link">Manage Site</a>
                    <ul class="submenu">
                        <li><a href="addSite.jsp">Add New Site</a></li>
                        <li><a href="<%=request.getContextPath()%>/listSite">View List Site</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-link">Manage Security Guard</a>
                    <ul class="submenu">
                        <li><a href="addGuard.jsp">Add New Guard</a></li>
                        <li><a href="<%=request.getContextPath()%>/listGuard">View List Guard</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-link">Manage Schedule</a>
                    <ul class="submenu">
                        <li><a href="createSchedule.jsp">Create Schedule</a></li>
                        <li><a href="#">View Schedule</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-link active">Manage Leave</a>
                    <ul class="submenu">
                        <li><a href="#">Create New Leave</a></li>
                        <li><a href="#" class="active">View List</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-link">Manage Guard Salary</a>
                    <ul class="submenu">
                        <li><a href="#">Calculate Salary</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-link">Manage Report</a>
                    <ul class="submenu">
                        <li><a href="#">View Salary Report</a></li>
                        <li><a href="#">View Schedule Report</a></li>
                        <li><a href="#">View Leave Report</a></li>
                    </ul>
                </li>
            </ul>
            <a href="${pageContext.request.contextPath}/logout">LOGOUT</a>
        </div>

        <div class="content">
            <div class="mycontainerleave">
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
                                    <tr id="leaveRow-${leave.leaveID}">
                                        <td><c:out value="${leave.leaveID}" /></td>
                                        <td><c:out value="${leave.guardID}" /></td>
                                        <td><c:out value="${leave.guardName}" /></td>
                                        <td><c:out value="${leave.leaveType}" /></td>
                                        <td><c:out value="${leave.startDate}" /></td>
                                        <td><c:out value="${leave.endDate}" /></td>
                                        <td><c:out value="${leave.reason}" /></td>
                                        <td>
                                            <button id="statusButton-${leave.leaveID}" class="btn" style="background-color: ${leave.status eq 'Approved' ? '#50C878' : (leave.status eq 'Rejected' ? 'red' : '')}" onclick="toggleStatus(${leave.leaveID})">
                                                <c:out value="${leave.status}" />
                                            </button>
                                        </td>
                                        <td>
                                            <a href="editLeave?leaveID=${leave.leaveID}" class="btn btn-success" id="editButton-${leave.leaveID}">EDIT</a>
                                            <a href="javascript:deleteLeave(${leave.leaveID})" class="btn btn-danger" id="deleteButton-${leave.leaveID}">DELETE</a>
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
            </div>
        </div>

    </body>
</html>