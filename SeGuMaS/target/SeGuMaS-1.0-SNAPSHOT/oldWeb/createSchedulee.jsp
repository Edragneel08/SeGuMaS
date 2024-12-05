<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/adminMenu.css">
        <link rel="stylesheet" href="CSS/scheduleForm.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="js/navBar.js"></script>

        <!-- Dynamic Search Script -->
        <script>
            $(document).ready(function () {
                $("#search").on("input", function () {
                    var value = $(this).val().toUpperCase();
                    $("#guardDropdown option").filter(function () {
                        $(this).toggle($(this).text().toUpperCase().indexOf(value) > -1)
                    });
                });

                // Submit the form via AJAX
                $("form").on("submit", function (event) {
                    event.preventDefault();
                    var formData = $(this).serialize();
                    $.post("addToSchedule", formData, function (response) {
                        alert("Schedule added successfully!");
                    }).fail(function () {
                        alert("Failed to add schedule.");
                    });
                });

                // Hide dropdown when clicking outside
                $(document).click(function (e) {
                    if (!$(e.target).closest('#search, #guardDropdown').length) {
                        $("#guardDropdown").hide();
                    }
                });

                $("#search").click(function () {
                    $("#guardDropdown").show();
                });
            });

            function selectGuard(guardID, guardName) {
                $("#selectedGuardID").val(guardID);
                $("#search").val(guardName);
                $("#guardDropdown").hide();
            }
        </script>
        <style>
            /* scheduleForm.css */

            /* General Styles */
            body {
                font-family: Arial, sans-serif;
            }

            .content {
                padding: 20px;
                margin-left: 250px; /* Adjust this if your sidebar width is different */
            }

            .mycontainer4 {
                padding: 20px;
                background-color: #f4f4f9;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
                max-width: 800px;
                margin: auto;
            }

            h2 {
                color: #333;
                text-align: center;
            }

            /* Form Styles */
            form {
                display: flex;
                flex-direction: column;
            }

            form table {
                width: 100%;
            }

            form table td {
                padding: 10px;
                vertical-align: top;
            }

            label {
                font-weight: bold;
                margin-bottom: 5px;
                display: block;
            }

            input[type="text"],
            input[type="date"],
            input[type="time"] {
                width: calc(100% - 20px);
                padding: 8px;
                margin-top: 5px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            button[type="submit"] {
                background-color: #4CAF50;
                color: white;
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
            }

            button[type="submit"]:hover {
                background-color: #45a049;
            }

            /* Dropdown Styles */
            .dropdown-content {
                position: absolute;
                background-color: #f9f9f9;
                min-width: 200px;
                max-height: 150px;
                overflow-y: auto;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1;
                display: none;
                margin-top: 5px;
                border: 1px solid #ddd;
            }

            .dropdown-content option {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
                cursor: pointer;
            }

            .dropdown-content option:hover {
                background-color: #f1f1f1;
            }
        </style>
    </head>
    <body>
        <div class="sidebar">
            <a class="segu" href="#SEGUMAS"><img src="img/logo.png" alt="Trulli" width="100%" height="100%" ></a>
            <a href="<%=request.getContextPath()%>/listGuardMenu">Home</a>
            <ul class="mainmenu">
                <!-- Other menu items -->
                <li class="dropdown">
                    <a href="#" class="dropdown-link active">Manage Schedule</a>
                    <ul class="submenu">
                        <li><a href="<%=request.getContextPath()%>/listGuardCreate">Create Schedule</a></li>
                        <li><a href="<%=request.getContextPath()%>/viewSchedule">View Schedule</a></li>
                    </ul>
                </li>
                <!-- More menu items -->
            </ul>
            <a href="${pageContext.request.contextPath}/logout">LOGOUT</a>
        </div>

        <div class="content">
            <div class="mycontainer4">
                <div style="background-color:#A7C7E7;">
                    <h2>Add Guard to Schedule</h2>
                    <form id="scheduleForm">
                        <table>
                            <tr>
                                <td>
                                    <label for="shiftDuration">Duration:</label>
                                    <input type="text" id="shiftDuration" name="shiftDuration" required>
                                    <label for="shiftDate">Date:</label>
                                    <input type="date" id="shiftDate" name="shiftDate" required>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="shiftStartTime">Start Time:</label>
                                    <input type="time" id="shiftStartTime" name="shiftStartTime" required>
                                    <label for="shiftEndTime">End Time:</label>
                                    <input type="time" id="shiftEndTime" name="shiftEndTime" required>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="branchID">Branch ID:</label>
                                    <input type="text" id="branchID" name="branchID" required>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="hidden" id="selectedGuardID" name="selectedGuardID">
                                    <input type="text" id="search" placeholder="Search guards...">
                                    <select id="guardDropdown" class="dropdown-content" size="5">
                                        <c:forEach var="guard" items="${listGuard}">
                                            <option onclick="selectGuard('${guard.guardID}', '${guard.guardName}')">
                                                ${guard.guardName} - ${guard.guardID}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                        </table>
                        <button type="submit">Add to Schedule</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
