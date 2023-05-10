
package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CustomerDao;
import model.Product;
@WebServlet("/searchQuery")
public class SearchQuery extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public void service(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		String search = request.getParameter("name");
	
		

		System.out.println(search);
		
		CustomerDao sdao = new CustomerDao();
		ArrayList<Product> productList =  sdao.fetchQueryProduct(search);
		request.setAttribute("pdList",productList);
		System.out.println(productList);
		RequestDispatcher rd = request.getRequestDispatcher("view/HomePage.jsp");
		rd.forward(request, response);
		

		
		
	
	}

}
