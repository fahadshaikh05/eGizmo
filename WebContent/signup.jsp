<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register Buyer</title>
<link rel="stylesheet" href="Newmain.css" type="text/css"/>
</head>
<body>

	<div id="headerRegister">
		<div id="logo">
			<img src="image/logoN.jpg">
		</div>
		<ul id="menu">
			<li><a href="HomePage.jsp">Home</a></li>
			<li><a href="BuyerLogin.jsp">Sign In</a></li>
		</ul>
	</div>
	<div id="horizBorder"></div>
	<div id="register">
		<%
			String textPass = (String) request.getAttribute("errorPass");
			if (textPass == null)
				textPass = "";

			String textCPass = (String) request.getAttribute("errorCPass");
			if (textCPass == null)
				textCPass = "";

			String status = (String) request.getAttribute("error");
			if (status == null)
				status = "";

			String textFName = (String) request.getAttribute("errorFN");
			if (textFName == null)
				textFName = "";

			String textLName = (String) request.getAttribute("errorLN");
			if (textLName == null)
				textLName = "";

			String textUName = (String) request.getAttribute("errorUN");
			if (textUName == null)
				textUName = "";

			String textEID = (String) request.getAttribute("errorEID");
			if (textEID == null)
				textEID = "";

			String textADD = (String) request.getAttribute("errorADD");
			if (textADD == null)
				textADD = "";

			String textCITY = (String) request.getAttribute("errorCITY");
			if (textCITY == null)
				textCITY = "";

			String textSTATE = (String) request.getAttribute("errorSTATE");
			if (textSTATE == null)
				textSTATE = "";

			String textPIN = (String) request.getAttribute("errorPIN");
			if (textPIN == null)
				textPIN = "";

			String textPHNO = (String) request.getAttribute("errorPHNO");
			if (textPHNO == null)
				textPHNO = "";

			String loggedIn = (String) session.getAttribute("loggedIn");
			if (loggedIn == null)
				loggedIn = "";

			if (!loggedIn.equals("true")) {
		%>
		<table align='center'>
			<form action='SignupServlet' method='post'>
				<tr align='center'>
					<td colspan='2'><h3>Buyer SignUp</h3></td>
				</tr>
				<tr align='center'>
					<td colspan='2'><font color='red'><p><%=status%></p></font></td>
				</tr>
				<tr>
					<td>UserName :</td>
					<td><input id ="userName" type='text' name='username'></td>
					<td><font color='red'><%=textUName%></font>
					<td>
				</tr>
				<tr>
					<td><input type='submit' name='check' value='check' /></td>
				</tr>
				<tr>
					<td>FirstName :</td>
					<td><input  id ="name" type='text' name='firstname'></td>
					<td><font color='red'><%=textFName%></font>
					<td>
				</tr>
				<tr>
					<td>MiddleName :</td>
					<td><input  id ="name" type='text' name='middlename'></td>
					<td><font color='red'><%=textFName%></font>
					<td>
				</tr>
				<tr>
					<td>LastName :</td>
					<td><input id ="name"  type='text' name='lastname'></td>
					<td><font color='red'><%=textLName%></font>
					<td>
				</tr>
				<tr>
					<td>Password :</td>
					<td><input id ="name" type='password' name='password'></td>
					<td><font color='red'><%=textPass%></font>
					<td>
				</tr>
				<tr>
					<td>Confirm Password :</td>
					<td><input id ="name" type='password' name='cPassword'></td>
					<td><font color='red'><%=textCPass%></font>
					<td>
				</tr>
				<tr>
					<td>Email id:</td>
					<td><input id="emailAddress" type="text" name="emailAddress"></td>
					<td><font color='red'><%=textEID%></font>
				</tr>

				<tr>
					<td>Address:</td>
					<td><input id="address" type="text" name="address"></td>
					<td><font color='red'><%=textADD%></font>
				</tr>
				<tr>
					<td>City:</td>
					<td><input id="city" type="text" name="city"></td>
					<td><font color='red'><%=textCITY%></font>
				</tr>
				<tr>
					<td>State:</td>
					<td><input id="state" type="text" name="state"></td>
					<td><font color='red'><%=textSTATE%></font>
				</tr>
				<tr>
					<td>Pincode:</td>
					<td><input id="pincode" type="text" name="pincode"></td>
					<td><font color='red'><%=textPIN%></font>
				</tr>
				<tr>
					<td>Phone Number:</td>
					<td><input id="phoneNumber" type="text" name="phno"
						placeholder="555-555-5555"></td>
					<td><font color='red'><%=textPHNO%></font>
				</tr>
				<tr>
					<td><input id="createAccount" type="submit"
						name="createaccount" value="Create Account"></td>
					<td><input id="reset" type="reset" name="reset" value="Reset"></td>
				</tr>
			</form>
		</table>
		<%
			}

			else {
		%>
		<%@ include file="HomePage.jsp"%>
		<font color="red">You are already a member</font>


		<%
			}
		%>
		


	</div>
</body>
</html>