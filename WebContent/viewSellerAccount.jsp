<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Seller</title>
<link rel="stylesheet" href="Newmain.css" type="text/css" />
</head>
<body>

	<%
		int sellerId = (Integer) session.getAttribute("sellerId");
			
		String loggedIn = (String) session.getAttribute("loggedIn");
		if (loggedIn == null)
			loggedIn = "";

		if (!loggedIn.equals("true")) {

			String redirectURL = "http://localhost:8080/egizmo/sellerLogin.jsp";
			response.sendRedirect(redirectURL);

		} else {
	%>
	<div id="headerRegister">
		<div id="logo">
			<img src="image/logoN.jpg">
		</div>
		<ul id="menu">
			<li><a href="DemoSeller.jsp">Seller Home</a></li>
			<li><a href="LogoutServlet">Logout</a></li>
		</ul>
	</div>
	<div id="horizBorder"></div>
	<div id="register">

		<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/eGizmo" user="root" password="root" />

		<sql:query dataSource="${dbsource}" var="result">
            SELECT * from seller where sellerId=<%=sellerId%>;
		</sql:query>


		<table align='center'>

			<c:forEach var="row" items="${result.rows}">
				<tr align='center'>
					<td colspan='2'><h3>My Account</h3></td>
				<tr>
					<td>Company Name :</td>
					<td><input type="hidden" value="${param.sellerId}"
						name="sellerId" /> <input type='text' name='companyName'
						value="${row.companyName}" readonly></td>
				</tr>
				<tr>
					<td>Email Address :</td>
					<td><input type='text' name='emailAddress'
						value="${row.emailAddress}" readonly></td>
				</tr>
				<tr>
					<td>Phone Number :</td>
					<td><input type='text' name='phoneNumber'
						value="${row.phoneNumber}" readonly></td>
				</tr>
				<tr>
					<td>URL :</td>
					<td><input id="URL" type="text" name="URL" value="${row.URL}"
						readonly></td>

				</tr>

				<tr>
					<td>Shipping Options :</td>
					<td><input id="ShippingOptions" type="text"
						name="ShippingOptions" value="${row.ShippingOptions}" readonly></td>

				</tr>
				<tr>
					<td>Notification :</td>
					<td><input id="Notification" type="text" name="Notification"
						value="${row.Notification}" readonly></td>

				</tr>
				<tr>
					<td>Account Number:</td>
					<td><input id="accountNumber" type="text" name="accountNumber"
						value="${row.accountNumber}" readonly></td>

				</tr>
				<tr>
					<td>Routing Number :</td>
					<td><input id="routingNumber" type="text" name="routingNumber"
						value="${row.routingNumber}" readonly></td>
				</tr>
				<tr>
					<td>User Name:</td>
					<td><input id="userName" type="text" name="userName"
						value="${row.userName}" readonly></td>
				</tr>
				<tr>
					<td>Password :</td>
					<td><input id="password" type="text" name="password"
						value="${row.password}" readonly></td>
				</tr>
				<tr>
					<td><form action="updateSellerAccount.jsp">
							<input id="Update Account" type="submit" name="UpdateAccount"
								value="UpdateAccount">
						</form></td>
				</tr>

			</c:forEach>
		</table>
</body>
<%
	}
%>

</html>