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

import model.Customer;
import model.CustomerDao;


@WebServlet("/updateProfile")
@MultipartConfig
public class UpdateProfile extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String phoneNumber = request.getParameter("phoneNumber");
		String address = request.getParameter("address");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String userImagePath = "userimage/"+email+".png";
		
		Part image = request.getPart("image");
		
		Customer customer = new Customer(username, email, phoneNumber, address, password, userImagePath);
		CustomerDao sDao = new CustomerDao();
		String message =  sDao.updateCustomerProfile(customer);
		
		System.out.println(username);
		System.out.println(phoneNumber);
		System.out.println(address);
		System.out.println(password);
		System.out.println(email);
		System.out.println(userImagePath);
		
	
		System.out.println(message + "lol");
		if(message.equals("Successfully Updated")){
			System.out.println("Image.....");
			String imagePath = getServletContext().getInitParameter("imagePath");
			String fullPath = imagePath+userImagePath;
			System.out.println(fullPath);
			image.write(fullPath);
			
			request.setAttribute("status","EditSuccess");
			RequestDispatcher rd = request.getRequestDispatcher("./view/EditProfile.jsp");
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
			RequestDispatcher rd = request.getRequestDispatcher("./view/EditProfile.jsp");
			rd.forward(request, response);
		}
	}
}