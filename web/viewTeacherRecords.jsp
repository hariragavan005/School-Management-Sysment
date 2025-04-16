<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher Records</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" crossorigin="anonymous">
    <style>
        body { background: #f8f5f0; padding: 20px; }
        .navbar { background-color: #2a9d8f; }
        .container { margin-top: 30px; background: #fff; padding: 20px; border-radius: 8px; }
        .table-responsive { display: flex; justify-content: center; }
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 10px; text-align: center; border: 1px solid #ddd; }
        .action-buttons { display: flex; gap: 10px; }
        .btn-edit { background-color: #e9c46a; color: white; border: none; padding: 5px 10px; }
        .btn-save { background-color: #2a9d8f; color: white; border: none; padding: 5px 10px; }
        .btn-delete { background-color: #e63946; color: white; border: none; padding: 5px 10px; }
    </style>
</head>
<body>
<div class="container">
    <h1>Teacher Records</h1>
    <div class="table-responsive">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th><th>Name</th><th>Email</th><th>Phone</th><th>Address</th><th>Qualification</th><th>Specialization</th><th>Experience</th><th>Institution</th><th>Designation</th><th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    String JDBC_URL = "jdbc:mysql://localhost:3306/SchoolDB";
                    String JDBC_USERNAME = "root";
                    String JDBC_PASSWORD = "Hariragavan001@gmail";
                    Connection c = null;
                    PreparedStatement ps = null;
                    ResultSet rs = null;
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        c = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
                        ps = c.prepareStatement("SELECT * FROM Faculty");
                        rs = ps.executeQuery();
                        while (rs.next()) {
                            int id = rs.getInt("facultyID");
                %>
                            <form action="EditTeacherServlet" method="post">
                                <tr>
                                    <td><%= id %></td>
                                    <td><input type="text" name="name" value="<%= rs.getString("name") %>"></td>
                                    <td><input type="email" name="email" value="<%= rs.getString("email") %>"></td>
                                    <td><input type="text" name="phone" value="<%= rs.getString("phone") %>"></td>
                                    <td><input type="text" name="address" value="<%= rs.getString("address") %>"></td>
                                    <td><input type="text" name="highestQualification" value="<%= rs.getString("highestQualification") %>"></td>
                                    <td><input type="text" name="specialization" value="<%= rs.getString("specialization") %>"></td>
                                    <td><input type="number" name="yearsExperience" value="<%= rs.getInt("yearsExperience") %>"></td>
                                    <td><input type="text" name="previousInstitution" value="<%= rs.getString("previousInstitution") %>"></td>
                                    <td><input type="text" name="designation" value="<%= rs.getString("designation") %>"></td>
                                    <td class="action-buttons">
                                        <input type="hidden" name="id" value="<%= id %>">
                                        <button type="submit" class="btn-save">Save</button>
                                    </td>
                                </tr>
                            </form>
                            <form action="DeleteTeacherServlet" method="post">
                                <tr>
                                    <td colspan="10"></td>
                                    <td class="action-buttons">
                                        <input type="hidden" name="id" value="<%= id %>">
                                        <button type="submit" class="btn-delete">Delete</button>
                                    </td>
                                </tr>
                            </form>
                <%
                        }
                    } catch (Exception e) {
                        out.println("<tr><td colspan='11'>Error: " + e.getMessage() + "</td></tr>");
                    } finally {
                        if (rs != null) rs.close();
                        if (ps != null) ps.close();
                        if (c != null) c.close();
                    }
                %>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
