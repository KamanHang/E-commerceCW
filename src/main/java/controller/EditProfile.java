package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Customer;
import model.CustomerDao;



@WebServlet("/editProfile")
public class EditProfile extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.getAttribute("email");
		String email = request.getParameter("email");
		Customer cu = new CustomerDao().getProductRecordByEmail(email);
		System.out.println(cu);
		request.setAttribute("customer",cu);
		RequestDispatcher rd = request.getRequestDispatcher("./view/EditProfile.jsp");
		rd.forward(request, response);
		
	}
}