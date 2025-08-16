package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Student;
import service.LoginStudent;


@WebServlet("/Login_stu")
public class Login_stu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Login_stu() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Student s = new Student();
		String studentId = request.getParameter("STID");
	    String password = request.getParameter("password");
		
	    s.setSTID(studentId);
	    s.setPassword(password);
	    
		LoginStudent stlg = new LoginStudent();
		Student stu = stlg.validate(s);
		//System.out.println(stu.getSTID());
		//System.out.println("1");
		/*System.out.println(studentId);
		System.out.println(password);
		System.out.println(stu.getSTID());
		*/
	    if (stu != null) {
	        HttpSession session = request.getSession();
	        session.setAttribute("STID", stu.getSTID());
	        session.setAttribute("fullName", stu.getFullName());
	        session.setAttribute("userName", stu.getUserName());
	        session.setAttribute("email", stu.getEmail());
	        session.setAttribute("password", stu.getPassword());
	        session.setAttribute("stream", stu.getStream());
	        session.setAttribute("stclass", stu.getStclass());
	        session.setAttribute("cstatus", stu.getCstatus());
	        session.setAttribute("phone", stu.getPhone());
	        session.setAttribute("address", stu.getAddress());
	        /*System.out.println("Stream");
	        System.out.println(stu.getPassword());
	        System.out.println(stu.getStream());
	        */

	        response.sendRedirect(request.getContextPath() + "/Student/std-dashboard.jsp");
	    }else {
			request.setAttribute("loginError", "Invalid Email or Password");
			RequestDispatcher dispatcher=request.getRequestDispatcher("/Student/std-login.jsp");
			dispatcher.forward(request, response);
		}
		
		
	}

}
