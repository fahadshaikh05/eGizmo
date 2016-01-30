<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> --%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!-- PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd"> -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin View Seller</title>
<link rel="stylesheet" href="Newmain.css" type="text/css"
	charset="utf-8" />
</head>
<body>
	<%
		int userId = (Integer) session.getAttribute("adminId");
	%>
<%@include file="AdminHeader.jsp"%>
	<div id="horizBorder"></div>
	<div id="register">
		<form id="customers">
			<sql:setDataSource var="myDS" driver="com.mysql.jdbc.Driver"
				url="jdbc:mysql://localhost:3306/eGizmo" user="root" password="root" />

			<sql:query var="listProducts" dataSource="${myDS}">
				SELECT * FROM seller where sellerId NOT IN (123);
    </sql:query>

			<div align="center">
				<table border="1" cellpadding="5">
					<caption>
						<h2>List of Seller's</h2>
					</caption>
					<tr>

						<th>Seller ID</th>
						<th>User Name</th>
						<th>Password</th>
						<th>Company Name</th>
						<th>Email Address</th>
						<th>Phone Number</th>
						<th>URL</th>
						<th>Account Number</th>
						<th>Routing Number</th>
						<th>Seller Status</th>
						<th colspan="2">Action</th>
					</tr>
					<c:forEach var="prod" items="${listProducts.rows}">
						<tr>
							<td><c:out value="${prod.sellerId}" /></td>
							<td><c:out value="${prod.userName}" /></td>
							<td><c:out value="${prod.password}" /></td>
							<td><c:out value="${prod.companyName}" /></td>
							<td><c:out value="${prod.emailAddress}" /></td>
							<td><c:out value="${prod.phoneNumber}" /></td>
							<td><c:out value="${prod.URL}" /></td>
							<td><c:out value="${prod.accountNumber}" /></td>
							<td><c:out value="${prod.routingNumber}" /></td>
							<td><c:out value="${prod.isActive}" /></td>
							<td><a
								href="adminDeleteSeller.jsp?sellerId=<c:out value="${prod.sellerId}"/>">Block</a></td>
							<td><a
								href="adminActivateSeller.jsp?sellerId=<c:out value="${prod.sellerId}"/>">Activate</a></td>
							
						</tr>
					</c:forEach>
				</table>
			</div>
		</form>
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
	</div>
</body>
</html>