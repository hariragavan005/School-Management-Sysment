import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AddStudentAttendanceRecordSERVLET extends HttpServlet {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/SchoolDB";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "Hariragavan001@gmail";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            String id = request.getParameter("studentId");
            String att_perc = request.getParameter("attendancePercentage");

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);

            // Check if attendance for the given studentId already exists
            String checkQuery = "SELECT * FROM student_attendance WHERE id = ?";
            PreparedStatement checkStmt = conn.prepareStatement(checkQuery);
            checkStmt.setString(1, id);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                // Attendance already entered
                out.println("<script>alert('Attendance already entered for this student!'); location='addStudentAttendance.jsp';</script>");
            } else {
                // Insert the new attendance record
                String insertQuery = "INSERT INTO student_attendance (id, att_per) VALUES (?, ?)";
                PreparedStatement ps = conn.prepareStatement(insertQuery);
                ps.setString(1, id);
                ps.setString(2, att_perc);

                int rowsInserted = ps.executeUpdate();
                if (rowsInserted > 0) {
                    out.println("<script>alert('Record Added Successfully!'); location='addStudentAttendance.jsp';</script>");
                } else {
                    out.println("<script>alert('Error! Try Again!'); location='addStudentAttendance.jsp';</script>");
                }

                ps.close();
            }
            checkStmt.close();
            conn.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
