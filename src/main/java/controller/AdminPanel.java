package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CustomerDao;
import model.Product;

@WebServlet("/adminPanel")
public class AdminPanel extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//creating new object of CustomerDao Class
		CustomerDao sdao = new CustomerDao();
		//fetching arraylist from fetchStudentRecord function
		
		HttpSession session = request.getSession();
		session.getAttribute("email");
		request.setAttribute("status", "Login Success");
		ArrayList<Product> productList =  sdao.fetchProductDetails();
		request.setAttribute("pdList",productList);
		System.out.println(productList);
		RequestDispatcher rd = request.getRequestDispatcher("view/AdminPanel.jsp");
		rd.forward(request, response);
	}
}