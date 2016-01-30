package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AuthDAO;
import model.Product;

/**
 * Servlet implementation class UpdateController
 */
@WebServlet("/UpdateController")
public class UpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		RequestDispatcher rd = null;
		
		int productId = Integer.parseInt(request.getParameter("productId"));
		
		Product p = new Product();
		p = AuthDAO.getProductById(productId);
		
		if(p!=null)
		{
		// Getting form Parameters
			String name = p.getName();
			float cost = p.getCost();
			float shippingCost = p.getShippingCost();
			String imagePath = p.getImagePath();
			String category = p.getCategory();
			int qty = p.getQuantity();
			String description = p.getCategory();
			
			request.setAttribute("name",name);
			request.setAttribute("cost",cost);
			request.setAttribute("shippingCost",shippingCost);
			request.setAttribute("imagePath",imagePath);
			request.setAttribute("category",category);
			request.setAttribute("qty",qty);
			request.setAttribute("description",description);
			
			
			rd = getServletContext().getRequestDispatcher("/editProduct.jsp");
			rd.forward(request, response);
			
		System.out.println(productId);

		
		}else
		{
			out.print("Product not found");
		}
	}
}
