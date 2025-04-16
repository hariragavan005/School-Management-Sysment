/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AddStudentServlet")
public class AddStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database configuration
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/SchoolDB";
    private static final String JDBC_USERNAME = "root"; // Replace with your MySQL username
    private static final String JDBC_PASSWORD = "Hariragavan001@gmail"; // Replace with your MySQL password

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set response content type
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Get form data
        String rollNo = request.getParameter("rollNo");
        String name = request.getParameter("lastName");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String grade = request.getParameter("grade");
        String section = request.getParameter("section"); 

        // Database insertion logic
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);

            String sql = "INSERT INTO students (rollNo, name, dob, gender, email, phone, address, grade, section) "
                       + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, rollNo);
            stmt.setString(2, name);
            stmt.setString(3, dob);
            stmt.setString(4, gender);
            stmt.setString(5, email);
            stmt.setString(6, phone);
            stmt.setString(7, address);
            stmt.setString(8, grade);
            stmt.setString(9, section);

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                // Redirect to success page
                out.println("<script>alert('Record Added Successfully!'); location='addstudent.jsp';</script>");
                //response.sendRedirect("succaddstudent.jsp");
            } else {
                out.println("<h3 style='color:red'>Failed to register the student.</h3>");
            }

            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3 style='color:red'>Error: " + e.getMessage() + "</h3>");
        }
    }
}
