package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.AESEncryption;
import model.Customer;
import model.CustomerDao;
import model.Product;

@WebServlet("/addProduct")
@MultipartConfig
public class AddProduct extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public void service(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		String productID = request.getParameter("productID");
		String productName = request.getParameter("productName");
		String productBrand = request.getParameter("productBrand");
		String productDescription = request.getParameter("description");
		String productRating = request.getParameter("productRating");
		String productPrice = request.getParameter("productPrice");
		String productCategory = request.getParameter("productCategory");
	
		
		
		
		
		String productImagePath = "productImage/" + productID + ".png";
		Part image = request.getPart("productImage");
		String imagePath = getServletContext().getInitParameter("imagePath");
		String finalPath = imagePath + productImagePath;
		
		
		System.out.println(productID);
		System.out.println(productName);
		System.out.println(productBrand);
		System.out.println(productDescription);
		System.out.println(productPrice);
		System.out.println(productRating);
		System.out.println(productImagePath);
		System.out.println(finalPath);
		
		Product product = new Product(productID,productImagePath,productName,productBrand,productDescription,productRating, productPrice, productCategory );
		CustomerDao sd = new CustomerDao();   
		String message = sd.addProduct(product);
		
		
		HttpSession session = request.getSession();
		session.getAttribute("email");
		
		if(message.equals("Successfully Added")) {
			
			
			 image.write(finalPath);
			 request.setAttribute("status", "success");
			 RequestDispatcher rd = request.getRequestDispatcher("./view/AddProduct.jsp");
			 rd.forward(request, response);	
		}
		else {
			 request.setAttribute("status", "failed");
			 RequestDispatcher rd = request.getRequestDispatcher("./view/AddProduct.jsp");
			 rd.forward(request, response);	
	
		}
//		

		
		


	}

}
