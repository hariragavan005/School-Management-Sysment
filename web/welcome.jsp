<%-- 
    Document   : welcome
    Created on : 10-Nov-2024, 11:24:15 am
    Author     : subha
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>School Management System - Welcome</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="styles2.css">
</head>
<body>
    <!-- Logout button container -->
    <div class="logout-container">
        <button id="logoutBtn" class="btn btn-danger" onclick="showLogoutMessage()">Logout</button>
    </div>

    <!-- Modal for goodbye message -->
    <div class="modal fade" id="logoutModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Goodbye!</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p id="greetingMessage"></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="proceedToLogout()">OK</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Container for the welcome content -->
    <div class="welcome-container">
        <div class="welcome-content">
            <h1>School Management System</h1>
           
            <!-- Flexbox for navigation buttons -->
            <div class="role-buttons">
                <a href="teacher.jsp" class="btn btn-primary">Teacher Page</a>
                <a href="student.jsp" class="btn btn-success">Student Page</a>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Custom JavaScript -->
    <script>
        const greetings = [
            "Thank you for using our School Management System. Have a great day!",
            "Goodbye! We hope to see you again soon.",
            "Thank you for your hard work today. See you next time!",
            "Wishing you a wonderful rest of your day!",
            "Your session has ended. Stay curious and keep learning!"
        ];

        function showLogoutMessage() {
            // Get random greeting
            const randomGreeting = greetings[Math.floor(Math.random() * greetings.length)];
            document.getElementById('greetingMessage').textContent = randomGreeting;
            
            // Show modal
            const modal = new bootstrap.Modal(document.getElementById('logoutModal'));
            modal.show();
        }

        function proceedToLogout() {
            // Redirect to logout servlet
            window.location.href = 'LogoutServlet';
        }
    </script>
</body>
</html>