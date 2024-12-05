<%-- 
    Document   : addGuard
    Created on : 8 Jun 2024, 9:51:00 pm
    Author     : edrag
--%>

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
        <title>ADD NEW GUARD</title>

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
        <link rel="stylesheet" href="css/addGuard.css">
        <link rel="stylesheet" type="text/css" href="css/lib/bootstrap-fileupload/bootstrap-fileupload.css">
        <!--        <link rel="stylesheet" type="text/css" href="css/bootstrap-fileupload.css">-->

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
                                <li><a href="addGuard.jsp" style="color: blue;">ADD NEW GUARD</a></li>
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
                    <c:if test="${guard != null}">
                        <form action="updateGuard" method="POST" enctype="multipart/form-data">
                        </c:if>
                        <c:if test="${guard == null}">
                            <form action="insertGuard" method="POST" enctype="multipart/form-data">
                                <!-- <input type='hidden' name="action" value="insert">-->
                            </c:if>

                            <caption>
                                <h2>
                                    <c:if test="${guard != null}">
                                        Edit Security Guard
                                    </c:if>
                                    <c:if test="${guard == null}">
                                        Add New Security Guard
                                    </c:if>
                                </h2>
                            </caption>
                            <fieldset>
                                <legend>
                                    Personal Details
                                </legend>
                                <table>
                                    <tr>
                                        <!-- <label>GUARD ID : </label> -->
                                    <input type="hidden" value="<c:out value='${guard.guardID}' />"
                                           class="form-control" name="guardID" required="required"/>

                                    </tr>

                                    <tr>
                                        <td>
                                            <div class="row mt">
                                                <div class="form-group last">
                                                    <label class="control-label col-md-2">Image Upload</label>
                                                    <div class="col-md-6">
                                                        <div class="fileupload fileupload-new" data-provides="fileupload">
                                                            <div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">
                                                                <img src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image" alt="">
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
                                            </div>
                                        </td>

                                        <td>
                                            <label>GUARD SALARY : </label> 
                                            <input type="text" value="<c:out value='${guard.guardSalary}' />"
                                                   class="form-control" name="guardSalary" required="required"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <!<!-- name -->
                                            <label>GUARD FULLNAME : </label> 
                                            <input type="text" value="<c:out value='${guard.guardName}' />"
                                                   class="form-control" name="guardName" required="required"/>
                                        </td>
                                        <td>
                                            <label>IC NO : </label> 
                                            <input type="text" value="<c:out value='${guard.guardICNO}' />"
                                                   class="form-control" name="guardICNO" required="required"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td rowspan="2">
                                            <label>ADDRESS:</label>
                                            <textarea class="form-control" name="guardAddress" required="required">
                                                <c:out value='${guard.guardAddress}' />
                                            </textarea>
                                        </td>
                                        <td>
                                            <label for="dateStart">START WORK:</label><BR>
                                            <input type="date" name="dateWorkStart" min="1900" max="2099">
                                        </td>
                                        <td>
                                            <label for="dateTO">CONTRACT END:</label><BR>
                                            <input type="date" name="dateContractEnd" min="1900" max="2099">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>TELEPHONE NO : </label> 
                                            <input type="text" value="<c:out value='${guard.guardPhoneNo}' />"
                                                   class="form-control" name="guardPhoneNo" required="required"/>
                                        </td>
                                        <td>
                                            <label for="nationality">NATIONALITY:</label>
                                            <select class="form-control" name="nationality" id="nationality">
                                                <option value="" <c:if test="${guard.nationality eq 'Choose'}">selected</c:if>>Choose Nationality</option>
                                                <option value="Citizen" <c:if test="${guard.nationality eq 'Citizen'}">selected</c:if>>Citizen</option>
                                                <option value="Non-Citizen" <c:if test="${guard.nationality eq 'Non-Citizen'}">selected</c:if>>Non-Citizen</option>
                                                    <!-- Add more options as needed -->
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="education-entry">
                                                <label>DATE OF BIRTH : </label>
                                                <input type="date" value="<c:out value='${guard.guardDOB}' />" 
                                                   class="form-control" name="guardDOB"/>
                                        </td>
                                        <td>
                                            <label>PLACE OF BIRTH : </label>
                                            <input type="text" value="<c:out value='${guard.guardPOB}' />" 
                                                   class="form-control" name="guardPOB"/>
                                        </td>
                                        <td>
                                            <label>EPF NO : </label>
                                            <input type="text" value="<c:out value='${guard.guardEPFNo}' />" 
                                                   class="form-control" name="guardEPFNo"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>RELIGION : </label>
                                            <select class="form-control" name="religion" id="religion">
                                                <option value="" <c:if test="${guard.religion eq 'Choose'}">selected</c:if>>Choose Religion</option>
                                                <option value="ISLAM" <c:if test="${guard.religion eq 'Citizen'}">selected</c:if>>ISLAM</option>
                                                <option value="CHRISTIAN" <c:if test="${guard.religion eq 'Non-Citizen'}">selected</c:if>>CHRISTIAN</option>
                                                <option value="BUDDHA" <c:if test="${guard.religion eq 'Non-Citizen'}">selected</c:if>>BUDDHA</option>
                                                <option value="OTHERS" <c:if test="${guard.religion eq 'Non-Citizen'}">selected</c:if>>OTHERS</option>
                                                    <!-- Add more options as needed -->
                                                </select>
                                            </td>
                                            <td>
                                                <label for="guardGender">GENDER</label>
                                                <select class="form-control" name="guardGender" id="guardGender">
                                                    <option value="" <c:if test="${guard.guardGender eq 'Male'}">selected</c:if>>Choose</option>
                                                <option value="MALE" <c:if test="${guard.guardGender eq 'Male'}">selected</c:if>>MALE</option>
                                                <option value="FEMALE" <c:if test="${guard.guardGender eq 'Female'}">selected</c:if>>FEMALE</option>
                                                <option value="OTHERS" <c:if test="${guard.guardGender eq 'Other'}">selected</c:if>>OTHERS</option>
                                                    <!-- Add more options as needed -->
                                                </select>
                                            </td>
                                            <td>
                                                <label>SOCSO NO : </label>
                                                <input type="text" value="<c:out value='${guard.guardSocsoNo}' />" 
                                                   class="form-control" name="guardSocsoNo"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="guardRace">RACE:</label>
                                            <select class="form-control" name="guardRace" id="guardRace">
                                                <option value="" <c:if test="${guard.guardRace eq 'Choose'}">selected</c:if>>Choose Race</option>
                                                <option value="MALAY" <c:if test="${guard.guardRace eq 'MALAY'}">selected</c:if>>MALAY</option>
                                                <option value="CHINESE" <c:if test="${guard.guardRace eq 'CHINESE'}">selected</c:if>>CHINESE</option>
                                                <option value="INDIA" <c:if test="${guard.guardRace eq 'INDIA'}">selected</c:if>>INDIA</option>
                                                <option value="OTHERS" <c:if test="${guard.guardRace eq 'OTHERS'}">selected</c:if>>OTHERS</option>
                                                    <!-- Add more options as needed -->
                                                </select>
                                            </td>
                                            <td>
                                                <label>ACCOUNT NO : </label>
                                                <input type="text" value="<c:out value='${guard.guardAccNo}' />" 
                                                   class="form-control" name="guardAccNo"/>
                                        </td>
                                        <td>
                                            <label>NAME OF BANK : </label>
                                            <input type="text" value="<c:out value='${guard.guardNOB}' />" 
                                                   class="form-control" name="guardNOB"/>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>

                            <br><br>

                            <fieldset>
                                <legend>
                                    Family Details
                                </legend>
                                <script>
                                    function showTextField() {
                                        var singleRadio = document.getElementById("single");
                                        var marriedRadio = document.getElementById("married");
                                        var divorcedRadio = document.getElementById("divorced");
                                        var otherStatusField = document.getElementById("otherStatusField");

                                        // Check if "Single" radio button is selected
                                        if (singleRadio.checked) {
                                            otherStatusField.style.display = "none"; // Show the text field
                                            document.getElementsByName("guardSpName")[0].value = "-";
                                            document.getElementsByName("guardFamOccu")[0].value = "-";
                                            document.getElementsByName("guardFamNoP1")[0].value = "-";
                                            document.getElementsByName("guardNumOfChild")[0].value = "-";
                                            document.getElementsByName("guardSpAdd")[0].value = "-";

                                        } else if (marriedRadio.checked) {
                                            otherStatusField.style.display = "block"; // Show the text field
                                        } else if (divorcedRadio.checked) {
                                            otherStatusField.style.display = "block"; // Show the text field
                                        } else {
                                            otherStatusField.style.display = "none"; // Hide the text field for other options
                                        }
                                    }
                                </script>
                                <table>
                                    <tr>
                                        <td>
                                            <label for="maritalStatus">MARITAL STATUS:</label><br>
                                            <input type="radio" id="single" name="maritalStatus" value="SINGLE" 
                                                   <c:if test="${guard.maritalStatus eq 'SINGLE'}">checked</c:if> onclick="showTextField()">
                                                   <label for="single">SINGLE</label><br>
                                                   <input type="radio" id="married" name="maritalStatus" value="MARRIED" 
                                                   <c:if test="${guard.maritalStatus eq 'MARRIED'}">checked</c:if> onclick="showTextField()">
                                                   <label for="married">MARRIED</label><br>
                                                   <input type="radio" id="divorced" name="maritalStatus" value="DIVORCED" 
                                                   <c:if test="${guard.maritalStatus eq 'DIVORCED'}">checked</c:if> onclick="showTextField()">
                                                   <label for="divorced">DIVORCED</label><br>
                                                   <!-- Add more options as needed -->
                                            </td>
                                            <td>
                                                <div id="otherStatusField" style="display: none;">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <label>NAME OF SPOUSE : </label>
                                                                <input type="text" value="<c:out value='${guard.guardSpName}' />" 
                                                                   class="form-control" name="guardSpName"/>
                                                        </td>
                                                        <td>
                                                            <label>OCCUPATION : </label>
                                                            <input type="text" value="<c:out value='${guard.guardFamOccu}' />" 
                                                                   class="form-control" name="guardFamOccu"/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label>TELEPHONE NO : </label>
                                                            <input type="text" value="<c:out value='${guard.guardFamNoP1}' />" 
                                                                   class="form-control" name="guardFamNoP1"/>
                                                        </td>

                                                        <td>
                                                            <label>NO. OF CHILDREN : </label>
                                                            <input type="text" value="<c:out value='${guard.guardNumOfChild}' />" 
                                                                   class="form-control" name="guardNumOfChild"/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <label>SPOUSE ADDRESS : </label>
                                                            <input type="text" value="<c:out value='${guard.guardSpAdd}' />" 
                                                                   class="form-control" name="guardSpAdd"/>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>FATHER’S NAME : </label>
                                            <input type="text" value="<c:out value='${guard.guardFN}' />" 
                                                   class="form-control" name="guardFN"/>
                                        </td>
                                        <td>
                                            <label>OCCUPATION : </label>
                                            <input type="text" value="<c:out value='${guard.guardFOccu}' />" 
                                                   class="form-control" name="guardFOccu"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>MOTHER’S NAME : </label>
                                            <input type="text" value="<c:out value='${guard.guardMomName}' />" 
                                                   class="form-control" name="guardMomName"/>
                                        </td>
                                        <td>
                                            <label>OCCUPATION : </label>
                                            <input type="text" value="<c:out value='${guard.guardMomOccu}' />" 
                                                   class="form-control" name="guardMomOccu"/>
                                        </td>
                                    </tr> 
                                    <tr>
                                        <td colspan="2">
                                            <label>ADDRESS : </label>
                                            <input type="text" value="<c:out value='${guard.guardParentAdd}' />" 
                                                   class="form-control" name="guardParentAdd"/>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>

                            <br><br>

                            <fieldset>
                                <legend>
                                    Educational Background
                                </legend>
                                <button type="button" onclick="addEducationEntry()">Add Educational Background</button>
                                <script>
                                    function addEducationEntry() {
                                        const educationEntries = document.getElementById('educationEntries');
                                        const newEntry = document.createElement('div');
                                        newEntry.className = 'education-entry';
                                        newEntry.innerHTML = `
                                            <table>
                                            <tr>
                                                <td>
                                                    <label for="SCHOOL/UNIVERSITY/ COURSES">SCHOOL/UNIVERSITY</label>
                                                    <input type="text" name="school[]" required>
                                                </td>

                                                <td>
                                                    <label for="STATE">STATE</label>
                                                    <input type="text" name="state[]" required>
                                                </td>
                                                <td>
                                                    <label for="dateStart">DATE FROM:</label>
                                                    <input type="date" name="dateStart[]" min="1900" max="2099" required>
                                                </td>
                                                <td>
                                                    <label for="dateTO">DATE TO:</label>
                                                    <input type="date" name="dateTo[]" min="1900" max="2099" required>
                                                </td>
                                            </tr>
                                        </table>
                                        `;
                                        educationEntries.appendChild(newEntry);
                                    }
                                </script>

                                <div id="educationEntries">
                                    <div class="education-entry">
                                        <table>
                                            <tr>
                                                <td>
                                                    <label for="SCHOOL/UNIVERSITY/ COURSES">SCHOOL/UNIVERSITY</label>
                                                    <input type="text" name="school[]" required>
                                                </td>

                                                <td>
                                                    <label for="STATE">STATE</label>
                                                    <input type="text" name="state[]" required>
                                                </td>
                                                <td>
                                                    <label for="dateStart">DATE FROM:</label>
                                                    <input type="date" name="dateStart[]" min="1900" max="2099" required>
                                                </td>
                                                <td>
                                                    <label for="dateTO">DATE TO:</label>
                                                    <input type="date" name="dateTo[]" min="1900" max="2099" required>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </fieldset>

                            <br><br>
                            <fieldset>
                                <legend>
                                    Previous Employment Position
                                </legend>
                                <button type="button" onclick="PreviousEmploymentEntry()">Add Previous Employment</button>
                                <script>
                                    function PreviousEmploymentEntry() {
                                        const previousEmploymentEntries = document.getElementById('previousEmploymentEntries');
                                        const newEntry = document.createElement('div');
                                        newEntry.className = 'previousEmployment-entry';
                                        newEntry.innerHTML = `
                                            <table>
                                            <tr>
                                                <td>
                                                    <label>EMPLOYER’S NAME</label>
                                                    <input type="text" name="employerName[]" required>
                                                </td>
                                                <td>
                                                    <label for="POSITION HELD">POSITION HELD</label>
                                                    <input type="text" name="positionHeld[]" required>
                                                </td>
                                                <td>
                                                    <label for="dateStart">DATE FROM:</label>
                                                    <input type="date" name="dateStart[]" min="1900" max="2099" required>
                                                </td>
                                                <td>
                                                    <label for="dateTO">DATE TO:</label>
                                                    <input type="date" name="dateTo[]" min="1900" max="2099" required>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <label for="EMPLOYER’S ADDRESS">EMPLOYER’S ADDRESS</label>
                                                    <input type="text" name="EA[]" required>
                                                </td>
                                                <td colspan="2">
                                                    <label for="REASON OF LEAVING">REASON OF LEAVING</label>
                                                    <input type="text" name="RoL[]" required>
                                                </td>
                                            </tr>
                                        </table>
                                        `;
                                        previousEmploymentEntries.appendChild(newEntry);
                                    }
                                </script>
                                <div id="previousEmploymentEntries">
                                    <div class="previousEmployment-entry">
                                        <table>
                                            <tr>
                                                <td>
                                                    <label>EMPLOYER’S NAME</label>
                                                    <input type="text" name="employerName[]" required>
                                                </td>
                                                <td>
                                                    <label for="POSITION HELD">POSITION HELD</label>
                                                    <input type="text" name="positionHeld[]" required>
                                                </td>
                                                <td>
                                                    <label for="dateStart">DATE FROM:</label>
                                                    <input type="date" name="dateStart[]" min="1900" max="2099" required>
                                                </td>
                                                <td>
                                                    <label for="dateTO">DATE TO:</label>
                                                    <input type="date" name="dateTo[]" min="1900" max="2099" required>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <label for="EMPLOYER’S ADDRESS">EMPLOYER’S ADDRESS</label>
                                                    <input type="text" name="EA[]" required>
                                                </td>
                                                <td colspan="2">
                                                    <label for="REASON OF LEAVING">REASON OF LEAVING</label>
                                                    <input type="text" name="RoL[]" required>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </fieldset>

                            <!<!-- Ex police or army part -->
                            <br><br>
                            <fieldset>
                                <legend>
                                    Ex-Police Or Ex-Army
                                </legend>
                                <script>
                                    function showTxtField() {
                                        var yesRadio = document.getElementById("YES");
                                        var noRadio = document.getElementById("NO");
                                        var statusField = document.getElementById("statusField");

                                        // Check if "Single" radio button is selected
                                        if (yesRadio.checked) {
                                            statusField.style.display = "block"; // Show the text field
                                        } else {
                                            statusField.style.display = "none"; // Hide the text field for other options
                                            document.getElementsByName("guardServiceNo")[0].value = "-";
                                            document.getElementsByName("guardPosition")[0].value = "-";
                                            document.getElementsByName("dateStart")[0].value = "";
                                            document.getElementsByName("dateTo")[0].value = "";
                                            document.getElementsByName("guardBranch")[0].value = "-";
                                            document.getElementsByName("guardRFLPA")[0].value = "-";
                                        }
                                    }
                                </script>
                                <table>
                                    <tr>
                                        <td>
                                            <label for="exArmyOrPolice">Ex Army Or Police:</label><br>
                                            <input type="radio" id="YES" name="exArmyOrPolice" value="YES" 
                                                   <c:if test="${guard.exArmyOrPolice eq 'YES'}">checked</c:if> onclick="showTxtField()">
                                                   <label for="YES">YES</label><br>
                                                   <input type="radio" id="NO" name="exArmyOrPolice" value="NO" 
                                                   <c:if test="${guard.exArmyOrPolice eq 'NO'}">checked</c:if> onclick="showTxtField()">
                                                   <label for="married">NO</label><br>
                                                   <!-- Add more options as needed -->
                                            </td>
                                            <td id="statusField" style="display: none;">
                                                <div>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <label>SERVICE NO : </label>
                                                                <input type="text" value="<c:out value='${guard.guardServiceNo}' />" 
                                                                   class="form-control" name="guardServiceNo"/>
                                                        </td>
                                                        <td>
                                                            <label>POSITION HELD : </label>
                                                            <input type="text" value="<c:out value='${guard.guardPosition}' />" 
                                                                   class="form-control" name="guardPosition"/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label for="dateStart">DATE FROM:</label>
                                                            <input type="date" name="dateStart" min="1900" max="2099">
                                                        </td>
                                                        <td>
                                                            <label for="dateTO">DATE TO:</label>
                                                            <input type="date" name="dateTo" min="1900" max="2099">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label>BRANCH : </label>
                                                            <input type="text" value="<c:out value='${guard.guardBranch}' />" 
                                                                   class="form-control" name="guardBranch"/>
                                                        </td>
                                                        <td>
                                                            <label>REASON FOR LEAVING : </label>
                                                            <input type="text" value="<c:out value='${guard.guardRFLPA}' />" 
                                                                   class="form-control" name="guardRFLPA"/>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>

                            <br><br>
                            <fieldset>
                                <legend>
                                    Personal References
                                </legend>
                                <table>
                                    <tr>
                                        <td>
                                            <label>REFERENCE NAME : </label> 
                                            <input type="text" value="<c:out value='${guard.guardReferName}' />" 
                                                   class="form-control" name="guardReferName"/>
                                        </td>

                                        <td>
                                            <label>REFERENCE JOB : </label> 
                                            <input type="text" value="<c:out value='${guard.guardReferJob}' />" 
                                                   class="form-control" name="guardReferJob"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <label>ADDRESS:</label>
                                            <textarea class="form-control" name="guardReferAddress" required="required">
                                                <c:out value='${guard.guardReferAddress}' />             
                                            </textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>REFERENCE RELATION : </label> 
                                            <input type="text" value="<c:out value='${guard.guardReferRelation}' />" 
                                                   class="form-control" name="guardReferRelation"/>
                                        </td>
                                        <td>
                                            <label>REFERENCE TELEPHONE NO : </label> 
                                            <input type="text" value="<c:out value='${guard.guardReferPhoneNo}' />" 
                                                   class="form-control" name="guardReferPhoneNo"/>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>



                            <c:if test="${guard != null}">
                                <button type="submit" class="btn btn-success">UPDATE</button>
                                <input type='hidden' name="action" value="update    ">
                            </c:if>
                            <c:if test="${guard == null}">
                                <button type="submit" class="btn btn-success">SUBMIT</button>
                            </c:if>
                        </form>
                        <div class="col-lg-1">
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
        <!-- js placed at the end of the document so the pages load faster -->
        <script src="lib/jquery/jquery.min.js"></script>
        <script src="lib/bootstrap/js/bootstrap.min.js"></script>
        <script src="lib/common-scripts.js"></script>
        <script src="lib/jquery-ui-1.9.2.custom.min.js"></script>
        <script class="include" type="text/javascript" src="lib/jquery.dcjqaccordion.2.7.js"></script>
        <script src="lib/jquery.scrollTo.min.js"></script>
        <script src="lib/jquery.nicescroll.js" type="text/javascript"></script>
        <script src="lib/jquery.sparkline.js"></script>

        <!-- <script type="text/javascript" src="css/bootstrap-fileupload.js"></script> -->
        <script type="text/javascript" src="css/lib/bootstrap-fileupload/bootstrap-fileupload.js"></script>
        <script src="lib/jquery.ui.touch-punch.min.js"></script>
        <script type="text/javascript" src="lib/gritter/js/jquery.gritter.js"></script>
        <script type="text/javascript" src="lib/gritter-conf.js"></script>
        <script src="lib/advanced-form-components.js"></script>

        <!--script for this page-->

    </body>
</html>
