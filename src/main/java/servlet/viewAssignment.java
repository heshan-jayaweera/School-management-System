package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.assignmentService;
import model.assignment;



@WebServlet("/viewallassignments")
public class viewAssignment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public viewAssignment() {
        super();

    }

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        assignmentService service = new assignmentService();
        

        ArrayList<assignment> assignments = service.getAllAssignments();
        request.setAttribute("assignments", assignments);
        
        // Forward the request to the JSP page for displaying the assignments
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Student/std-assignment.jsp");
        dispatcher.forward(request, response); 
            }
        
    }



