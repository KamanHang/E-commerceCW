package servlet;

import java.io.IOException;
import java.io.PrintWriter;


import databases.CustomerDao;
//import java.io.PrintWriter;

//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CustomerRegistration extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public void service(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		String email = request.getParameter("email");
		String createPassword = request.getParameter("createPassword");
		String confirmPassword = request.getParameter("confirmPassword");
	
		
		System.out.println(email);
		System.out.println(createPassword);
		System.out.println(confirmPassword);
		

	CustomerDao cd = new CustomerDao();
		String message = cd.registrationCustomer(email, createPassword, confirmPassword);
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
	
		if(message.equals("Successfully Added")) {
			out.println("<h1>Registration Successfully</h1>");
		}
		else {
			out.println("<h1> User already exists <a href=CustomerRegistration.html> Try Again </a></h1>");
		}
		

		
		


	}

}
