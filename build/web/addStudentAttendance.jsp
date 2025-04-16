<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Student Record Form</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f5f5f5;
        margin: 0;
        padding: 0;
        display: flex;
        align-items: center;
        justify-content: center;
        height: 100vh;
        flex-direction: column;
    }

    h1 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
    }

    .form-container {
        background-color: #fff;
        padding: 25px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        max-width: 600px;
        width: 100%;
        box-sizing: border-box;
        height: 500px;
        overflow-y: auto;
    }

    fieldset {
        border: 1px solid #ddd;
        border-radius: 4px;
        padding: 15px;
        margin-bottom: 20px;
    }

    legend {
        font-weight: bold;
        color: #333;
        padding: 0 5px;
    }

    label {
        display: block;
        font-weight: bold;
        margin-top: 10px;
        color: #333;
    }

    input[type="text"],
    input[type="email"],
    input[type="tel"],
    input[type="number"],
    textarea,
    select {
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        border: 1px solid #ddd;
        border-radius: 4px;
        box-sizing: border-box;
        font-size: 1rem;
    }

    input[type="submit"],
    input[type="reset"],
    button {
        font-size: 1rem;
        padding: 10px 20px;
        margin-top: 15px;
        margin-right: 10px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    input[type="submit"] {
        background-color: #4CAF50;
        color: white;
    }

    input[type="reset"] {
        background-color: #f44336;
        color: white;
    }

    button {
        background-color: #2196F3;
        color: white;
        margin-top: 10px;
    }

    button:hover,
    input[type="submit"]:hover,
    input[type="reset"]:hover {
        opacity: 0.9;
    }
</style>

</head>
<body>
    <h1>ADD STUDENT ATTENDANCE RECORD</h1>
    <div class="form-container">
        <form action="AddStudentAttendanceRecordSERVLET" method="post">
            <fieldset>
                <legend>Student Attendance</legend>
                
                <label for="studentId">Student ID:</label>
<select name="studentId" required>
    <%
        String JDBC_URL = "jdbc:mysql://localhost:3306/SchoolDB";
        String JDBC_USERNAME = "root";
        String JDBC_PASSWORD = "Hariragavan001@gmail";
        ResultSet rs = null;
        ResultSet rsAttendance = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);

            // Query to fetch roll numbers that have not been recorded in student_attendance
            String query = "SELECT rollNo FROM students WHERE rollNo NOT IN (SELECT id FROM student_attendance)";
            PreparedStatement stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();

            if (!rs.isBeforeFirst()) {
                out.println("<option disabled>No students available</option>");
            }

            while (rs.next()) {
                String studentId = rs.getString("rollNo");
                out.println("<option value=\"" + studentId + "\">" + studentId + "</option>");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
        }
    %>
</select>

                
                <label for="attendancePercentage">Attendance Percentage:</label>
                <input type="number" name="attendancePercentage" min="0" max="100" required>
            </fieldset>
            
            <input type="submit" value="Submit">
            <input type="reset" value="Reset">
        </form>
    </div>
    <button onclick="window.location.href='studentAttendance.html'">Go Back</button>
</body>
</html>