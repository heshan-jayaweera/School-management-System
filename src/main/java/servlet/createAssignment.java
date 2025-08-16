package servlet;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.addAssignment;
import service.assignmService;

@WebServlet("/createAssignment")
public class createAssignment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public createAssignment() {
        super();
      
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		addAssignment assign=new addAssignment();
		
		assign.setAssignmentID(Integer.parseInt(request.getParameter("assignmentID")));
		assign.setName(request.getParameter("Name"));
		assign.setDate(LocalDate.parse(request.getParameter("date")));
		assign.setDeadline(LocalDate.parse(request.getParameter("deadline")));
		assign.setTid(request.getParameter("tid"));
		assign.setStream(request.getParameter("Stream"));
		assign.setStatus(request.getParameter("status"));
		assign.setDocument(request.getPart("document").getInputStream().readAllBytes()); 
		
		assignmService service=new assignmService();
		service.createAssign(assign);
		
		RequestDispatcher dispatcher=request.getRequestDispatcher("/Teacher/te-assignment.jsp");
		
		dispatcher.forward(request, response);
	}

}
