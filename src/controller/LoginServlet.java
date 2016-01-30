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
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
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
		RequestDispatcher req = null;
		int adminId = 123;
		String msg=null;


		// get request parameters for user name  and password
		String username = request.getParameter("userName");
		String password = request.getParameter("password");

		if(username.length()==0 && password.length() == 0){
			out.print("<center><font color=red>Please enter Username and Password </font></center>");
			requestd = getServletContext().getRequestDispatcher("/sellerLogin.jsp");
			requestd.include(request, response);
		}
		else if (username.length()==0) {
			out.print("<center><font color=red>Please enter Username</font></center>");
			requestd = getServletContext().getRequestDispatcher("/sellerLogin.jsp");
			requestd.include(request, response);
		}
		else if (password.length()==0) {
			out.print("<center><font color=red>Please enter Password</font></center>");
			requestd = getServletContext().getRequestDispatcher("/sellerLogin.jsp");
			requestd.include(request, response);
		}
		
		// Checking if User is Admin or Seller
		if(username.equals("admin") && password.equals("admin")){
			
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
		
		// Seller Validations
		else{
			// Get data from Database  and also check for credentials
			int databaseuser = AuthDAO.checkUserPass(username, password);

			if (databaseuser == -1) {
				request.setAttribute("Invalid Credentials", msg);
				out.print("<center><font color=red>Invalid Credentials</font></center>");
				requestd = getServletContext().getRequestDispatcher("/sellerLogin.jsp");
				requestd.forward(request, response);
			}
			else{
				loggedIn = "true";
				User us = new User();
				us = AuthDAO.getUserById(databaseuser);
				String userName = us.getUserName();
				int userId=databaseuser;
				System.out.println(username+" id"+userId);
				
				session.setAttribute("loggedIn", loggedIn);
				session.setAttribute("userName",userName);
				session.setAttribute("sellerId",userId);
				requestd = getServletContext().getRequestDispatcher("/DemoSeller.jsp");
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
