<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Profile</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: #f8f5f0;
        }
        .navbar {
            background-color: #2a9d8f;
        }
        .navbar .navbar-brand, .navbar .nav-link, .navbar .btn {
            color: white;
        }
        .container {
            margin-top: 50px;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #264653;
            margin-bottom: 30px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th {
            background-color: #2a9d8f;
            color: white;
            padding: 10px;
            text-align: center;
        }
        td {
            padding: 8px;
            text-align: center;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .low-attendance {
            background-color: #f8d7da; /* Red */
            color: #721c24;
        }
        .good-attendance {
            background-color: #d4edda; /* Green */
            color: #155724;
        }
    </style>
</head>
<body>

<div class="container-fluid">
    <nav class="navbar navbar-expand-lg">
        <a class="navbar-brand" href="#">Teacher Dashboard</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Home</a>
                </li>
            </ul>
            <a href="/logout" class="btn btn-outline-light">Logout</a>
        </div>
    </nav>

    <div class="container">
        <h1>Student Attendance Records</h1>
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Attendance Percentage</th>
                </tr>
            </thead>
            <tbody>
            <%
                String JDBC_URL = "jdbc:mysql://localhost:3306/SchoolDB";
                String JDBC_USERNAME = "root"; 
                String JDBC_PASSWORD = "Hariragavan001@gmail";
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection c = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
                    String query = "SELECT * FROM student_attendance";
                    PreparedStatement ps = c.prepareStatement(query);
                    rs = ps.executeQuery();

                    while (rs.next()) {
                        String studentId = rs.getString("id");
                        int attendancePercentage = rs.getInt("att_per");

                        // Determine the class based on attendance
                        String rowClass = attendancePercentage < 75 ? "low-attendance" : "good-attendance";
            %>
                        <tr class="<%= rowClass %>">
                            <td><%= studentId %></td>
                            <td><%= attendancePercentage %>%</td>
                        </tr>
            <%
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='10'>Error: " + e.getMessage() + "</td></tr>");
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                }
            %>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
