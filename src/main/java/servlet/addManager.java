package servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.manager;
import service.AdminCRUDs;


@WebServlet("/addManager")
public class addManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public addManager() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		manager mg = new manager();
		
		mg.setMgID(request.getParameter("mid"));
		mg.setFullName(request.getParameter("flname"));
		mg.setUserName(request.getParameter("muname"));
		mg.setEmail(request.getParameter("memail"));
		mg.setPhone(request.getParameter("phone"));
		mg.setLocation(request.getParameter("maddress"));
		mg.setMgStat(request.getParameter("mgstat"));
		mg.setType(request.getParameter("mtype"));
		
		try {
			
			String dobStr = request.getParameter("mdob");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date dob = sdf.parse(dobStr);
			mg.setDOB(dob);
			
			String since = request.getParameter("msince");
			Date sdate = sdf.parse(since);
			mg.setStDate(sdate);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		AdminCRUDs service = new AdminCRUDs();
		service.addnewManager(mg);
		
		RequestDispatcher dis = request.getRequestDispatcher("/Admin/ad-users-student.jsp");
		dis.forward(request, response);
	}

}
