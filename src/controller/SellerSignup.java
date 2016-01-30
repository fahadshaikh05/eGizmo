package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AuthDAO;

/**
 * Servlet implementation class SignupServlet
 */
@WebServlet("/SellerSignup")
public class SellerSignup extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SellerSignup() {
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

		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("cPassword");
		String companyName = request.getParameter("companyName");
		String emailAddress = request.getParameter("emailAddress");
		String phoneNumber = request.getParameter("phno");
		String url = request.getParameter("url");
		String options = request.getParameter("options");
		String notification = request.getParameter("notification");
		String account = request.getParameter("account");
		String routing = request.getParameter("routing");
		String checker = request.getParameter("check");
		String createaccount = request.getParameter("createaccount");

		String errorUN = "";	
		String errorCN = "";
		String errorOP = "";
		String errorPass = "";
		String errorCPass = "";
		String errorEID = "";
		String errorURL = "";
		String errorACC = "";
		String errorROUTING = "";
		String errorNOTI = "";
		String errorPHNO = "";
		String error = "";

		RequestDispatcher reqDis = null;
		String locate = "/sellerSignUp.jsp";		
		int userid = -1;
		
		AuthDAO connect = new AuthDAO();

		if(checker != null)	{

			if(userName.isEmpty())
				errorUN = "Username not filled in";

			else if(connect.isSellerAvailable(userName))	
				errorUN = "Username Not Available";
			else
				errorUN = "Username Available";

			request.setAttribute("errorUN", errorUN);

			reqDis = getServletContext().getRequestDispatcher(locate);
			reqDis.forward(request,response);
			return;			
		}

		if(createaccount != null)	{

			if(userName.length()==0 || companyName.length()==0 || url.length()==0 ||
					options.length()==0 || password.length()==0 || confirmPassword.length()==0 ||
					emailAddress.length()==0 || notification.length()==0  || account.length()==0 || routing.length()==0 || phoneNumber.length()==0){

				if(userName.length()==0){
					errorUN = "Username not filled in";
					request.setAttribute("errorUN", errorUN);
				}

				if(companyName.length()==0){
					errorCN = "Company Name is not filled in";
					request.setAttribute("errorCN", errorCN);

				}

				if(options.length()==0)	{
					errorOP = "Shipping Options not filled in";
					request.setAttribute("errorOP", errorOP);

				}


				if(password.length()==0)	{
					errorPass = "password not filled in";
					request.setAttribute("errorPass", errorPass);

				}

				if(confirmPassword.length()==0)	{
					errorCPass = "Confirm password not filled in";
					request.setAttribute("errorCPass", errorCPass);

				}

				if(emailAddress.length()==0)	{
					errorEID = "emailAddress not filled in";
					request.setAttribute("errorEID", errorEID);

				}

				if(url.length()==0)	{
					errorURL = "URL not filled in";
					request.setAttribute("errorURL", errorURL);

				}


				if(account.length()==0)	{
					errorACC = "Account No not filled in";
					request.setAttribute("errorACC", errorACC);

				}


				if(routing.length()==0)	{
					errorROUTING = "Routing Number not filled in";
					request.setAttribute("errorROUTING", errorROUTING);

				}

				if(notification.length()==0)	{
					errorNOTI = "Notification not filled in";
					request.setAttribute("errorNOTI", errorNOTI);

				}


				if(phoneNumber.length()==0)	{
					errorPHNO = "phoneNumber not filled in";
					request.setAttribute("errorPHNO", errorPHNO);

				}

				reqDis = getServletContext().getRequestDispatcher(locate);
				reqDis.forward(request,response);
			}
			else	{  

				if(!password.equals(confirmPassword))	{
					errorPass = "Password Does Not Match";
					request.setAttribute("errorPass", errorPass);				
					reqDis = getServletContext().getRequestDispatcher(locate);
					reqDis.forward(request,response);
				}
				else if(connect.isSellerAvailable(userName))	{
					errorUN = "Username Not Available";
					request.setAttribute("msgUserName", errorUN);
					reqDis = getServletContext().getRequestDispatcher(locate);
					reqDis.forward(request,response);
					return;
				}
			}

			userid = connect.enterNewSeller(companyName,emailAddress,phoneNumber,url,options,notification,account,routing,userName,password);
			if(userid ==1 )	{
				error = "Account Created Successfully";
				locate = "/SellerLogin.jsp";
				request.setAttribute("logout", error);

				reqDis = getServletContext().getRequestDispatcher(locate);
				reqDis.forward(request,response);
			}
			else if(userid == 0)	{
				error = "Create Account Failed, Please Try Again";
				request.setAttribute("registerStatus", error);
				reqDis = getServletContext().getRequestDispatcher(locate);
				reqDis.forward(request,response);
			}
		}

	}
}