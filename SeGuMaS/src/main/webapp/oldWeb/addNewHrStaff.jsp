<%-- 
    Document   : addNewHrStaff
    Created on : 14 Jan 2024, 6:24:46 pm
    Author     : edrag
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add new HR Staff</title>
        <link rel="stylesheet" href="css/adminMenu.css">
        <link rel="stylesheet" href="css/addHR.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="js/navBar.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        
        <!-- alert check the session -->
        <%@ include file="sessionCheck.jsp" %>
    </head>
    <body>
        <div class="sidebar">
            <a class="segu" href="#SEGUMAS"><img src="img/logo.png" alt="Trulli" width="100%" height="100%" ></a>
            <a  href="adminMenu.jsp">Home</a>

            <ul class="mainmenu">
                <li class="dropdown">
                    <a href="" class="dropdown-link active">Manage HR Staff</a>
                    <ul class="submenu">
                        <li><a class="active" href="addNewHrStaff.jsp">Add New Staff</a></li>
                        <li><a href="<%=request.getContextPath()%>/listStaff">View List Staff</a></li>
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
                            <c:if test="${staff != null}">
                                <form action="update" method="GET">
                                </c:if>
                                <c:if test="${staff == null}">
                                    <form action="insert" method="get">
                                        <!--<input type='hidden' name="action" value="insert">-->
                                    </c:if>

                                    <caption>
                                        <h2>
                                            <c:if test="${staff != null}">
                                                Edit Staff
                                            </c:if>
                                            <c:if test="${staff == null}">
                                                Add New Staff
                                            </c:if>
                                        </h2>
                                    </caption>

                                    <fieldset class="form-group">
                                        <label>Staff ID : </label> 
                                        <input type="text" value="<c:out value='${staff.staffID}' />"
                                               class="form-control" name="staffID" required="required"/>
                                    </fieldset>

                                    <fieldset class="form-group">
                                        <label>Staff Full Name : </label> 
                                        <input type="text" value="<c:out value='${staff.fullname}' />"
                                               class="form-control" name="fullname" required="required"/>
                                    </fieldset>

                                    <fieldset class="form-group">
                                        <label>Staff Username : </label> 
                                        <input type="text" value="<c:out value='${staff.username}' />" 
                                               class="form-control" name="username"/>
                                    </fieldset>

                                    <fieldset class="form-group">
                                        <label>Password : </label>
                                        <input type="text" value="<c:out value='${staff.password}' />" 
                                               class="form-control" name="password"/>
                                    </fieldset>

                                    <c:if test="${staff != null}">
                                        <button type="submit" class="btn btn-success">UPDATE</button>
                                        <input type='hidden' name="action" value="update">
                                    </c:if>
                                    <c:if test="${staff == null}">
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
