package controller;

import model.AuthDAO;
import model.User;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class SignupServlet
 */
@WebServlet("/BuyerLoginServlet")
public class BuyerLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BuyerLoginServlet() {
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
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// Starting a session
		HttpSession session=request.getSession();
		String loggedIn = "false";
		PrintWriter out= response.getWriter();
		RequestDispatcher requestd = null;
		int adminId=123;

		// get request parameters for user name  and password

		String username = request.getParameter("userName");
		String password = request.getParameter("password");

		if(username.length()==0 && password.length() == 0){
			out.print("<center><font color=red>Please enter Username and Password </font></center>");
			requestd = getServletContext().getRequestDispatcher("/BuyerLogin.jsp");
			requestd.include(request, response);
		}
		else if (username.length()==0) {
			out.print("<center><font color=red>Please enter Username</font></center>");
			requestd = getServletContext().getRequestDispatcher("/BuyerLogin.jsp");
			requestd.include(request, response);
		}
		else if (password.length()==0) {
			out.print("<center><font color=red>Please enter Password</font></center>");
			requestd = getServletContext().getRequestDispatcher("/BuyerLogin.jsp");
			requestd.include(request, response);
		}
		
		// Checking if User is Admin or Seller
		else if(username.equals("admin") && password.equals("admin")){
				
				System.out.println("in admin main");
				loggedIn = "true";
				session.setAttribute("loggedIn", loggedIn);
				session.setAttribute("userName",username);
				
				session.setAttribute("adminId",adminId);
				requestd = getServletContext().getRequestDispatcher("/AdminHomePage.jsp");
				requestd.forward(request, response);
				
				try {
					AuthDAO.DB_Close();
				} catch (SQLException e) {
					e.printStackTrace();
				} catch (Throwable e) {
					e.printStackTrace();
				}
				
			}
		
		
		else{
			// Get data from Database  and also check for credentials
			int databaseuser = AuthDAO.checkBuyerUserPass(username, password);

			if (databaseuser == -1) {
				out.print("<center><font color=red>Invalid Credentials</font></center>");
				requestd = getServletContext().getRequestDispatcher("/BuyerLogin.jsp");
				requestd.forward(request, response);
			}
			else{
				loggedIn = "true";
				User us = new User();
				us = AuthDAO.getBuyerNameAndID(databaseuser);
				String userName = us.getUserName();
				int buyerId=us.getUserId();
				System.out.println(username);
				
				
				session.setAttribute("loggedIn", loggedIn);
				session.setAttribute("userName",userName);
				session.setAttribute("buyerId",buyerId);
				requestd = getServletContext().getRequestDispatcher("/BuyerHomePage.jsp");
				requestd.forward(request, response);
				
				try {
					AuthDAO.DB_Close();
				} catch (SQLException e) {
					e.printStackTrace();
				} catch (Throwable e) {
					e.printStackTrace();
				}
			}
		}
	}
}
