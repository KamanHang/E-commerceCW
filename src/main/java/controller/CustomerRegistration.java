package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.AESEncryption;
import model.Customer;
import model.CustomerDao;

@MultipartConfig
public class CustomerRegistration extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public void service(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String encryptedPassword = AESEncryption.encrypt(password);
		
		
		
		
		
		String userImagePath = "userimage/" + email + ".png";
		Part image = request.getPart("image");
		String imagePath = getServletContext().getInitParameter("imagePath");
		String finalPath = imagePath + userImagePath;
		image.write(finalPath);
		
		System.out.println(username);
		System.out.println(email);
		System.out.println(encryptedPassword);
		System.out.println(finalPath);
		
		Customer customer = new Customer(username,email,encryptedPassword,userImagePath);
		CustomerDao sd = new CustomerDao();   
		String message = sd.registerCustomer(customer);
		
		
		HttpSession session = request.getSession();
		
		
		if(message.equals("Successfully Added")) {
			session.setAttribute("email", email);
			request.setAttribute("status","registrationSuccess");
			   RequestDispatcher rd = request.getRequestDispatcher("customerProfile");
			   rd.include(request, response);
		}
		else {
			request.setAttribute("status","registrationError");
			   RequestDispatcher rd = request.getRequestDispatcher("./view/Signup.jsp");
			   rd.include(request, response);	
	
		}
//		

		
		


	}

}
