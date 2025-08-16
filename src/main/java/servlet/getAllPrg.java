package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.program;
import service.userService;


@WebServlet("/getAllPrg")
public class getAllPrg extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public getAllPrg() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		userService us = new userService();
		ArrayList<program> allPrgs = us.getAllPrograms();
		request.setAttribute("allPrgs", allPrgs);
		
		RequestDispatcher dis = request.getRequestDispatcher("/Admin/ad-prg.jsp");
		dis.forward(request, response);
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
