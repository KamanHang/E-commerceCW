package controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.CustomerDao;

@WebServlet("/deleteProduct")
public class DeleteProduct extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productID = request.getParameter("id");
		String productImagePath = "productImage/" + productID + ".png";
		String imagePath = getServletContext().getInitParameter("imagePath");
		String finalPath = imagePath + productImagePath;
		File imageFile = new File(finalPath);
		imageFile.delete();
		int rows = new CustomerDao().deleteProduct(productID);
		if(rows == 1) {
			response.sendRedirect("adminPanel");
		}
	}
}