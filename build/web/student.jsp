<%-- 
    Document   : student
    Created on : 10-Nov-2024, 12:55:48 pm
    Author     : subha
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        /* Reset and Base Styles */
        * { box-sizing: border-box; }
        html, body { height: 100%; margin: 0; font-family: 'Roboto', sans-serif; background: #f8f5f0; }
        .container-fluid { height: 100%; padding: 0; }

        /* Navbar */
        .navbar { background-color: #2a9d8f; color: white; }
        .navbar a { color: white; }
        .navbar .btn { margin-right: 10px; }

        /* Jumbotron */
        .jumbotron { background: #264653; color: white; text-align: center; border-radius: 0; padding: 2rem; }

        /* Dashboard Cards */
        .card { border: none; border-radius: 8px; background: #fff; box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1); }
        .card-title a { text-decoration: none; color: #333; font-size: 1.5rem; font-weight: bold; display: block; }
        .card-title a:hover { color: #2a9d8f; }

        /* Content Alignment */
        .content { display: flex; flex-direction: column; align-items: center; justify-content: center; height: calc(100% - 56px); }
    </style>
</head>
<body>

<div class="container-fluid">
    <!-- Navbar with Home and Logout buttons -->
    <nav class="navbar navbar-expand-lg">
        <a class="navbar-brand" href="welcome.jsp">Student Dashboard</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="welcome.jsp">Home</a>
                </li>
            </ul>
            <!-- Logout Button -->
            <button class="btn btn-outline-light" onclick="showLogoutMessage()">Logout</button>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="content">
        <!-- Header -->
        <div class="jumbotron">
            <h1 class="display-4">Student Dashboard</h1>
            <p class="lead">Manage Attendance, Student Information, and Profile</p>
        </div>

        <!-- Dashboard Cards -->
        <div class="row text-center w-75">
            <div class="col-md-4 mb-3">
                <div class="card text-center p-3">
                    <h1 class="card-title"><a href="studentAttendance.html">ATTENDANCE</a></h1>
                </div>
            </div>
            <div class="col-md-4 mb-3">
                <div class="card text-center p-3">
                    <h1 class="card-title"><a href="addstudent.jsp">ADD STUDENT</a></h1>
                </div>
            </div>
            <div class="col-md-4 mb-3">
                <div class="card text-center p-3">
                    <h1 class="card-title"><a href="viewStudentrecords.jsp">VIEW STUDENT</a></h1>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal for logout confirmation -->
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
        // Get a random greeting
        const randomGreeting = greetings[Math.floor(Math.random() * greetings.length)];
        document.getElementById('greetingMessage').textContent = randomGreeting;

        // Show the modal
        const modal = new bootstrap.Modal(document.getElementById('logoutModal'));
        modal.show();
    }

    function proceedToLogout() {
        // Redirect to LogoutServlet
        window.location.href = 'LogoutServlet';
    }
</script>

</body>
</html>
