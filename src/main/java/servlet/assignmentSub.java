package servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDate;
import model.Submission;
import service.SubmitAssignment;

@WebServlet("/assignsub")
public class assignmentSub extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public assignmentSub() {
        super();
       
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {		    
		String assignmentIdStr = request.getParameter("assignmentId"); // Get 'assignmentId' from the form data
		System.out.println("Value of assignmentIdStr: [" + assignmentIdStr + "]"); // Debug output

	    int assignmentId;

	    if (assignmentIdStr != null && !assignmentIdStr.isEmpty()) {
	        try {
	        	
	            assignmentId = Integer.parseInt(assignmentIdStr);
	            System.out.println("Received assignmentId: " + request.getParameter("assignmentId")); 
	            
	            String submissionDateStr = request.getParameter("submissionDate");
                Part filePart = request.getPart("document");

	            byte[] documentBytes = null;
                if (filePart != null && filePart.getSize() > 0) {
                    try (InputStream inputStream = filePart.getInputStream()) {
                        documentBytes = inputStream.readAllBytes();
                    }
                }
	    		
	    		Submission sub = new Submission();
	    		sub.setAssignmentId(assignmentId);
	    		sub.setStudentId(null);
	    		sub.setDocument(documentBytes);
	    		sub.setStatus("done");
	    		if (submissionDateStr != null && !submissionDateStr.isEmpty()) {
                    sub.setSubmissionDate(LocalDate.parse(submissionDateStr));
                } else {
                    // Handle the case where submissionDate is not provided
                    response.getWriter().println("Submission Date was not provided.");
                    return;
                }
	    		sub.setMarks("0");
	    		
	    		
	    		SubmitAssignment subservice = new SubmitAssignment();
	    		try {
	    			subservice.submitassignment(sub);
	    		} catch (ClassNotFoundException e) {
	    			e.printStackTrace();
	    		}
	    		
	    		RequestDispatcher dispatcher =  request.getRequestDispatcher("/Student/std-assignment.jsp");
	    		dispatcher.forward(request, response);
	            // Now you have the assignmentId from the form data
	            // Continue with the rest of your submission logic...

	        } catch (NumberFormatException e) {
	            response.getWriter().println("Invalid Assignment ID submitted.");
	            return;
	        }
	        catch (Exception e) {
                e.printStackTrace(); // Log the specific parsing error
                response.getWriter().println("Error parsing submission date: " + e.getMessage());
                return;
            }
	    } else {
	        response.getWriter().println("Assignment ID was not submitted with the form.");
	        return;
	    }

		}catch(Exception e){
			e.printStackTrace(); // Log the full error
	        response.getWriter().println("An unexpected error occurred: " + e.getMessage());
	        return;
		}
	    
        

	}

}
