package servlet;

import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.applicant;
import service.applicantService;


@WebServlet("/addApplicant")
@MultipartConfig
public class addApplicant extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public addApplicant() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		applicant us = new applicant();

		// Set updated fields
		us.setFirstName(request.getParameter("firstName"));
		us.setLastName(request.getParameter("lastName"));

		String fullName = us.getFirstName() + " " + us.getLastName();
		us.setFullName(fullName);

		us.setEmail(request.getParameter("email"));
		us.setPassword(request.getParameter("password"));
		us.setPhone(request.getParameter("phone"));
		us.setStream(request.getParameter("stream"));
		us.setStatus("pending"); 

		
		try {
			String dobStr = request.getParameter("DOB");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date dob = sdf.parse(dobStr);
			us.setDOB(dob);
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Invalid Date Format");
			return;
		}

		
		try {
			Part filePart = request.getPart("document");
			if (filePart != null && filePart.getSize() > 0) {
				InputStream fileContent = filePart.getInputStream();
				byte[] documentBytes = fileContent.readAllBytes();
				us.setDocument(documentBytes);
			} else {
				System.out.println("No document uploaded.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("File upload error.");
			return;
		}

		
		applicantService service = new applicantService();
		service.regApplicant(us);

		
		RequestDispatcher dispatcher = request.getRequestDispatcher("ls-index.jsp");
		dispatcher.forward(request, response);
	}
}
