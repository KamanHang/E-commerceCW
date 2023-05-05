package controller;

import java.io.IOException;
import java.io.PrintWriter;

//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AESEncryption;
import model.CustomerDao;

public class CustomerRegistration extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public void service(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String encryptedPassword = AESEncryption.encrypt(password);
	
		
		
		System.out.println(username);
		System.out.println(email);
		System.out.println(encryptedPassword);
		

		CustomerDao cd = new CustomerDao();
		String message = cd.registerCustomer(username, email, encryptedPassword);
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
	
		if(message.equals("Successfully Added")) {
			out.println("<h1>Registration Successfully</h1>");
		}
		else {
			out.println("<h1> User already exists <a href='./view/signup.jsp'> Try Again </a></h1>");
		}
//		

		
		


	}

}
