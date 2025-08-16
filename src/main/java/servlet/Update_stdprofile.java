package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.DBconnection;
import service.studentService;


@WebServlet("/updtestd")
public class Update_stdprofile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Update_stdprofile() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
        String studentId = (String) session.getAttribute("STID"); // Get Student ID from session
        String updateField = request.getParameter("updateField");
        String updatedValue = request.getParameter(updateField); // The value of the field being updated
        
        if (studentId != null && updateField != null && updatedValue != null) {
        	
        	if (studentId != null && updateField != null && updatedValue != null) {
        		
        	
                boolean updated = false;
                
                if ("password".equals(updateField)) {
                    updated = studentService.updateUserPassword(studentId, updatedValue);
                    
                    if (updated) {
                        // Optionally, you might not want to update the password in the session immediately for security reasons.
                        // The user will see the new password upon the next login.
                        System.out.println("Password updated successfully for STID: " + studentId);
                    }
                    
                } else {
                    updated = studentService.updateProfile(studentId, updateField, updatedValue);
                    
                    if (updated) {
                        session.setAttribute(updateField, updatedValue); // Update session for other fields
                        System.out.println("Profile field '" + updateField + "' updated successfully for STID: " + studentId + " (" + updateField + ")");
                    }
                }

                if (updated) {
                    //move on
                } else {
                    System.out.println("Failed to update profile field '" + updateField + "' for STID: " + studentId);
                    request.setAttribute("updateError", "Failed to update " + updateField);
                }
                
            } else {
                request.setAttribute("updateError", "Invalid update request.");
                System.out.println("Work please");
            }

        // Redirect back to the profile page to see the updated information
        response.sendRedirect(request.getContextPath() + "/Student/std-profile.jsp");
        }
	}
}
    
		

