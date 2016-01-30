<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Seller SignUp</title>
<link rel="stylesheet" href="Newmain.css" type="text/css" />
</head>
<body>

	<div id="headerRegister">
		<div id="logo">
			<img src="image/logo1.jpg">
		</div>
		<ul id="menu">
			<li><a href="HomePage.jsp">Home</a></li>
			<li><a href="sellerLogin.jsp">Sign In</a></li>
		</ul>
	</div>
	<div id="horizBorder"></div>
	<div id="Register">
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

			String textCName = (String) request.getAttribute("errorCN");
			if (textCName == null)
				textCName = "";

			String textOPTIONS = (String) request.getAttribute("errorOP");
			if (textOPTIONS == null)
				textOPTIONS = "";

			String textUName = (String) request.getAttribute("errorUN");
			if (textUName == null)
				textUName = "";

			String textEID = (String) request.getAttribute("errorEID");
			if (textEID == null)
				textEID = "";
			
			String textURL = (String) request.getAttribute("errorURL");
			if (textURL == null)
				textURL = "";

			String textACCOUNT = (String) request.getAttribute("errorACC");
			if (textACCOUNT == null)
				textACCOUNT = "";

			String textROUTING = (String) request.getAttribute("errorROUTING");
			if (textROUTING == null)
				textROUTING = "";

			String textNOTI = (String) request.getAttribute("errorNOTI");
			if (textNOTI == null)
				textNOTI = "";

			String textPHNO = (String) request.getAttribute("errorPHNO");
			if (textPHNO == null)
				textPHNO = "";

			String loggedIn = (String) session.getAttribute("loggedIn");
			if (loggedIn == null)
				loggedIn = "";

			if (!loggedIn.equals("true")) {
		%>
		<table align='center'>
			<form action='SellerSignup' method='post'>
				<tr align='center'>
					<td colspan='2'><h2>Seller SignUp</h2></td>
				</tr>
				<tr align='center'>
					<td colspan='2'><font color='red'><p><%=status%></p></font></td>
				</tr>
				<tr>
					<td>User Name :</td>
					<td><input id="sellername" type='text' name='username'></td>
					<td><font color='red'><%=textUName%></font>
					<td>
				</tr>
				<tr>
					<td><input type='submit' name='check' value='check' /></td>
				</tr>
				<tr>
					<td>Password :</td>
					<td><input id="sellerPwd" type="password" name='password'></td>
					<td><font color='red'><%=textPass%></font>
					<td>
				</tr>
				<tr>
					<td>Confirm Password :</td>
					<td><input id="sellerCPwd" type='password' name='cPassword'></td>
					<td><font color='red'><%=textCPass%></font>
					<td>
				</tr>
				<tr>
					<td>Company Name :</td>
					<td><input id="sellerCompId" type='text' name='companyName'></td>
					<td><font color='red'><%=textCName%></font>
					<td>
				</tr>
			<tr>
				<td>Email id:</td>
				<td><input id="emailAddress" type="text" name="emailAddress"></td>
				<td><font color='red'><%=textEID%></font>
			</tr>
			<tr>
				<td>Phone Number:</td>
				<td><input id="phoneNumber" type="text" name="phno"
					placeholder="555-555-5555"></td>
				<td><font color='red'><%=textPHNO%></font>
			</tr>
			<tr>
				<td>URL:</td>
				<td><input id="url" type="text" name="url"></td>
				<td><font color='red'><%=textURL%></font>
			</tr>
			<tr>
				<td>Shipping Options:</td>
				<td><input id="options" type="text" name="options"></td>
				<td><font color='red'><%=textOPTIONS%></font>
			</tr>
			<tr>
				<td>Notification:</td>
				<td><input id="state" type="text" name="notification"></td>
				<td><font color='red'><%=textNOTI%></font>
			</tr>
			<tr>
				<td>Account Number:</td>
				<td><input id="account" type="text" name="account"></td>
				<td><font color='red'><%=textACCOUNT%></font>
			</tr>
			<tr>
				<td>Routing Number:</td>
				<td><input id="routing" type="text" name="routing"></td>
				<td><font color='red'><%=textROUTING%></font>
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
		<div id="horizontalBorderFooter"></div>
		<!--footer starts here-->
		<%@include file="Footer.jsp"%>
</body>
</html>