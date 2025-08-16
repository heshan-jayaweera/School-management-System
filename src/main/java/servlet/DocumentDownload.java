package servlet;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import controller.DBconnection;

@WebServlet("/downloadAssignment")
public class DocumentDownload extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Process the download request
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the assignment ID from the URL parameters
        String assignmentID = request.getParameter("assignmentID");

        // Prepare SQL query to fetch document for the given assignment ID
        String query = "SELECT document, Name FROM assignment WHERE assignmentID = ?";
        
        try (Connection con = DBconnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(query)) {
            
            // Set the assignment ID parameter
            stmt.setInt(1, Integer.parseInt(assignmentID));
            ResultSet rs = stmt.executeQuery();

            // Check if document exists
            if (rs.next()) {
                // Get the document byte array
                byte[] documentBytes = rs.getBytes("document");
                String fileName = rs.getString("Name") + ".pdf"; // You can use file extension or fetch from DB
                
                // Set the response content type (e.g., PDF)
                response.setContentType("application/pdf");
                response.setContentLength(documentBytes.length);
                response.setHeader("Content-Disposition", "attachment; filename=" + fileName);
                
                // Write the document bytes to the output stream
                try (OutputStream os = response.getOutputStream()) {
                    os.write(documentBytes);
                    os.flush();
                }
            } else {
                response.getWriter().write("Assignment document not found.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error occurred while downloading the document.");
        }
    }
}
