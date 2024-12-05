<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="DAO.guardDAO" %>
<%@ page import="MODEL.guardPersonalDetails" %>

<%
    // Retrieve the guardID from the request parameter
    String guardID = request.getParameter("guardID");
    if (guardID != null && !guardID.isEmpty()) {
        // Instantiate the DAO
        guardDAO GuardDAO = new guardDAO();
        
        // Retrieve the staff object
        guardPersonalDetails guardPersonalDetails = GuardDAO.selectGuard(guardID);
        
        // Set the staff object as a request attribute
        request.setAttribute("guardPersonalDetails", guardPersonalDetails);
    } else {
        // Handle the case where guardID is not present
        request.setAttribute("error", "Guard ID is missing.");
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Security Guard Information</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                box-sizing: border-box;
                background-color: #f0f0f0;
            }
            .container {
                width: 100%;
                max-width: 21cm;
                padding: 20px;
                border: 1px solid #000;
                box-sizing: border-box;
                background-color: #fff;
                position: relative;
            }
            .header {
                display: flex;
                align-items: center;
                justify-content: center;
                margin-bottom: 10px;
            }
            .header-content {
                display: flex;
                align-items: center;
            }
            .header img {
                width: 150px; /* Adjust the size as needed */
                height: auto;
                margin-right: 20px;
            }
            .header h1 {
                margin: 0;
                font-size: 24px;
            }
            .header p {
                margin: 5px 0;
                font-size: 14px;
            }
            .header-text {
                text-align: left;
            }
            .photo {
                text-align: center;
                margin: 10px 0;
            }
            .photo img {
                width: 150px; /* Increase the size of the profile picture */
                height: auto;
                border: 1px solid #000;
                padding: 5px;
            }
            .info-table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
            }
            .info-table th, .info-table td {
                border: 1px solid #000;
                padding: 10px;
                text-align: left;
            }
            .info-table th {
                background-color: #d3d3d3;
            }
            .signature {
                margin-top: 50px;
                text-align: right;
            }
            .signature p {
                margin: 0;
            }
            .signature .signature-line {
                margin: 30px 0;
                width: 200px;
                border-top: 1px solid #000;
                display: inline-block;
            }
            .print-button {
                display: block;
                text-align: center;
                position: absolute;
                top: 20px;
                right: 20px;
            }
            .print-button button {
                padding: 10px 20px;
                font-size: 16px;
                cursor: pointer;
            }
            @media print {
                body {
                    justify-content: flex-start;
                }
                .container {
                    width: 21cm;
                    height: 29.7cm;
                    padding: 20px;
                    border: none;
                    box-shadow: none;
                    page-break-inside: avoid;
                }
                .print-button {
                    display: none;
                }
            }
        </style>
        <script>
            function printPage() {
                window.print();
            }
        </script>
    </head>
    <body>
        <div class="container">
            <div class="header">
                <div class="header-content">
                    <img src="img/logo_1.png" alt="Company Logo">
                    <div class="header-text">
                        <h1>JASA PERKASA SECURITY SDN.BHD</h1>
                        <p>PT, 100882-1 Wisma Nerus,<br>
                            Jalan Gong Badak,<br>
                            21300 Kuala Nerus, Terengganu.<br>
                            Tel/Fax: 09-6623223</p>
                    </div>
                </div>
            </div>
            <div class="photo">
                <c:if test="${guardPersonalDetails.base64Img != null}">
                    <img src="data:image/jpeg;base64,${guardPersonalDetails.base64Img}" alt="Guard Image" />
                </c:if>
                <c:if test="${guardPersonalDetails.base64Img == null}">
                    <img src="http://www.placehold.it/150x150/EFEFEF/AAAAAA&amp;text=no+image" alt="No Image" style="width: 150px; height: 150px;" />
                </c:if>
            </div>
            <table class="info-table">
                <tr>
                    <th colspan="2">MAKLUMAT PERIBADI PENGAWAL KESELAMATAN</th>
                </tr>
                <tr>
                    <td>1. Nama</td>
                    <td><c:out value="${guardPersonalDetails.guardName}" /></td>
                </tr>
                <tr>
                    <td>2. No. K/P Baru</td>
                    <td><c:out value="${guardPersonalDetails.guardICNO}" /></td>
                </tr>
                <tr>
                    <td>3. Umur</td>
                    <td id="age"></td>
                </tr>
                <tr>
                    <td>4. Tarikh Lahir</td>
                    <td id="dob"><c:out value="${guardPersonalDetails.guardDOB}" /></td>
                </tr>
                <tr>
                    <td>5. Alamat Semasa</td>
                    <td><c:out value="${guardPersonalDetails.guardAddress}" /></td>
                </tr>
                <tr>
                    <td>6. Jantina</td>
                    <td><c:out value="${guardPersonalDetails.guardGender}" /></td>
                </tr>
                <tr>
                    <td>7. Bangsa</td>
                    <td><c:out value="${guardPersonalDetails.guardRace}" /></td>
                </tr>
                <tr>
                    <td>8. Agama</td>
                    <td><c:out value="${guardPersonalDetails.religion}" /></td>
                </tr>
                <tr>
                    <td>9. No Tel</td>
                    <td><c:out value="${guardPersonalDetails.guardPhoneNo}" /></td>
                </tr>
                <tr>
                    <td>10. Post</td>
                    <td><c:out value="${guardPersonalDetails.nationality}" /></td>
                </tr>
                <tr>
                    <td>11. Tarikh Masuk Kerja</td>
                    <td><c:out value="${guardPersonalDetails.dateWorkStart}" /></td>
                </tr>
                <tr>
                    <td>12. No Pekerja</td>
                    <td><c:out value="${guardPersonalDetails.guardEPFNo}" /></td>
                </tr>
            </table>
            <div class="signature">
                <p>......................................................</p>
                <p>(AMIR ZULHIMI BIN ISMAIL)</p>
                <p>PENGARAH URUSAN</p>
            </div>
            <div class="print-button">
                <button onclick="printPage()">Print</button>
            </div>
        </div>
        <script>
            function calculateAge(dob) {
                const dobDate = new Date(dob);
                const now = new Date();
                let age = now.getFullYear() - dobDate.getFullYear();
                const monthDifference = now.getMonth() - dobDate.getMonth();
                if (monthDifference < 0 || (monthDifference === 0 && now.getDate() < dobDate.getDate())) {
                    age--;
                }
                return age;
            }

            document.addEventListener("DOMContentLoaded", function () {
                const dobElement = document.getElementById("dob");
                const ageElement = document.getElementById("age");

                const dobValue = dobElement.textContent.trim(); // Get the DOB value
                if (dobValue) {
                    const age = calculateAge(dobValue);
                    ageElement.textContent = `${age} TAHUN`;
                } else {
                    ageElement.textContent = "N/A"; // In case DOB is not available
                }
            });
        </script>
    </body>
</html>
