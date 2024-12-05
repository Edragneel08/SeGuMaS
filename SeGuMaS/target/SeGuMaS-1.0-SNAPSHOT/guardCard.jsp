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
<html>
    <head>
        <title>Employee Card</title>
        <style>
            .card-container {
                display: flex;
                justify-content: center;
                gap: 10mm;
            }
            .card {
                width: 54mm;
                height: 85.6mm;
                border: 1px solid black;
                padding: 5px;
                font-family: Arial, sans-serif;
                box-sizing: border-box;
            }
            .top-section, .bottom-section {
                width: 100%;
                height: 100%;
                margin-bottom: 10px;
            }
            .header {
                text-align: center;
                margin-bottom: 10px;
            }
            .header .title {
                font-size: 8px;
                font-weight: bold;
                margin: 5px;
            }
            .header .company-info {
                font-size: 6px;
                margin: 2px 0;
            }
            .photo {
                text-align: center;
                margin: 5px 0;
            }
            .photo img {
                width: 25mm;
                height: 30mm;
            }
            .employee-info {
                text-align: center;
                font-size: 9px;
                font-weight: bold;
                margin: 5px 0;
            }
            .position {
                background-color: #FF0000;
                color: white;
                padding: 10px;
                font-size: 8px;
                font-weight: bold;
                text-align: center;
            }
            .info-table {
                width: 100%;
                margin: 5px 0;
            }
            .info-table td {
                padding: 2px;
                font-size: 6px;
            }
            .info-table .label {
                width: 50%;
                font-weight: bold;
            }
            .warning {
                font-size: 7px;
                margin: 20px 0;
            }
            .admin {
                text-align: center;
                font-size: 6px;
                font-weight: bold;
                background-color: #FF0000;
                color: white;
                padding: 10px;
                margin-top: 5px;
            }
         
            .print-button {
                margin-top: 10px;
                text-align: center;
                display: block;
                text-align: center;
                position: absolute;
                top: 500px;
                right: -150px;
            }
            @media print {
                .print-button {
                    display: none;
                }
            }
        </style>
    </head>
    <body>

        <div class="card-container">
            <div class="card">
                <div class="bottom-section">
                    <p style="text-align:center; font-size: 10px;font: bold;">JASA PERKASA SECURITY SDN BHD</p>
                    <div class="photo">
                        <c:if test="${guardPersonalDetails.base64Img != null}">
                            <img src="data:image/jpeg;base64,${guardPersonalDetails.base64Img}" alt="Guard Image" />
                        </c:if>
                        <c:if test="${guardPersonalDetails.base64Img == null}">
                            <img src="http://www.placehold.it/100x100/EFEFEF/AAAAAA&amp;text=no+image" alt="No Image" style="width: 100px; height: 100px;" />
                        </c:if>
                    </div>
                    <div class="employee-info">
                        <h3><c:out value="${guardPersonalDetails.guardID}" /></h3>
                    </div>

                    <div class="position">
                        KEBERSIHAN
                    </div>
                    <div class="employee-name" style="text-align:center">
                        <h4><c:out value="${guardPersonalDetails.guardName}" /></h4>
                    </div>
                    <div class="admin">
                        BAHAGIAN PENJAWATAN DAN PENTADBIRAN
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="top-section">
                    <div class="header">
                        <img src="img/logo_1.png" alt="Company Logo" width="30mm">
                        <div class="title">JASA PERKASA SEC SDN BHD (1314985-H)</div>
                        <div class="company-info">
                            LOT 3447-A, TINGKAT 1, WISMA CAMAR, JALAN TOK JEMBAL, 21300 KUALA NERUS, TERENGGANU<br>
                            Tel: 09-662 3223
                        </div>
                    </div>
                    <table class="info-table">
                        <tr>
                            <td class="label">Nama:</td>
                            <td><c:out value="${guardPersonalDetails.guardName}" /></td>
                        </tr>
                        <tr>
                            <td class="label">Jawatan:</td>
                            <td>PEMANTAU KEBERSIHAN</td>
                        </tr>
                        <tr>
                            <td class="label">No. K/P:</td>
                            <td><c:out value="${guardPersonalDetails.guardICNO}" /></td>
                        </tr>
                        <tr>
                            <td class="label">Tarikh:</td>
                            <td><c:out value="${guardPersonalDetails.dateWorkStart}" /></td>
                        </tr>
                        <tr>
                            <td class="label">No. Pekerja:</td>
                            <td><c:out value="${guardPersonalDetails.guardEPFNo}" /></td>
                        </tr>
                    </table>
                    <div class="warning">
                        KEPADA SESIAPA YANG MENJUMPAI KAD INI SILA KEMBALIKAN KEPADA:<br>
                        JASA PERKASA SEC SDN. BHD.<br>
                        LOT 3447-A, TINGKAT 1, WISMA CAMAR, JALAN TOK JEMBAL, 21300 KUALA NERUS, TERENGGANU<br>
                        Tel: 09-662 3223
                        <br><br>
                        PERINGATAN:<br>
                        1. Kad ini adalah pengenalan kakitangan Jasa Perkasa Sec Sdn Bhd.<br>
                        2. Kad ini tidak boleh ditukar milik.<br>
                        3. Kad ini mesti dipulangkan setiap masa selepas bekerja dan apabila diminta oleh pihak pengurusan.<br>
                        4. Jika hilang atau rosak, sila laporkan kepada pihak pengurusan serta merta.<br>
                        5. Kad ini hendaklah dipakai sepanjang masa bekerja.<br>
                        6. Kad ini adalah hakmilik Jasa Perkasa Sec Sdn Bhd dan pengurusan berhak meminta kad ini pada bila-bila masa.<br>
                    </div>
                </div>
            </div>
        </div>

        <div class="print-button">
            <button onclick="window.print()">Print</button>
        </div>

    </body>
</html>
