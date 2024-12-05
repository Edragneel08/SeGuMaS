<%-- 
    Document   : addGuard
    Created on : 15 Jan 2024, 6:31:39 pm
    Author     : edrag
--%>

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
        <title>Add new Guard</title>
        <link rel="stylesheet" href="css/adminMenu.css">
        <link rel="stylesheet" href="css/addHR.css">
        <link rel="stylesheet" href="css/addGuard.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="js/navBar.js"></script>  
    </head>
    <body>
        <div class="sidebar">
            <a class="segu" href="#SEGUMAS"><img src="img/logo.png" alt="Trulli" width="100%" height="100%" ></a>
                <%
                    // Get the value of the "username" attribute from the session
                    String username = (String) session.getAttribute("username");
                %>
            <h2 style="color: wheat">Hi,<%= username %></h2>
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
                    <a href="#" class="dropdown-link active">Manage Security Guard</a>
                    <ul class="submenu">
                        <li><a class="active" href="addGuard.jsp">Add New Guard</a></li>
                        <li><a href="<%=request.getContextPath()%>/listGuard">View List Guard</a></li>
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
            <a href="${pageContext.request.contextPath}/logout">LOGOUT</a>
        </div>


        //form
        <div class="content">
            <!-- content -->
            <div class="mycontainer3">
                <div class="container col-md-8">
                    <div class="card">
                        <div class="card-body">
                            <c:if test="${guard != null}">
                                <form action="updateGuard" method="GET">
                                </c:if>
                                <c:if test="${guard == null}">
                                    <form action="insertGuard" method="GET">
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
                                                    <label>TELEPHONE NO : </label> 
                                                    <input type="text" value="<c:out value='${guard.guardPhoneNo}' />"
                                                           class="form-control" name="guardPhoneNo" required="required"/>
                                                </td>
                                            </tr>
                                            <tr>
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
                                                    <td>
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
                                                    <td>
                                                        <div id="statusField" style="display: none;">
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
                                                                    <input type="date" name="dateStart" min="1900" max="2099" required>
                                                                </td>
                                                                <td>
                                                                    <label for="dateTO">DATE TO:</label>
                                                                    <input type="date" name="dateTo" min="1900" max="2099" required>
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
                        </div>
                    </div>
                </div>
            </div>
        </div> 
    </body>
</html>