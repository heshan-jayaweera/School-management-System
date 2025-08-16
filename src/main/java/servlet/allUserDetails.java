package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.user;
import service.userService;


@WebServlet("/allUserDetails")
public class allUserDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public allUserDetails() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		userService service = new userService();
		ArrayList<user> user =service.getAllUsers();
		request.setAttribute("user",user);
		
	/*	response.sendRedirect(request.getContextPath() + "/Admin/ad-users.jsp"); */
		RequestDispatcher dispatcher = request.getRequestDispatcher("/Admin/ad-users.jsp");
		dispatcher.forward(request, response); 
		
	}

}
