/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/registerServlet")
public class registerServlet extends HttpServlet {
    // Change these according to your MySQL database configuration
    private static final String DB_URL = "jdbc:mysql://localhost:3306/SchoolDB";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Hariragavan001@gmail";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Retrieve form data
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        // Validate user input
        if (username == null || password == null || username.isEmpty() || password.isEmpty()) {
            out.println("<script>alert('Username and Password are required'); location='register.jsp';</script>");
            return;
        }

        Connection conn = null;
        PreparedStatement checkStmt = null;
        PreparedStatement insertStmt = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Check if the username already exists
            String checkQuery = "SELECT * FROM users WHERE username = ?";
            checkStmt = conn.prepareStatement(checkQuery);
            checkStmt.setString(1, username);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                out.println("<script>alert('Username already exists'); location='register.jsp';</script>");
            } else {
                // Insert new user into the database
                String insertQuery = "INSERT INTO users (username, password, email) VALUES (?, ?, ?)";
                insertStmt = conn.prepareStatement(insertQuery);
                insertStmt.setString(1, username);
                insertStmt.setString(2, password);
                insertStmt.setString(3, email);
                int rows = insertStmt.executeUpdate();

                if (rows > 0) {
                    out.println("<script>alert('Registration successful'); location='login.jsp';</script>");
                } else {
                    out.println("<script>alert('Registration failed'); location='register.jsp';</script>");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script>alert('An error occurred'); location='register.jsp';</script>");
        } finally {
            try {
                if (checkStmt != null) checkStmt.close();
                if (insertStmt != null) insertStmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        out.close();
    }
}
