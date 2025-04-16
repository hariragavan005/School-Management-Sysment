<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Records</title>
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
        th, td {
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #2a9d8f;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <nav class="navbar navbar-expand-lg">
        <a class="navbar-brand" href="#">Student Dashboard</a>
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
        <h1>Student Records</h1>
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>Roll Number</th>
                    <th>Name</th>
                    <th>Date of Birth</th>
                    <th>Gender</th>
                    <th>Email Address</th>
                    <th>Phone Number</th>
                    <th>Address</th>
                    <th>Grade</th>
                    <th>Section</th>
                </tr>
            </thead>
            <tbody>
            <%
                String JDBC_URL = "jdbc:mysql://localhost:3306/SchoolDB";
                String JDBC_USERNAME = "root"; // Your MySQL username
                String JDBC_PASSWORD = "Hariragavan001@gmail"; // Your MySQL password

                Connection conn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
                    
                    String query = "SELECT rollNo, name, dob, gender, email, phone, address, grade, section FROM students";
                    ps = conn.prepareStatement(query);
                    rs = ps.executeQuery();

                    while (rs.next()) {
            %>
                        <tr>
                            <td><%= rs.getString("rollNo") %></td>
                            <td><%= rs.getString("name") %></td>
                            <td><%= rs.getDate("dob") %></td>
                            <td><%= rs.getString("gender") %></td>
                            <td><%= rs.getString("email") %></td>
                            <td><%= rs.getString("phone") %></td>
                            <td><%= rs.getString("address") %></td>
                            <td><%= rs.getInt("grade") %></td>
                            <td><%= rs.getString("section") %></td>
                        </tr>
            <%
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='9'>Error: " + e.getMessage() + "</td></tr>");
                } finally {
                    try { if (rs != null) rs.close(); } catch (SQLException ignore) {}
                    try { if (ps != null) ps.close(); } catch (SQLException ignore) {}
                    try { if (conn != null) conn.close(); } catch (SQLException ignore) {}
                }
            %>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
