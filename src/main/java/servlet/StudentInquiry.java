package servlet;

import model.inquiry;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.studentService;

@WebServlet("/stinq")
public class StudentInquiry extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public StudentInquiry() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		   HttpSession session = request.getSession();
	        String studentId = (String) session.getAttribute("STID");

	        if (studentId != null) {
	            String title = request.getParameter("title");
	            String message = request.getParameter("message");
	            String receiver = request.getParameter("to");
	            String dateParam = request.getParameter("date");

	            try {
	                Date inquiryDate = Date.valueOf(dateParam); // Convert String to SQL Date
	                
	                inquiry inquiry = new inquiry(title, message, studentId, receiver, "Pending",inquiryDate);

	                boolean submitted = false;
					try {
						submitted = studentService.submitInquiry(inquiry);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

	                if (submitted) {
	                	
	                    System.out.println("Inquiry submitted successfully by STID: " + studentId);
	                    request.setAttribute("successMessage", "Inquiry submitted successfully!");
	                    
	                } else {
	                    System.out.println("Failed to submit inquiry by STID: " + studentId);
	                    request.setAttribute("error", "Failed to submit inquiry. Please try again.");
	                }

	            } catch (IllegalArgumentException e) {
	                request.setAttribute("error", "Invalid date format.");
	                e.printStackTrace();
	            }

	        } else {
	            request.setAttribute("error", "You must be logged in to submit an inquiry.");
	        }

	        request.getRequestDispatcher("/Student/std-inq.jsp").forward(request, response);
	    }
		

}
