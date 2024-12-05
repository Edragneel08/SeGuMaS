<%-- 
    Document   : addNewGuard
    Created on : 8 Jun 2024, 12:07:12 pm
    Author     : edrag
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="MODEL.guardPersonalDetails" %>
<%@ page import="DAO.StaffDAO" %>
<%@ page import="MODEL.staff" %>


<%
    String staffID = (String) session.getAttribute("staffID");
    StaffDAO staffDAO = new StaffDAO();
    staff staff = staffDAO.getStaffById(staffID);
    request.setAttribute("staff", staff);

    guardPersonalDetails existingGuard = (guardPersonalDetails) request.getAttribute("guardPersonalDetails");
%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">
        <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
        <title>EDIT EXISTING GUARD</title>

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
        <link rel="stylesheet" href="css/addGuard.css">
        <link rel="stylesheet" type="text/css" href="css/lib/bootstrap-fileupload/bootstrap-fileupload.css">


        <!-- alert check the session -->
        <%@ include file="sessionCheck.jsp" %>


        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <style>
            .content-block {
                display: none;
                margin-top: 20px;
            }

            .content-block.active {
                display: block;
            }

            table {
                border-collapse: collapse; /* Ensures table borders collapse into a single border */
                width: 100%; /* Makes the table occupy full width of its container */
            }

            table td, table th {
                border: none; /* Removes borders from all table cells and headers */
                padding: 8px; /* Adds padding to table cells */
            }

            table tr {
                border: none; /* Optionally removes borders from rows */
                box-shadow: none; /* Optionally removes box shadow from rows */
            }

            .btn-theme {
                margin-top: 10px;
            }

            .button-container {
                display: flex;
                justify-content: center;
                margin-top: 20px;
                gap: 10px; /* Add space between buttons */
            }
            .form fieldset {
                border: none;
            }
            .form legend {
                border: none;
            }
        </style>

        <script>
            function addEducationEntry(school = '', state = '', dateStart = '', dateTo = '') {
            const educationEntries = document.getElementById('educationEntries');
            const newEntry = document.createElement('div');
            newEntry.className = 'education-entry';
            newEntry.innerHTML = `
            <table>
            <tr>
                <td>
                    <label for='school'>SCHOOL/UNIVERSITY</label>
                    <input type='text' name='school[]' value='${school}' required>
                </td>
                <td>
                    <label for='state'>STATE</label>
                    <input type='text' name='state[]' value='${state}' required>
                </td>
                <td>
                    <label for='dateStart'>DATE FROM:</label>
                    <input type='date' name='dateStart[]' value='${dateStart}' min='1900-01-01' max='2099-12-31' required>
                </td>
                <td>
                    <label for='dateTo'>DATE TO:</label>
                    <input type='date' name='dateTo[]' value='${dateTo}' min='1900-01-01' max='2099-12-31' required>
                </td>
            </tr>
            </table>`;
            educationEntries.appendChild(newEntry);
            }

            function populateEducationEntries(data) {
            const educationEntries = document.getElementById('educationEntries');
            educationEntries.innerHTML = ''; // Clear existing entries
            data.forEach(entry => {
            addEducationEntry(entry.school, entry.state, entry.dateStart, entry.dateTo);
            });
            }

            window.onload = function() {
            const educationData = ${requestScope.existingGuardEDU}; // Accessing servlet attribute
            populateEducationEntries(educationData);
            };
        </script>

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
                        <p class="centered"><a href="profile.jsp">
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
                            </a></p>
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
                    <div class="container">
                        <div class="form">
                            <button class="btn btn-theme" type="button" onclick="showContent('editGuard')">PERSONAL DETAILS</button>
                            <button class="btn btn-theme" type="button" onclick="showContent('content2')">FAMILY DETAILS</button>
                            <button class="btn btn-theme" type="button" onclick="showContent('content3')">EDU BACKGROUND</button>
                            <button class="btn btn-theme" type="button" onclick="showContent('content4')">PREVIOUS EMPLOYMENT</button>
                            <button class="btn btn-theme" type="button" onclick="showContent('content5')">EX-POLICE OR ARMY DETAILS</button>
                            <button class="btn btn-theme" type="button" onclick="showContent('content6')">REFERENCES</button>

                            <div id="editGuard" class="content-block active">
                                <div class="container">
                                    <div class="form">
                                        <form action="updateGuardPersonalDetails" method="POST" enctype="multipart/form-data">
                                            <fieldset>
                                                <legend>
                                                    Personal Details
                                                </legend>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <label>GUARD ID : </label>
                                                            <input type="text" value="<c:out value='${guardPersonalDetails.guardID}' />"
                                                                   class="form-control" name="guardID" disabled=""/>
                                                            <input type="hidden" name="guardID" value="<c:out value='${guardPersonalDetails.guardID}' />" />
                                                        </td>
                                                        <td>
                                                            <label>STATUS : </label>
                                                            <select id="status" name="guardStatus" class="form-control" required>
                                                                <option value="Choose" <c:if test="${guardPersonalDetails.guardStatus eq 'Choose'}">selected</c:if>>Choose</option>
                                                                <option value="Active" <c:if test="${guardPersonalDetails.guardStatus eq 'Active'}">selected</c:if>>Active</option>
                                                                <option value="Not Active" <c:if test="${guardPersonalDetails.guardStatus eq 'Not Active'}">selected</c:if>>Not Active</option>
                                                                </select>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>
                                                                <div class="form-group last">
                                                                    <label class="control-label col-md-2">Image Upload</label>
                                                                    <div class="col-md-6">
                                                                        <div class="fileupload fileupload-new" data-provides="fileupload">
                                                                            <!-- Display existing image or placeholder -->
                                                                            <div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">
                                                                            <% if (existingGuard != null) { %>
                                                                            <img src="data:image/jpeg;base64,<%= existingGuard.getBase64Img() %>" alt="Guard Image">
                                                                            <% } else { %>
                                                                            <img src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image" alt="No image">
                                                                            <% } %>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>

                                                        <td>
                                                            <label>GUARD SALARY : </label> 
                                                            <input type="text" value="<c:out value='${guardPersonalDetails.guardSalary}'/>"
                                                                   class="form-control" name="guardSalary" required="required"/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <!<!-- name -->
                                                            <label>GUARD FULLNAME : </label> 
                                                            <input type="text" value="<c:out value='${guardPersonalDetails.guardName}' />"
                                                                   class="form-control" name="guardName" required="required"/>
                                                        </td>
                                                        <td>
                                                            <label>IC NO : </label> 
                                                            <input type="text" value="<c:out value='${guardPersonalDetails.guardICNO}' />"
                                                                   class="form-control" name="guardICNO" required="required"/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label>ADDRESS:</label>
                                                            <textarea class="form-control" name="guardAddress" required="required">
                                                                <c:out value='${guardPersonalDetails.guardAddress}' />
                                                            </textarea>
                                                        </td>
                                                        <td>
                                                            <label for="nationality">NATIONALITY:</label>
                                                            <select class="form-control" name="nationality" id="nationality">
                                                                <option value="" <c:if test="${guardPersonalDetails.nationality eq 'Choose'}">selected</c:if>>Choose Nationality</option>
                                                                <option value="Citizen" <c:if test="${guardPersonalDetails.nationality eq 'Citizen'}">selected</c:if>>Citizen</option>
                                                                <option value="Non-Citizen" <c:if test="${guardPersonalDetails.nationality eq 'Non-Citizen'}">selected</c:if>>Non-Citizen</option>
                                                                    <!-- Add more options as needed -->
                                                                </select>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <label>TELEPHONE NO : </label> 
                                                                <input type="text" value="<c:out value='${guardPersonalDetails.guardPhoneNo}' />"
                                                                   class="form-control" name="guardPhoneNo" required="required"/>
                                                        </td>
                                                        <td>
                                                            <label for="dateStart">START WORK:</label><BR>
                                                            <input type="date" name="dateWorkStart" value="<c:out value='${guardPersonalDetails.dateWorkStart}' />" min="1900" max="2099">
                                                        </td>
                                                        <td>
                                                            <label for="dateTO">CONTRACT END:</label><BR>
                                                            <input type="date" name="dateContractEnd" value="<c:out value='${guardPersonalDetails.dateContractEnd}' />" min="1900" max="2099">
                                                        </td>

                                                    </tr>
                                                    <tr>
                                                        <td class="education-entry">
                                                            <label>DATE OF BIRTH : </label>
                                                            <input type="date" value="<c:out value='${guardPersonalDetails.guardDOB}' />" 
                                                                   class="form-control" name="guardDOB"/>
                                                        </td>
                                                        <td>
                                                            <label>PLACE OF BIRTH : </label>
                                                            <input type="text" value="<c:out value='${guardPersonalDetails.guardPOB}' />" 
                                                                   class="form-control" name="guardPOB"/>
                                                        </td>
                                                        <td>
                                                            <label>EPF NO : </label>
                                                            <input type="text" value="<c:out value='${guardPersonalDetails.guardEPFNo}' />" 
                                                                   class="form-control" name="guardEPFNo"/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label>RELIGION : </label>
                                                            <select class="form-control" name="religion" id="religion">
                                                                <option value="" <c:if test="${guardPersonalDetails.religion eq 'Choose'}">selected</c:if>>Choose Religion</option>
                                                                <option value="ISLAM" <c:if test="${guardPersonalDetails.religion eq 'ISLAM'}">selected</c:if>>ISLAM</option>
                                                                <option value="CHRISTIAN" <c:if test="${guardPersonalDetails.religion eq 'CHRISTIAN'}">selected</c:if>>CHRISTIAN</option>
                                                                <option value="BUDDHA" <c:if test="${guardPersonalDetails.religion eq 'BUDDHA'}">selected</c:if>>BUDDHA</option>
                                                                <option value="OTHERS" <c:if test="${guardPersonalDetails.religion eq 'OTHERS'}">selected</c:if>>OTHERS</option>
                                                                    <!-- Add more options as needed -->
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <label for="guardGender">GENDER</label>
                                                                <select class="form-control" name="guardGender" id="guardGender">
                                                                    <option value="" <c:if test="${guardPersonalDetails.guardGender eq 'Choose'}">selected</c:if>>Choose</option>
                                                                <option value="MALE" <c:if test="${guardPersonalDetails.guardGender eq 'MALE'}">selected</c:if>>MALE</option>
                                                                <option value="FEMALE" <c:if test="${guardPersonalDetails.guardGender eq 'FEMALE'}">selected</c:if>>FEMALE</option>
                                                                <option value="OTHERS" <c:if test="${guardPersonalDetails.guardGender eq 'OTHERS'}">selected</c:if>>OTHERS</option>
                                                                    <!-- Add more options as needed -->
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <label>SOCSO NO : </label>
                                                                <input type="text" value="<c:out value='${guardPersonalDetails.guardSocsoNo}' />" 
                                                                   class="form-control" name="guardSocsoNo"/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label for="guardRace">RACE:</label>
                                                            <select class="form-control" name="guardRace" id="guardRace">
                                                                <option value="" <c:if test="${guardPersonalDetails.guardRace eq 'Choose'}">selected</c:if>>Choose Race</option>
                                                                <option value="MALAY" <c:if test="${guardPersonalDetails.guardRace eq 'MALAY'}">selected</c:if>>MALAY</option>
                                                                <option value="CHINESE" <c:if test="${guardPersonalDetails.guardRace eq 'CHINESE'}">selected</c:if>>CHINESE</option>
                                                                <option value="INDIA" <c:if test="${guardPersonalDetails.guardRace eq 'INDIA'}">selected</c:if>>INDIA</option>
                                                                <option value="OTHERS" <c:if test="${guardPersonalDetails.guardRace eq 'OTHERS'}">selected</c:if>>OTHERS</option>
                                                                    <!-- Add more options as needed -->
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <label>ACCOUNT NO : </label>
                                                                <input type="text" value="<c:out value='${guardPersonalDetails.guardAccNo}' />" 
                                                                   class="form-control" name="guardAccNo"/>
                                                        </td>
                                                        <td>
                                                            <label>NAME OF BANK : </label>
                                                            <input type="text" value="<c:out value='${guardPersonalDetails.guardNOB}' />" 
                                                                   class="form-control" name="guardNOB"/>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                            <button type="submit" class="btn btn-success">UPDATE</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!-- END OF PERSONAL DETAILS -->

                            <div id="content2" class="content-block">
                                <div class="container">
                                    <div class="form">
                                        <form action="updateGuardFamilyDetails" method="POST">
                                            <fieldset>
                                                <legend>Family Details</legend>

                                                <script>
                                                    function showTextField() {
                                                    var singleRadio = document.getElementById("single");
                                                    var marriedRadio = document.getElementById("married");
                                                    var divorcedRadio = document.getElementById("divorced");
                                                    var otherStatusField = document.getElementById("otherStatusField");
                                                    // Check if "Single" radio button is selected
                                                    if (singleRadio.checked) {
                                                    otherStatusField.style.display = "none"; // Hide the text field
                                                    document.getElementsByName("guardSpName")[0].value = "-";
                                                    document.getElementsByName("guardFamOccu")[0].value = "-";
                                                    document.getElementsByName("guardFamNoP1")[0].value = "-";
                                                    document.getElementsByName("guardNumOfChild")[0].value = "-";
                                                    document.getElementsByName("guardSpAdd")[0].value = "-";
                                                    } else if (marriedRadio.checked || divorcedRadio.checked) {
                                                    otherStatusField.style.display = "block"; // Show the text field
                                                    } else {
                                                    otherStatusField.style.display = "none"; // Hide the text field for other options
                                                    }
                                                    }

                                                    // Call showTextField() on page load to set the initial visibility
                                                    window.onload = function () {
                                                    showTextField();
                                                    }
                                                </script>

                                                <table>
                                                    <tr>
                                                        <td>
                                                            <input type="hidden" name="guardID" value="<c:out value='${guardFamilyDetails.guardID}' />" />
                                                            <label for="maritalStatus">MARITAL STATUS:</label><br>
                                                            <input type="radio" id="single" name="maritalStatus" value="SINGLE" 
                                                                   <c:if test="${guardFamilyDetails.maritalStatus eq 'SINGLE'}">checked</c:if> onclick="showTextField()">
                                                                   <label for="single">SINGLE</label><br>
                                                                   <input type="radio" id="married" name="maritalStatus" value="MARRIED" 
                                                                   <c:if test="${guardFamilyDetails.maritalStatus eq 'MARRIED'}">checked</c:if> onclick="showTextField()">
                                                                   <label for="married">MARRIED</label><br>
                                                                   <input type="radio" id="divorced" name="maritalStatus" value="DIVORCED" 
                                                                   <c:if test="${guardFamilyDetails.maritalStatus eq 'DIVORCED'}">checked</c:if> onclick="showTextField()">
                                                                   <label for="divorced">DIVORCED</label><br>
                                                                   <!-- Add more options as needed -->
                                                            </td>
                                                            <td>
                                                                <div id="otherStatusField" style="display: none;">
                                                                    <table>
                                                                        <tr>
                                                                            <td>
                                                                                <label>NAME OF SPOUSE : </label>
                                                                                <input type="text" value="<c:out value='${guardFamilyDetails.guardSpName}' />" 
                                                                                   class="form-control" name="guardSpName"/>
                                                                        </td>
                                                                        <td>
                                                                            <label>OCCUPATION : </label>
                                                                            <input type="text" value="<c:out value='${guardFamilyDetails.guardFamOccu}' />" 
                                                                                   class="form-control" name="guardFamOccu"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <label>TELEPHONE NO : </label>
                                                                            <input type="text" value="<c:out value='${guardFamilyDetails.guardFamNoP1}' />" 
                                                                                   class="form-control" name="guardFamNoP1"/>
                                                                        </td>

                                                                        <td>
                                                                            <label>NO. OF CHILDREN : </label>
                                                                            <input type="text" value="<c:out value='${guardFamilyDetails.guardNumOfChild}' />" 
                                                                                   class="form-control" name="guardNumOfChild"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2">
                                                                            <label>SPOUSE ADDRESS : </label>
                                                                            <input type="text" value="<c:out value='${guardFamilyDetails.guardSpAdd}' />" 
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
                                                            <input type="text" value="<c:out value='${guardFamilyDetails.guardFN}' />" 
                                                                   class="form-control" name="guardFN"/>
                                                        </td>
                                                        <td>
                                                            <label>OCCUPATION : </label>
                                                            <input type="text" value="<c:out value='${guardFamilyDetails.guardFOccu}' />" 
                                                                   class="form-control" name="guardFOccu"/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label>MOTHER’S NAME : </label>
                                                            <input type="text" value="<c:out value='${guardFamilyDetails.guardMomName}' />" 
                                                                   class="form-control" name="guardMomName"/>
                                                        </td>
                                                        <td>
                                                            <label>OCCUPATION : </label>
                                                            <input type="text" value="<c:out value='${guardFamilyDetails.guardMomOccu}' />" 
                                                                   class="form-control" name="guardMomOccu"/>
                                                        </td>
                                                    </tr> 
                                                    <tr>
                                                        <td colspan="2">
                                                            <label>ADDRESS : </label>
                                                            <input type="text" value="<c:out value='${guardFamilyDetails.guardParentAdd}' />" 
                                                                   class="form-control" name="guardParentAdd"/>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                            <button type="submit" class="btn btn-success">UPDATE</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!-- end fam details -->

                            <div id="content3" class="content-block">
                                <div class="container">
                                    <div class="form">
                                        <form action="updateGuardEdu" method="POST">
                                            <fieldset>
                                                <legend>Educational Background</legend>
                                                <button type="button" onclick="addEducationEntry()">Add Educational Background</button>
                                                <script>
                                                    function addEducationEntry() {
                                                    const educationEntries = document.getElementById('educationEntries');
                                                    const newEntry = document.createElement('div');
                                                    newEntry.className = 'education-entry';
                                                    newEntry.innerHTML = `
                                                            <input type="hidden" name="id[]" value="">
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <label for="SCHOOL/UNIVERSITY/COURSES">SCHOOL/UNIVERSITY</label>
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
                                                                        <label for="dateTo">DATE TO:</label>
                                                                        <input type="date" name="dateTo[]" min="1900" max="2099" required>
                                                                    </td>
                                                                </tr>
                                                            </table>`;
                                                    educationEntries.appendChild(newEntry);
                                                    }
                                                </script>

                                                <div id="educationEntries">
                                                    <c:forEach var="edu" items="${guardEduBg}">
                                                        <div class="education-entry">
                                                            <input type="hidden" name="id[]" value="${edu.id}">
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <label for="SCHOOL/UNIVERSITY/COURSES">SCHOOL/UNIVERSITY</label>
                                                                        <input type="text" name="school[]" value="${edu.school}" required>
                                                                    </td>
                                                                    <td>
                                                                        <label for="STATE">STATE</label>
                                                                        <input type="text" name="state[]" value="${edu.state}" required>
                                                                    </td>
                                                                    <td>
                                                                        <label for="dateStart">DATE FROM:</label>
                                                                        <input type="date" name="dateStart[]" value="${edu.dateStart}" min="1900" max="2099" required>
                                                                    </td>
                                                                    <td>
                                                                        <label for="dateTo">DATE TO:</label>
                                                                        <input type="date" name="dateTo[]" value="${edu.dateTo}" min="1900" max="2099" required>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </fieldset>
                                            <button type="submit" class="btn btn-success">UPDATE</button>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <!-- end edu -->

                            <div id="content4" class="content-block">
                                <div class="container">
                                    <div class="form">
                                        <form action="updateGuardPrevEmployment" method="POST">
                                            <fieldset>
                                                <legend>
                                                    Previous Employment Position
                                                </legend>
                                                <button type="button" onclick="PreviousEmploymentEntry()">Add Previous Employment</button><br>
                                                <script>
                                                    function PreviousEmploymentEntry() {
                                                    const previousEmploymentEntries = document.getElementById('previousEmploymentEntries');
                                                    const newEntry = document.createElement('div');
                                                    newEntry.className = 'previousEmployment-entry';
                                                    newEntry.innerHTML = `
                                                        <input type="hidden" name="prevJobId[]" value="">        
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
                                                    <c:forEach var="preJob" items="${guardPreviousJob}">
                                                        <div class="previousEmployment-entry">
                                                            <input type="hidden" name="prevJobId[]" value="${preJob.prevJobId}">
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <label>EMPLOYER’S NAME</label>
                                                                        <input type="text" name="employerName[]" value="${preJob.employerName}" required>
                                                                    </td>
                                                                    <td>
                                                                        <label for="POSITION HELD">POSITION HELD</label>
                                                                        <input type="text" name="positionHeld[]" value="${preJob.positionHeld}" required>
                                                                    </td>
                                                                    <td>
                                                                        <label for="dateStart">DATE FROM:</label>
                                                                        <input type="date" name="dateStart[]" value="${preJob.dateStart}" min="1900" max="2099" required>
                                                                    </td>
                                                                    <td>
                                                                        <label for="dateTO">DATE TO:</label>
                                                                        <input type="date" name="dateTo[]" value="${preJob.dateTo}" min="1900" max="2099" required>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2">
                                                                        <label for="EMPLOYER’S ADDRESS">EMPLOYER’S ADDRESS</label>
                                                                        <input type="text" name="EA[]" value="${preJob.EA}" required>
                                                                    </td>                                                   
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </fieldset>
                                            <button type="submit" class="btn btn-success">UPDATE</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!-- end prev -->


                            <div id="content5" class="content-block">
                                <div class="container">
                                    <div class="form">
                                        <form action="updateGuardPrevExPoliceOrArmy" method="POST">
                                            <fieldset>
                                                <legend>Ex-Police Or Ex-Army</legend>
                                                <script>
                                                    function showTxtField() {
                                                    var yesRadio = document.getElementById("YES");
                                                    var statusField = document.getElementById("statusField");
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
                                                    window.onload = function () {
                                                    showTxtField();
                                                    }
                                                </script>
                                                <input type="hidden" value="<c:out value='${guardExArmyOrPolice.guardID}' />" name="guardID"/>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <label for="exArmyOrPolice">Ex Army Or Police:</label><br>
                                                            <input type="radio" id="YES" name="exArmyOrPolice" value="YES" 
                                                                   <c:if test="${guardExArmyOrPolice.exArmyOrPolice == 'YES'}">checked</c:if> onclick="showTxtField()">
                                                                   <label for="YES">YES</label><br>
                                                                   <input type="radio" id="NO" name="exArmyOrPolice" value="NO" 
                                                                   <c:if test="${guardExArmyOrPolice.exArmyOrPolice == 'NO'}">checked</c:if> onclick="showTxtField()">
                                                                   <label for="NO">NO</label><br>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td id="statusField" style="display: none;">
                                                                <div>
                                                                    <table>
                                                                        <tr>
                                                                            <td>
                                                                                <label>SERVICE NO : </label>
                                                                                <input type="text" value="<c:out value='${guardExArmyOrPolice.guardServiceNo}' />" 
                                                                                   class="form-control" name="guardServiceNo"/>
                                                                        </td>
                                                                        <td>
                                                                            <label>POSITION HELD : </label>
                                                                            <input type="text" value="<c:out value='${guardExArmyOrPolice.guardPosition}' />" 
                                                                                   class="form-control" name="guardPosition"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <label for="dateStart">DATE FROM:</label><br>
                                                                            <input type="date" name="dateStart" value="<c:out value='${guardExArmyOrPolice.dateStart}' />" min="1900" max="2099">
                                                                        </td>
                                                                        <td>
                                                                            <label for="dateTo">DATE TO:</label><br>
                                                                            <input type="date" name="dateTo" value="<c:out value='${guardExArmyOrPolice.dateTo}' />" min="1900" max="2099">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <label>BRANCH : </label>
                                                                            <input type="text" value="<c:out value='${guardExArmyOrPolice.guardBranch}' />" 
                                                                                   class="form-control" name="guardBranch"/>
                                                                        </td>
                                                                        <td>
                                                                            <label>REASON FOR LEAVING : </label>
                                                                            <input type="text" value="<c:out value='${guardExArmyOrPolice.guardRFLPA}' />" 
                                                                                   class="form-control" name="guardRFLPA"/>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                            <button type="submit" class="btn btn-success">UPDATE</button>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <!-- end prev -->


                            <div id="content6" class="content-block">
                                <div class="container">
                                    <div class="form">
                                        <form action="updateGuardReference" method="POST">
                                            <fieldset>
                                                <legend>
                                                    Personal References
                                                </legend>
                                                <input type="hidden" name="guardID" value="${guardReference.guardID}">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <label>REFERENCE NAME : </label> 
                                                            <input type="text" value="<c:out value='${guardReference.guardReferName}' />" 
                                                                   class="form-control" name="guardReferName"/>
                                                        </td>

                                                        <td>
                                                            <label>REFERENCE JOB : </label> 
                                                            <input type="text" value="<c:out value='${guardReference.guardReferJob}' />" 
                                                                   class="form-control" name="guardReferJob"/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <label>ADDRESS:</label>
                                                            <textarea class="form-control" name="guardReferAddress" required="required">
                                                                <c:out value='${guardReference.guardReferAddress}' />             
                                                            </textarea>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label>REFERENCE RELATION : </label> 
                                                            <input type="text" value="<c:out value='${guardReference.guardReferRelation}' />" 
                                                                   class="form-control" name="guardReferRelation"/>
                                                        </td>
                                                        <td>
                                                            <label>REFERENCE TELEPHONE NO : </label> 
                                                            <input type="text" value="<c:out value='${guardReference.guardReferPhoneNo}' />" 
                                                                   class="form-control" name="guardReferPhoneNo"/>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                            <button type="submit" class="btn btn-success">UPDATE</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <script>
                        function showContent(contentId) {
                        // Hide all content blocks
                        var contents = document.getElementsByClassName('content-block');
                        for (var i = 0; i < contents.length; i++) {
                        contents[i].classList.remove('active');
                        }

                        // Show the selected content block
                        document.getElementById(contentId).classList.add('active');
                        // Make AJAX request to servlet to fetch content
                        var xhttp = new XMLHttpRequest();
                        xhttp.onreadystatechange = function () {
                        if (this.readyState == 4 && this.status == 200) {
                        // Update content dynamically based on AJAX response
                        document.getElementById(contentId).innerHTML = this.responseText;
                        }
                        };
                        xhttp.open("GET", "YourServletUrl?content=" + contentId, true);
                        xhttp.send();
                        }
                    </script>
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
