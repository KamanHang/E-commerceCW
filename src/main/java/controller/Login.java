
package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CustomerDao;

public class Login extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public void service(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		String email = request.getParameter("email");
	
		String password = request.getParameter("password");
		

		System.out.println(email+password);
		
	
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		CustomerDao sd = new CustomerDao();
		boolean message = sd.loginCustomer(email, password);
		
		if (message) {
			
			  HttpSession session = request.getSession();
		      request.setAttribute("email", email);
		      session.setMaxInactiveInterval(5*60);
		      session.setAttribute("email", email);
		      
		      RequestDispatcher rd = request.getRequestDispatcher("./view/CustomerProfile.jsp");
		      rd.forward(request, response);
		   } else {
		      
		      response.setContentType("text/html");
		  
		      out.println("<h1>Error Please <a href=Login.jsp>Try Again</a></h1>");
		   }
		

		
		
	
	}

}
