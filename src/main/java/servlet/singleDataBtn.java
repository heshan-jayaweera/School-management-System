package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.applicant;

import service.applicantService;


@WebServlet("/singleDataBtn")
public class singleDataBtn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public singleDataBtn() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		applicant us =new applicant();
		us.setEmail(request.getParameter("email"));
		
		applicantService service =new applicantService();
		applicant user=service.singleDataBtn(us);
		RequestDispatcher dispatcher=request.getRequestDispatcher("applicantprofile.jsp");
		request.setAttribute("user",user);
		
		dispatcher.forward(request, response);
	}

}
