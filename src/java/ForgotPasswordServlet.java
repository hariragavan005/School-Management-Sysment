import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ForgotPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String email = request.getParameter("email");

        // Database credentials
        String dbURL = "jdbc:mysql://localhost:3306/SchoolDB";
        String dbUser = "root"; // change as per your MySQL username
        String dbPass = "password"; // change as per your MySQL password

        try {
            // Establishing database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            // SQL query to retrieve password
            String query = "SELECT password FROM users WHERE email = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String password = rs.getString("password");
                out.println("<html><body>");
                out.println("<h2>Password Retrieved Successfully</h2>");
                out.println("<p>Your password is: <b>" + password + "</b></p>");
                out.println("<a href='login.jsp'>Go to Login</a>");
                out.println("</body></html>");
            } else {
                out.println("<html><body>");
                out.println("<h2>Email not found</h2>");
                out.println("<a href='forgotpassword.jsp'>Try Again</a>");
                out.println("</body></html>");
            }

            // Close resources
            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<html><body><h3>Error: " + e.getMessage() + "</h3></body></html>");
        }
    }
}
