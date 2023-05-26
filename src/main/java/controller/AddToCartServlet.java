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

@WebServlet("/addtocart")
public class AddToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");

        if (email == null) { 
            //User is not logged in, redirect to login page
            response.sendRedirect("view/Login.jsp");
        }else {
        	
        	//session.getAttribute("email");
    		String id = request.getParameter("id");
    		Product pd = new CustomerDao().getProductRecordById(id);
    		System.out.println(pd);
    		request.setAttribute("product",pd);
    		RequestDispatcher rd = request.getRequestDispatcher("./view/AddToCart.jsp");
    		rd.forward(request, response);
        }
 
		
		
    }
}