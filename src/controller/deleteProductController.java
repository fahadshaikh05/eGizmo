package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import model.AuthDAO;
import model.Product;

/**
 * Servlet implementation class UpdateProductController
 */
@WebServlet("/deleteProductController")
public class deleteProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public deleteProductController() {
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
		// TODO Auto-generated method stub

		// Starting a session
		HttpSession session=request.getSession();
		PrintWriter out = response.getWriter();
		String msg = null;
		RequestDispatcher rd = null;

		int productId =  Integer.parseInt(request.getParameter("productId"));
		System.out.println("delete "+productId);

		int i;
		try {
			i = AuthDAO.deleteProductById(productId);

			if(i>0)
			{
				// Getting form Parameters
				msg = "deleted";
				session.setAttribute("msg",msg);
					rd = getServletContext().getRequestDispatcher("/DemoSeller.jsp");
				
				rd.forward(request, response);

			}else
			{
				out.print("Product ID not found");
					rd = getServletContext().getRequestDispatcher("/DemoSeller.jsp");
				
				rd.forward(request, response);
			}


		} catch (Exception e) {
			e.printStackTrace();
		}


	}

}
