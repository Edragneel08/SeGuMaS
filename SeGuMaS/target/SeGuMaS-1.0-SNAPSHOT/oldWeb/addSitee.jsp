<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Site</title>
        <link rel="stylesheet" href="css/adminMenu.css">
        <link rel="stylesheet" href="css/addHR.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="js/navBar.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>
        <div class="sidebar">
            <a class="segu" href="#SEGUMAS"><img src="img/logo.png" alt="Trulli" width="100%" height="100%" ></a>
            <a  href="adminMenu.jsp">Home</a>

            <ul class="mainmenu">
                <li class="dropdown">
                    <a href="" class="dropdown-link">Manage HR Staff</a>
                    <ul class="submenu">
                        <li><a href="addNewHrStaff.jsp">Add New Staff</a></li>
                        <li><a href="<%=request.getContextPath()%>/listStaff">View List Staff</a></li>
                    </ul>
                </li>

                <li class="dropdown">
                    <a href="" class="dropdown-link active">Manage Site</a>
                    <ul class="submenu">
                        <li><a class="active" href="addSite.jsp">Add New Site</a></li>
                        <li><a href="<%=request.getContextPath()%>/listSite">View List Site</a></li>
                    </ul>
                </li>

                <li class="dropdown">
                    <a href="#" class="dropdown-link">Manage Security Guard</a>
                    <ul class="submenu">
                        <li><a href="addGuard.jsp">Add New Guard</a></li>
                        <li><a href="">View List Guard</a></li>
                    </ul>
                </li>

                <li class="dropdown">
                    <a href="#" class="dropdown-link">Manage Schedule</a>
                    <ul class="submenu">
                        <li><a href="">Create Schedule</a></li>
                        <li><a href="">View Schedule</a></li>
                    </ul>
                </li>

                <li class="dropdown">
                    <a href="#" class="dropdown-link">Manage Leave</a>
                    <ul class="submenu">
                        <li><a href="">Create New Leave</a></li>
                        <li><a href="">View List</a></li>
                    </ul>
                </li>

                <li class="dropdown">
                    <a href="#" class="dropdown-link">Manage Guard Salary</a>
                    <ul class="submenu">
                        <li><a href="">Calculate Salary</a></li>
                    </ul>
                </li>

                <li class="dropdown">
                    <a href="#" class="dropdown-link">Manage Report</a>
                    <ul class="submenu">
                        <li><a href="">View Salary Report</a></li>
                        <li><a href="">View Schedule Report</a></li>
                        <li><a href="">View Leave Report</a></li>
                    </ul>
                </li>
            </ul>
        </div>


        //form
        <div class="content">
            <!-- content -->
            <div class="mycontainer3">

                <div class="container col-md-5">
                    <div class="card">
                        <div class="card-body">
                            <c:if test="${site != null}">
                                <form action="updateSite" method="GET">
                                </c:if>
                                <c:if test="${site == null}">
                                    <form action="insertSite" method="get">
                                        <!--                                        <input type='hidden' name="action" value="insert">-->
                                    </c:if>

                                    <caption>
                                        <h2>
                                            <c:if test="${site != null}">
                                                Edit site
                                            </c:if>
                                            <c:if test="${site == null}">
                                                Add New site
                                            </c:if>
                                        </h2>
                                    </caption>

                                    <div class="form-group">
                                        <input type="hidden" value="<c:out value='${site.siteID}' />"
                                               class="form-control" name="siteID" required="required"/>
                                    </div>

                                    <div class="form-group">
                                        <label for="siteName">SITE NAME</label>
                                        <input type="text" value="<c:out value='${site.siteName}' />"
                                               id="siteName" name="siteName" class="form-control" required>
                                    </div>

                                    <div class="form-group">
                                        <label for="siteAddress">SITE ADDRESS</label>
                                        <textarea id="siteAddress" name="siteAddress" rows="5" class="form-control" required><c:out value="${site.siteAddress}" /></textarea>
                                    </div>

                                    <div class="form-group">
                                        <label for="startDate">START DATE</label>
                                        <input type="date" value="<c:out value='${site.startDate}' />"
                                               id="startDate" name="startDate" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="endDate">END DATE</label>
                                        <input type="date" value="<c:out value='${site.endDate}' />"
                                               id="endDate" name="endDate" class="form-control" required>
                                    </div>


                                    <div class="form-group">
                                        <label for="location">LOCATION</label>
                                        <input type="text" value="<c:out value='${site.location}' />"
                                               id="location" name="location" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="status">Status</label>
                                        <select id="status" name="status" class="form-control" required>
                                            <option value="Choose" <c:if test="${site.status eq 'Choose'}">selected</c:if>>Choose</option>
                                            <option value="Active" <c:if test="${site.status eq 'Active'}">selected</c:if>>Active</option>
                                            <option value="Not Active" <c:if test="${site.status eq 'Not Active'}">selected</c:if>>Not Active</option>
                                            </select>
                                        </div>

                                    <c:if test="${site != null}">
                                        <button type="submit" class="btn btn-success">UPDATE</button>
                                        <input type='hidden' name="action" value="update">
                                    </c:if>
                                    <c:if test="${site == null}">
                                        <button type="submit" class="btn btn-success">SUBMIT</button>
                                    </c:if>
                                </form>
                        </div>
                    </div>
                </div>

            </div>
        </div> 
    </body>
</html>