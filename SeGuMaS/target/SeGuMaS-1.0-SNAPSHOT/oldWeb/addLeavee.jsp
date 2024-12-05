<%-- 
    Document   : adminMenu
    Created on : 14 Jan 2024, 1:35:50 pm
    Author     : edrag
--%>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Leave Report</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/adminMenu.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="js/navBar.js"></script>
        <style>

            .content {
                flex: 1;
                padding: 20px;
            }
            .table thead th {
                background-color: #f8f9fa;
            }
        </style>
    </head>
    <body>
        <div class="sidebar">
            <a class="segu" href="#SEGUMAS"><img src="img/logo.png" alt="Logo" width="100%" height="100%"></a>
                <%
                    String username = (String) session.getAttribute("username");
                %>
            <h2>Welcome, <%= username %></h2>
            <a href="<%=request.getContextPath()%>/listGuardMenu" class="active">Home</a>
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
                        <li><a href="<%=request.getContextPath()%>/listGuardCreate">Create Schedule</a></li>
                        <li><a href="#">View Schedule</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-link">Manage Leave</a>
                    <ul class="submenu">
                        <li><a href="#">Create New Leave</a></li>
                        <li><a href="#">View List</a></li>
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
            <div class="container mt-5">


                <!-- Leave Request Form -->
                <c:if test="${leave != null}">
                    <form action="updateGuardLeave" method="get">
                    </c:if>
                    <c:if test="${leave == null}">
                        <form action="insertLeave" method="get">
                            <!-- <input type='hidden' name="action" value="insert">-->
                        </c:if>
                        <h2 class="mb-4">
                            <c:if test="${leave != null}">
                                Edit Leave
                            </c:if>
                            <c:if test="${leave == null}">
                                Add New Leave
                            </c:if>
                        </h2>

                        <c:if test="${leave == null}">
                            <div class="form-group">
                                <label for="employeeName">Employee Name</label>
                                <select id="guardSelect" name="guardInfo" class="form-control" required>
                                    <option value="">Choose Guard</option>
                                    <c:forEach var="guard" items="${listGuard}">
                                        <option value="${guard.guardID}:${guard.guardName}">
                                            <c:out value="${guard.guardID}" /> : <c:out value="${guard.guardName}" />
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                        </c:if>
                        <c:if test="${leave != null}">
                            <div class="form-group">
                                <label for="employeeName">Employee Name</label>
                                <input type="text" value="<c:out value='${leave.guardID}' /> : <c:out value='${leave.guardName}' />"
                                       class="form-control" required="required"/>

                                <input type="hidden" value="<c:out value='${leave.leaveID}' />"
                                       id="leaveID" name="leaveID" class="form-control" required>
                            </div>
                        </c:if>

                        <div class="form-group">
                            <label for="leaveType">Leave Type</label>
                            <select id="leaveType" name="leaveType" class="form-control" required>
                                <option value="Select Leave Type" <c:if test="${leave.leaveType eq 'Select Leave Type'}">selected</c:if>>Select Leave Type</option>
                                <option value="sick" <c:if test="${leave.leaveType eq 'sick'}">selected</c:if>>Sick Leave</option>
                                <option value="vacation" <c:if test="${leave.leaveType eq 'vacation'}">selected</c:if>>Vacation Leave</option>
                                <option value="personal" <c:if test="${leave.leaveType eq 'personal'}">selected</c:if>>Personal Leave</option>
                                </select>
                            </div>


                            <div class="form-group">
                                <label for="startDate">Start Date</label>
                                <input type="date" value="<c:out value='${leave.startDate}' />"
                                   id="startDate" name="startDate" class="form-control" required>
                        </div>

                        <div class="form-group">
                            <label for="endDate">End Date</label>
                            <input type="date" value="<c:out value='${leave.endDate}' />"
                                   id="endDate" name="endDate" class="form-control" required>
                        </div>

                        <div class="form-group">
                            <label for="reason">Reason</label>
                            <textarea id="reason" name="reason" rows="4" class="form-control" required><c:out value='${leave.reason}' /></textarea>
                        </div>


                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form> 
            </div>
        </div>
    </body>
</html>
