
package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.AESEncryption;
import model.CustomerDao;

public class Login extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public void service(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		String email = request.getParameter("email");
	
		String password = request.getParameter("password");
		String encryptedPassword = AESEncryption.encrypt(password);
		

		System.out.println(email+password);
		
	
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		CustomerDao sd = new CustomerDao();
		boolean message = sd.loginCustomer(email, encryptedPassword);
		
		HttpSession session = request.getSession();
		
		if (message) {
				session.setAttribute("email", email);
				request.setAttribute("statusLogin","LoginSuccess");
			    RequestDispatcher rd = request.getRequestDispatcher("/homePage");
			    rd.include(request, response);
		   } else {
			   request.setAttribute("status","loginError");
			   RequestDispatcher rd = request.getRequestDispatcher("./view/Login.jsp");
			   rd.include(request, response);	
		   }
		

		
		
	
	}

}
