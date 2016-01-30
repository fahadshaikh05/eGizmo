<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>egizmo.com</title>
<link rel="stylesheet" href="Newmain.css" type="text/css"
	charset="utf-8" />
<link rel="stylesheet" href="js-image-slider.css" type="text/css"
	charset="utf-8" />
	<link rel="stylesheet" href="styles.css">
</head>
<body>
	<%
		int sellerId = (Integer) session.getAttribute("sellerId");
 
		String name = (String) session.getAttribute("userName");
		if (name == null)
			name = ""; 

		String loggedIn = (String) session.getAttribute("loggedIn");
		if (loggedIn == null)
			loggedIn = "";

		if (!loggedIn.equals("true")) {

			String redirectURL = "http://localhost:8080/egizmo/sellerLogin.jsp";
			response.sendRedirect(redirectURL);

		} else {
	%>
	<!-- <div id="logo">
			<img src="image/logoN.jpg">
		</div> -->
	<div id='cssmenu' align="center">
		<ul id="menu">
			<%-- <li><font color="#D80818" size="3">Hi</font><b><font color="blue" size="5"> <%=name%></font></b></li> --%>
			<li><a href="DemoSeller.jsp">Seller Home</a></li>
			<li><a href="viewSellerAccount.jsp">View Account</a></li>
			<li><a href="LogoutServlet">Logout</a></li>
		</ul>

	</div>
	<!-- header ends here -->
	<!-- horizontal border starts here -->
	<div id="Horizontal-border"></div>
	<!-- categories starts here -->

	<div id=categories>
		<h2>Features</h2>
		<ul>
			<li><a href="addProduct.jsp">Add Product</a></li>
			<li><a href="viewProduct.jsp">List/Edit Products</a></li>
			<li><a href="deleteProduct.jsp">Delete Products</a></li>
			<li><a href="sellerOrdersNotification.jsp">Orders Notification</a></li>
			<li><a href="UpdateShippingStatusSeller.jsp">Update Shipping Status</a></li>
			<li><a href="sellerViewCustomerReview.jsp">Customer Reviews</a></li>
			<li><a href="contactBuyer.jsp">Contact Buyers</a></li>
			<li><a href="viewBuyerNotifications.jsp">Messages</a></li>
		</ul>
	</div>


	<!-- <div id="phones">
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br><br> <br> <br> <br>

	</div>*/ -->
	
	<div id="demoSeller">
	<div id="demoSellerContainer">
	<img src="image/appleproducts.png" alt="">
	
	
	
	</div>
	
	
	</div>

	<div id="horizontalBorderFooter"></div>

	<%@include file="Footer.jsp"%>

</body>
<script src="js-image-slider.js"></script>
<%
	}
%>

</html>