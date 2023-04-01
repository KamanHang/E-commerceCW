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
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
	
		
		
		System.out.println(username);
		System.out.println(email);
		System.out.println(password);
		

		CustomerDao cd = new CustomerDao();
		String message = cd.registerCustomer(username, email, password);
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
	
		if(message.equals("Successfully Added")) {
			out.println("<h1>Registration Successfully</h1>");
		}
		else {
			out.println("<h1> User already exists <a href=signup.jsp> Try Again </a></h1>");
		}
//		

		
		


	}

}
