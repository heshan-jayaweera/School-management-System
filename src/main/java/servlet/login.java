package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.user;
import service.userService;

@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public login() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user usr = new user();
		
		String un = request.getParameter("uname");
		String pw = request.getParameter("pass");
		usr.setUid(un);
		usr.setPassword(pw);
		
		userService service = new userService();
		String status = service.validate(usr);
		
		if(status.equals("Admin")) {
			
			response.sendRedirect("/SIMS-KND-WD-G5/Admin/ad-index.jsp");
			
		}else if(status.equals("Manager")){
			response.sendRedirect("./login.jsp");
			
		}else if(status.equals("Teacher")){
			response.sendRedirect("./login.jsp");
			
		}else if(status.equals("Manager")){
			response.sendRedirect("./login.jsp");
			
		}else {
			response.sendRedirect("./login.jsp");
		}
		
	}

}
