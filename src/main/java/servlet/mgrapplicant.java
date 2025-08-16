package servlet;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.applicant;
import service.applicantService;
;

@WebServlet("/mgrapplicant")
public class mgrapplicant extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public mgrapplicant() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");

        try {
            applicantService appService = new applicantService();

            
            String action = request.getParameter("action");
            String email = request.getParameter("email");

            if ("approve".equals(action) && email != null) {
                
                boolean success = appService.approveApplicant(email);

                
                if (success) {
                    request.setAttribute("message", "Applicant approved successfully.");
                } else {
                    request.setAttribute("error", "Failed to approve the applicant. Please try again.");
                }
            }

            
            ArrayList<applicant> applicantList = appService.getAllApplicants();
            request.setAttribute("applicant", applicantList);

            
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Manager/mg-app.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing the request. Please try again later.");
        }
    }
}
