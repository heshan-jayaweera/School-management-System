package servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.applicant;

import service.applicantService;


@WebServlet("/applicantlogin")
public class applicantlogin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public applicantlogin() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("applicantprofile.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        applicant us = new applicant();
        us.setEmail(request.getParameter("email"));
        us.setPassword(request.getParameter("password"));

        applicantService service = new applicantService();
        boolean status = service.validate(us);

        if (status) {
            applicant loginedUs = service.getOne(us);

            
            HttpSession session = request.getSession();
            session.setAttribute("applicant", loginedUs);

            
            session.setAttribute("email", loginedUs.getEmail());

           
            RequestDispatcher dispatcher = request.getRequestDispatcher("applicantprofile.jsp");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Invalid email or password. Please try again.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("applicantlogin.jsp");
            dispatcher.forward(request, response);
        }
    }
}
