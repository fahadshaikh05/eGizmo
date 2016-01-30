<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Orders</title>
<link rel="stylesheet" href="Newmain.css" type="text/css"
	charset="utf-8" />
</head>
<body>
<%
		int userId = (Integer) session.getAttribute("userId");

		/* String name = (String) session.getAttribute("userName");
		if (name == null)
			name = ""; */
		String admin = "admin";
			session.setAttribute("admin", admin);
		String loggedIn = (String) session.getAttribute("loggedIn");
		if (loggedIn == null)
			loggedIn = "";

		if (!loggedIn.equals("true")) {

			String redirectURL = "http://localhost:8080/egizmo/sellerLogin.jsp";
			response.sendRedirect(redirectURL);

		} else {
	%>
<%@include file="AdminHeader.jsp"%>
	
		<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/eGizmo" user="root" password="root" />

		<sql:query dataSource="${dbsource}" var="result">
            select productId,name,cost,shippingCost,category,quantity,description,sellerId
  			from product;
        </sql:query>
		<center>
			<form>
				<table id="customers">
					<caption>Products List</caption>
					<tr>
						<th>Product ID</th>
						<th>Product Name</th>
						<th>Cost</th>
						<th>Shipping Cost</th>
						<th>Category</th>
						<th>Quantity</th>
						<th>Description</th>
						<th>Seller ID</th>
						<th colspan="2"><center>Action</center></th>
					</tr>
					<c:forEach var="row" items="${result.rows}">
						<tr>
							<td><c:out value="${row.productId}"/></td>
							<td><c:out value="${row.name}"/></td>
							<td><c:out value="${row.cost}"/></td>
							<td><c:out value="${row.shippingCost}"/></td>
							<td><c:out value="${row.category}"/></td>
							<td><c:out value="${row.quantity}"/></td>
							<td><c:out value="${row.description}"/></td>
							<td><c:out value="${row.sellerId}"/></td>
							<td><a href="adminEditProduct.jsp?productId=<c:out value="${row.productId}"/>">Update</a></td>
						<td><a href="adminDeleteProduct.jsp?productId=<c:out value="${row.productId}"/>">Delete</a></td>
						</tr>
					</c:forEach>
				</table>
			</form>
		</center>
		<div id="horizontalBorderFooter"></div>

		<!--footer starts here-->
		<div id="footer">
			<div id="footerlogo">
				<img src="image/logoN.jpg">
			</div>
			<div id="services">
				<h3>Services</h3>
				<ul>
					<li><a href="#">Online Help</a></li>
					<li><a href="#">Contact Us</a></li>
					<li><a href="#">Order Status</a></li>
					<li><a href="#">FAQ's</a></li>
				</ul>
			</div>
			<div id="Policies">
				<h3>Policies</h3>
				<ul="Policies" >
					<li><a href="#">Terms of Use</a></li>
					<li><a href="#">Privacy Policy</a></li>
					<li><a href="#">Refund Policy</a></li>
					<li><a href="#">Billing System</a></li>
					<li><a href="#">Ticket System</a></li>
				</ul>
			</div>
			<div id="AboutUs">

				<h3>AboutUs</h3>
				<ul="AboutUs" >
					<li><a href="#">Company Information</a></li>
					<li><a href="#">Careers</a></li>
					<li><a href="#">Store Location</a></li>
					<li><a href="#">Copyright</a></li>
				</ul>
			</div>
		</div>
</body>
<%
	}
%>
</html>