import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class EditTeacherServlet extends HttpServlet {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/SchoolDB";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "Hariragavan001@gmail";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        int facultyID = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String highestQualification = request.getParameter("highestQualification");
        String specialization = request.getParameter("specialization");
        int yearsExperience = Integer.parseInt(request.getParameter("yearsExperience"));
        String previousInstitution = request.getParameter("previousInstitution");
        String designation = request.getParameter("designation");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
            String query = "UPDATE Faculty SET name=?, email=?, phone=?, address=?, highestQualification=?, specialization=?, yearsExperience=?, previousInstitution=?, designation=? WHERE facultyID=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, address);
            ps.setString(5, highestQualification);
            ps.setString(6, specialization);
            ps.setInt(7, yearsExperience);
            ps.setString(8, previousInstitution);
            ps.setString(9, designation);
            ps.setInt(10, facultyID);

            int rowsUpdated = ps.executeUpdate();
            ps.close();
            conn.close();

            if (rowsUpdated > 0) {
                response.sendRedirect("viewTeacherRecords.jsp?success=Record updated successfully");
            } else {
                response.sendRedirect("viewTeacherRecords.jsp?error=Update failed");
            }
        } catch (Exception e) {
            response.sendRedirect("viewTeacherRecords.jsp?error=" + e.getMessage());
        }
    }
}
