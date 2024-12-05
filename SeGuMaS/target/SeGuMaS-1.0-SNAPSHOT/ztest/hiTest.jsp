<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="java.util.List" %>
<%@ page import="DAO.leaveDAO" %>
<%@ page import="MODEL.leave" %>


<%
    leaveDAO LeaveDAO = new leaveDAO();
     List<leave> listLeave = LeaveDAO.selectAllLeave();
    request.setAttribute("leaveList", listLeave);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Leave Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
        }
        .container {
            width: 80%;
            margin: auto;
            padding: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Leave Report</h2>
        <table id="leaveTable">
            <thead>
                <tr>
                    <th>Leave ID</th>
                    <th>Guard ID</th>
                    <th>Guard Name</th>
                    <th>Leave Type</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Reason</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <!-- Use server-side script (e.g., JSP, PHP) to iterate and generate rows -->
                <c:forEach var="leave" items="${leaveList}">
                    <tr>
                        <td><c:out value="${leave.leaveID}" /></td>
                        <td><c:out value="${leave.guardID}" /></td>
                        <td><c:out value="${leave.guardName}" /></td>
                        <td><c:out value="${leave.leaveType}" /></td>
                        <td><c:out value="${leave.startDate}" /></td>
                        <td><c:out value="${leave.endDate}" /></td>
                        <td><c:out value="${leave.reason}" /></td>
                        <td><c:out value="${leave.status}" /></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <button class="btn" onclick="generatePDF()">Generate PDF</button>
    </div>

    <!-- Include jsPDF library -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.3.1/jspdf.umd.min.js"></script>
    <script>
        async function generatePDF() {
            const { jsPDF } = window.jspdf;
            const doc = new jsPDF();
            
            // Optional: Add a title or other text to the PDF
            doc.text("Leave Report", 20, 10);

            // Fetch the table element
            const table = document.getElementById("leaveTable");

            // Add table to the PDF using autoTable
            doc.autoTable({ html: table });

            // Save the PDF
            doc.save('leave_report.pdf');
            window.location.href = "viewLeaveList";
        }
    </script>

    <!-- Include jsPDF AutoTable plugin -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.13/jspdf.plugin.autotable.min.js"></script>
</body>
</html>
