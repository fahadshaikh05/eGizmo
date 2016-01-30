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
@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SignupServlet() {
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
		String firstName = request.getParameter("firstname");
		String middleName = request.getParameter("middlename");
		String lastName = request.getParameter("lastname");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("cPassword");
		String emailAddress = request.getParameter("emailAddress");
		String streetAddress = request.getParameter("address");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String pincode= request.getParameter("pincode");
		String phoneNumber = request.getParameter("phno");
		String checker = request.getParameter("check");
		String createaccount = request.getParameter("createaccount");

		String errorUN = "";	
		String errorFN = "";
		String errorLN = "";
		String errorMN = "";
		String errorPass = "";
		String errorCPass = "";
		String errorEID = "";
		String errorADD = "";
		String errorCITY = "";
		String errorSTATE = "";
		String errorPIN = "";
		String errorPHNO = "";
		String error = "";

		RequestDispatcher reqDis = null;
		String locate = "/signup.jsp";		
		int userid = -1;

		AuthDAO connect = new AuthDAO();


		if(checker != null)	{

			if(userName.isEmpty())
				errorUN = "Username not filled in";

			else if(connect.isUserNameAvailable(userName))	
				errorUN = "Username Not Available";
			else
				errorUN = "Username Available";

			request.setAttribute("errorUN", errorUN);

			reqDis = getServletContext().getRequestDispatcher(locate);
			reqDis.forward(request,response);
			return;			
		}


		if(createaccount != null)	{

			if(userName.length()==0 || firstName.length()==0 || middleName.length()==0 ||
					lastName.length()==0 || password.length()==0 || confirmPassword.length()==0 ||
					emailAddress.length()==0 || streetAddress.length()==0  || city.length()==0 || state.length()==0 || pincode.length()==0 | phoneNumber.length()==0){

				if(userName.length()==0){
					errorUN = "Username not filled in";
					request.setAttribute("errorUN", errorUN);
				}

				if(firstName.length()==0){
					errorFN = "FirstName is not filled in";
					request.setAttribute("errorFN", errorFN);

				}

				if(lastName.length()==0)	{
					errorLN = "Last Name not filled in";
					request.setAttribute("errorLN", errorLN);

				}
				
				if(middleName.length()==0){
					errorMN="Middle Name not filled in";
					request.setAttribute("errorMN", errorMN);
				}

				if(middleName.length()==0)	{
					errorLN = "Last Name not filled in";
					request.setAttribute("errorLN", errorLN);

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

				if(streetAddress.length()==0)	{
					errorADD = "streetAddress not filled in";
					request.setAttribute("errorADD", errorADD);

				}


				if(city.length()==0)	{
					errorCITY = "city not filled in";
					request.setAttribute("errorCITY", errorCITY);

				}


				if(state.length()==0)	{
					errorSTATE = "State not filled in";
					request.setAttribute("errorSTATE", errorSTATE);

				}

				if(pincode.length()==0)	{
					errorPIN = "pincode not filled in";
					request.setAttribute("errorPIN", errorPIN);

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
				else if(connect.isUserNameAvailable(userName))	{
					errorUN = "Username Not Available";
					request.setAttribute("msgUserName", errorUN);
					reqDis = getServletContext().getRequestDispatcher(locate);
					reqDis.forward(request,response);
					return;
				}
			}

			userid = connect.enterNewUser(firstName, lastName, middleName, emailAddress, phoneNumber, streetAddress, city, state, pincode, userName, password);
			if(userid==0)	{
				error = "Account Created Successfully";
				locate = "/BuyerLogin.jsp";
				request.setAttribute("logout", error);

				reqDis = getServletContext().getRequestDispatcher(locate);
				reqDis.forward(request,response);
			}
			else if(userid == -1)	{
				error = "Create Account Failed, Please Try Again";
				request.setAttribute("registerStatus", error);
				reqDis = getServletContext().getRequestDispatcher(locate);
				reqDis.forward(request,response);
			}
		}

	}

}

