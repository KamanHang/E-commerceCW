package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CustomerDao;
import model.Product;



@WebServlet("/editStudent")
public class EditProduct extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.getAttribute("email");
		String id = request.getParameter("id");
		Product pd = new CustomerDao().getProductRecordById(id);
		System.out.println(pd);
		request.setAttribute("product",pd);
		RequestDispatcher rd = request.getRequestDispatcher("./view/EditProduct.jsp");
		rd.forward(request, response);
		
	}
}