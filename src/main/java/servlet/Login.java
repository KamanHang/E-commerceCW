
package servlet;

import java.io.IOException;
import java.io.PrintWriter;


import databases.StudentDao;
//import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginStudent extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public void service(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		String id = request.getParameter("id");
	
		String password = request.getParameter("password");
		

		System.out.println(id+password);
		
	
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		StudentDao sd = new StudentDao();
		boolean message = sd.loginStudent(id, password);
		
		if (message) {
			
			  HttpSession session = request.getSession();
		      request.setAttribute("id", id);
		      session.setMaxInactiveInterval(5*60);
		      session.setAttribute("id", id);
		      
		      RequestDispatcher rd = request.getRequestDispatcher("StudentProfile.jsp");
		      rd.forward(request, response);
		   } else {
		      
		      response.setContentType("text/html");
		  
		      out.println("<h1>Error Please <a href=login.jsp>Try Again</a></h1>");
		   }
		

		
		
	
	}

}
