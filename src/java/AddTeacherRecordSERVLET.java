import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddTeacherRecordSERVLET extends HttpServlet {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/SchoolDB";
    private static final String JDBC_USERNAME = "root"; // Replace with your MySQL username
    private static final String JDBC_PASSWORD = "Hariragavan001@gmail";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter()) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");

            String highestQualification = request.getParameter("highestQualification");
            String specialization = request.getParameter("specialization");

            String yearsExperience = request.getParameter("yearsExperience");
            String previousInstitution = request.getParameter("previousInstitution");
            String designation = request.getParameter("designation");
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection c = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
            
            String query = "INSERT INTO Faculty (name, email, phone, address, highestQualification, " +
               "specialization, yearsExperience, previousInstitution, designation) " +
               "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = c.prepareStatement(query);
            
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, address);
            ps.setString(5, highestQualification);
            ps.setString(6, specialization);
            ps.setString(7, yearsExperience);
            ps.setString(8, previousInstitution);
            ps.setString(9, designation);
            
            int rowsInserted = ps.executeUpdate();
            if (rowsInserted > 0) {
                    out.println("<script>alert('Record Added Successfully!'); location='addTeacherRecord.jsp';</script>");
                } 
            else
                out.println("<script>alert('Error! Try Again!'); location='addTeacherRecord.jsp';</script>");
            
            ps.close();
            c.close();
        }
        catch(SQLException | ClassNotFoundException e) {
            System.out.println(e.getMessage());
        }     
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}