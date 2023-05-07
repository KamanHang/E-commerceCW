
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

public class AdminLogin extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public void service(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		String email = request.getParameter("email");
	
		String password = request.getParameter("password");
		

		System.out.println(email+password);
		
	
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		CustomerDao sd = new CustomerDao();
		boolean message = sd.loginAdmin(email, password);
		HttpSession session = request.getSession();
		
		if (message) {
		      session.setAttribute("email", email);
		      response.sendRedirect("adminPanel");
		   } else {
		      
		      response.setContentType("text/html");
		  
		      request.setAttribute("status", "failed");
		      RequestDispatcher rd = request.getRequestDispatcher("./view/AdminLogin.jsp");
			  rd.forward(request, response);	
		   }
		

		
		
	
	}

}
