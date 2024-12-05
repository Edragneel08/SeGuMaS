<%-- 
    Document   : adminMenu
    Created on : 14 Jan 2024, 1:35:50 pm
    Author     : edrag
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Login</title>
        <link rel="stylesheet" href="css/style1.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <style>
            #messageBox {
                background-color: #d4edda;
                color: #155724;
                padding: 20px;
                margin-bottom: 20px;
                border: 1px solid #c3e6cb;
                border-radius: 8px;
                display: none;
            }

            .select-wrapper {
                position: relative;
                width: 100%;
                margin: 8px 0;
            }

            select.form-control {
                width: 100%;
                padding: 12px 15px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 20px;
                background-color: #eee;
                font-size: 16px;
                color: #333;
                -webkit-appearance: none;
                -moz-appearance: none;
                appearance: none;
                background-image: url('data:image/svg+xml;utf8,<svg fill="none" height="24" stroke="%23333" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><polyline points="6 9 12 15 18 9"/></svg>');
                background-repeat: no-repeat;
                background-position: right 10px center;
                background-size: 16px 16px;
            }

            select.form-control:focus {
                border-color: #FF4B2B;
                box-shadow: 0 0 5px rgba(255, 75, 43, 0.5);
                outline: none;
            }

            .select-wrapper::after {
                content: '';
                position: absolute;
                top: 50%;
                right: 15px;
                transform: translateY(-50%);
                pointer-events: none;
            }

            label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
                font-size: 14px;
                color: #333;
            }

            /* Adjusted styles for text fields */
            input[type="text"],
            input[type="password"] {
                width: 100%;
                padding: 12px 15px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 20px; /* Increased border radius for a smoother appearance */
                background-color: #eee;
                font-size: 16px;
                color: #333;
                transition: border-color 0.3s ease;
                box-sizing: border-box; /* Ensures padding and border are included in the width */
                position: relative; /* Added position relative for correct positioning */
            }

            input[type="text"]:focus,
            input[type="password"]:focus {
                border-color: #FF4B2B;
                box-shadow: 0 0 5px rgba(255, 75, 43, 0.5);
                outline: none;
            }

            i {
                position: absolute;
                top: 69.8%;
                transform: translateY(-50%);
                transform: translateX(560%);
                cursor: pointer;
            }
            
        </style>
    </head>
    <body>
        <%
            // Check if the "sessionDestroyed" attribute is set and is true
            Boolean sessionDestroyed = (Boolean) request.getAttribute("sessionDestroyed");
            if (sessionDestroyed != null) {
        %>
        <!-- Show the message box if the session has been destroyed (logout) -->
        <div id="messageBox">
            Thank you for logging out. Have a great day!
        </div>
        <%
            } else if (sessionDestroyed == null) {
        %>
        <div id="messageBox">
            Please insert the right information. Have a great day!
        </div>
        <%
            
            }
        %>
        <h1>Security Guard Management System (SeGuMaS)</h1>
        <div class="container" id="container">
            <div class="form-container sign-in-container">
                <form action="loginServlet" method="GET">
                    <h1>Login</h1>
                    <label for="roleSelection">Role</label>
                    <div class="select-wrapper" id="roleSelection">
                        <select class="form-control" name="role" id="role">
                            <option value="Admin">Admin</option>
                            <option value="staff">Staff</option>
                            <option value="manager">Manager</option>
                            <!-- Add more options as needed -->
                        </select> 
                    </div>
                    <input type="text" placeholder="Username" name="username" required/>


                    <input type="password" placeholder="Password" name="password" id="password" required/>
                    <i class="fas fa-eye-slash toggle-password" id="togglePassword"></i>


                    <button>LOGIN</button>
                </form>
            </div>
            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-right">
                        <h2 style="margin-top: 70%;">Hello, Welcome Back to SeGuMaS!</h2>
                        <a style="margin-bottom: 50%;" class="segu" href="#SEGUMAS"><img src="img/logo_1.png" alt="Trulli" width="100%" height="90%" ></a>
                    </div>
                </div>
            </div>
        </div>

        <footer>
            <p>
                Created with <i class="fa fa-heart"> Love </i> by <i class="fa fa-heart">Muhammad Irman Syakir Bin Ismail</i>
            </p>
        </footer>
        
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
            $(document).ready(function () {
                var messageBox = $('#messageBox');
                messageBox.show('<%= sessionDestroyed != null && sessionDestroyed ? "block" : "none" %>');

                // Automatically hide the message box after 5 seconds
                setTimeout(function () {
                    messageBox.hide();
                }, 5000);

                // Show Password toggle functionality
                $('#togglePassword').on('click', function () {
                    var passwordField = $('#password');
                    var passwordFieldType = passwordField.attr('type');
                    if (passwordFieldType === 'password') {
                        passwordField.attr('type', 'text');
                        $(this).removeClass('fa-eye-slash').addClass('fa-eye');
                    } else {
                        passwordField.attr('type', 'password');
                        $(this).removeClass('fa-eye').addClass('fa-eye-slash');
                    }
                });
            });
        </script>
    </body>
</html>
