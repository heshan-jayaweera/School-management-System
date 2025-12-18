package servlet;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.inquiry;
import service.userService;

@WebServlet("/sendNewInq")
public class sendNewInq extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public sendNewInq() {
        super();
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		inquiry inq = new inquiry();
		
		inq.setSender(request.getParameter("SenID"));
		inq.setReceiver(request.getParameter("recID"));
		inq.setTitle(request.getParameter("inqtitle"));
		inq.setMessage(request.getParameter("msg"));
		inq.setStatus("In Progress");
		
		try {
			Date dt = Date.valueOf(LocalDate.now());
			inq.setDate(dt);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		userService ser = new userService();
		ser.addInq(inq);
		
		RequestDispatcher dis = request.getRequestDispatcher("/Admin/ad-inq.jsp");
		dis.forward(request, response);
	}

}
