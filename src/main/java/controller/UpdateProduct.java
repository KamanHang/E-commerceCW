package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.CustomerDao;
import model.Product;



@WebServlet("/updateProduct")
@MultipartConfig
public class UpdateProduct extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productID = request.getParameter("productID");
		String productName = request.getParameter("productName");
		String description = request.getParameter("description");
		String productPrice = request.getParameter("productPrice");
		String productCategory = request.getParameter("productCategory");
		String productImagePath = "productImage/"+productID+".png";
		
		Part image = request.getPart("productImage");
		
		Product product = new Product(productID,productImagePath,productName,description,productPrice, productCategory);
		CustomerDao sDao = new CustomerDao();
		String message =  sDao.updateProduct(product);
		
	
	
		if(message.equals("Successfully Updated")){
			System.out.println("Image.....");
			String imagePath = getServletContext().getInitParameter("imagePath");
			String fullPath = imagePath+productImagePath;
			System.out.println(fullPath);
			image.write(fullPath);
			
			request.setAttribute("status","EditSuccess");
			RequestDispatcher rd = request.getRequestDispatcher("./view/EditProduct.jsp");
			rd.forward(request, response);
			
			try {
				Thread.sleep(5000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else { 
			request.setAttribute("status","EditFailed");
			RequestDispatcher rd = request.getRequestDispatcher("./view/EditProduct.jsp");
			rd.forward(request, response);
		}
	}
}