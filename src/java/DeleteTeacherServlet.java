package com.yourpackage;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class DeleteTeacherServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/SchoolDB", "root", "Hariragavan001@gmail");
            PreparedStatement ps = conn.prepareStatement("DELETE FROM Faculty WHERE facultyID = ?");
            ps.setInt(1, id);
            ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        response.sendRedirect("viewTeacherRecords.jsp");
    }
}
