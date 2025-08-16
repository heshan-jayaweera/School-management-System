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


@WebServlet("/updtUser")
public class updtUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public updtUser() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		user usr = new user();
		
		usr.setUid(request.getParameter("uid"));
		usr.setName(request.getParameter("uname"));
		usr.setEmail(request.getParameter("uemail"));
		usr.setPassword(request.getParameter("pass"));
		usr.setType(request.getParameter("utype"));
		usr.setPhone(request.getParameter("phone"));
		
		userService service = new userService();
		service.updtUD(usr);
		
		RequestDispatcher dis = request.getRequestDispatcher("/Admin/ad-users.jsp");
		dis.forward(request, response);
	}

}
