package servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.applicant;
import service.applicantService;


@WebServlet("/updateApplicant")
public class updateApplicant extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public updateApplicant() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        applicant existingUser = (applicant) session.getAttribute("applicant");

        if (existingUser == null) {
            response.getWriter().println("Applicant not logged in.");
            return;
        }

        
        if ("approved".equalsIgnoreCase(existingUser.getStatus())) {
            response.getWriter().println("Update not allowed: Your status is approved.");
            return;
        }

      
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String stream = request.getParameter("stream");
        String dobParam = request.getParameter("DOB");

        existingUser.setFirstName(firstName);
        existingUser.setLastName(lastName);
        existingUser.setFullName(firstName + " " + lastName);
        existingUser.setPassword(password);
        existingUser.setPhone(phone);
        existingUser.setStream(stream);

        if (dobParam != null && !dobParam.isEmpty()) {
            existingUser.setDOB(java.sql.Date.valueOf(dobParam));
        }

        applicantService service = new applicantService();
        service.updateApplicant(existingUser);

       
        session.setAttribute("applicant", existingUser);

        
        RequestDispatcher dispatcher = request.getRequestDispatcher("applicantprofile.jsp");
        dispatcher.forward(request, response);
    }
}
