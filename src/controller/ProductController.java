package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.channels.SeekableByteChannel;
import java.util.Locale.Category;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import model.AuthDAO;

/**
 * Servlet implementation class ProductController
 */
@WebServlet("/ProductController")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductController() {
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

		// Starting a session
		HttpSession session=request.getSession();
		PrintWriter out= response.getWriter();
		RequestDispatcher rd = null;
		String msg = null;

		// Getting form Parameters username,password,first last name and confirm pass
		String userName = request.getParameter("userName");

		String name = request.getParameter("name");
		float cost = Float.parseFloat(request.getParameter("cost"));
		float shippingCost = Float.parseFloat(request.getParameter("shippingCost"));
		String imagePath = request.getParameter("imagePath");
		String category = request.getParameter("category");
		int qty = Integer.parseInt(request.getParameter("qty"));
		String description = request.getParameter("description");

		int insertion;
		try {
			insertion = AuthDAO.enterNewProduct(userName,name, cost, shippingCost, imagePath,category,qty,description);

			// Get type of action form
			if (insertion == 0) {

				msg = "Product Added Successfully !!!";
				out.print(msg);
				System.out.println(msg);

				out.print("<center><font color=red>"+msg+"</font></center>");
				rd = getServletContext().getRequestDispatcher("/viewProduct.jsp");
				rd.forward(request, response);
			}
			else {
				out.print(msg);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}



	}
}
