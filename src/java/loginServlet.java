import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "loginServlet", urlPatterns = {"/loginServlet"})
public class loginServlet extends HttpServlet {

    // Update these with your MySQL database configuration
    private static final String DB_URL = "jdbc:mysql://localhost:3306/SchoolDB?useSSL=false&serverTimezone=UTC";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Hariragavan001@gmail";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Retrieve form data from login.jsp
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Database connection and query
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Load the MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection to the database
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Prepare SQL query to check if user exists with given credentials
            String query = "SELECT * FROM users WHERE username = ? AND password = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                // Successful login, set session and redirect to welcome.jsp
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                response.sendRedirect("welcome.jsp");
            } else {
                // Failed login, alert user and redirect back to login.jsp
                out.println("<script type='text/javascript'>");
                out.println("alert('Invalid username or password');");
                out.println("location='login.jsp';");
                out.println("</script>");
            }

        } catch (Exception e) {
            e.printStackTrace(out);
            out.println("<script type='text/javascript'>");
            out.println("alert('An error occurred while processing your request.');");
            out.println("location='login.jsp';");
            out.println("</script>");
        } finally {
            // Close all connections
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        out.close();
    }
}
