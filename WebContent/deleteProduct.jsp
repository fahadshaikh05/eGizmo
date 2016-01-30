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
<title>Seller Delete Products</title>
<link rel="stylesheet" href="Newmain.css" type="text/css"
	charset="utf-8" />
	<link rel="stylesheet" href="styles.css">
</head>
<body>
	<% int userId = (Integer) session.getAttribute("sellerId"); %>
	<div id='cssmenu' align="center">
		<ul id="menu">
			<%-- <li><font color="#D80818" size="3">Hi</font><b><font color="blue" size="5"> <%=name%></font></b></li> --%>
			<li><a href="DemoSeller.jsp">Seller Home</a></li>
			<li><a href="viewSellerAccount.jsp">View Account</a></li>
			<li><a href="LogoutServlet">Logout</a></li>
		</ul>

	</div>

	<div id="horizBorder"></div>
	<div id="register">
		<form action="deleteProductController" method="post">
			<sql:setDataSource var="myDS" driver="com.mysql.jdbc.Driver"
				url="jdbc:mysql://localhost:3306/eGizmo" user="root" password="root" />

			<sql:query var="listProducts" dataSource="${myDS}">
        SELECT * FROM product where sellerId=<%=userId%>;
    </sql:query>

			<div align="center">
				<table border="1" cellpadding="5" id="customers">
					<caption>
						<h2>List of Products</h2>
					</caption>
					<tr>
						<th>Product ID</th>
						<th>Name</th>
						<th>Cost</th>
						<th>Shipping Cost</th>
						<th>Category</th>
						<th>Product Image</th>
						<th>Quantity</th>
						<!-- <th>Product Description</th> -->

					</tr>
					<c:forEach var="prod" items="${listProducts.rows}">
						<tr>
							<td><c:out value="${prod.productId}" /></td>
							<td><c:out value="${prod.name}" /></td>
							<td><c:out value="${prod.cost}" /></td>
							<td><c:out value="${prod.shippingCost}" /></td>
							<td><c:out value="${prod.category}" /></td>
							<td><c:out value="${prod.imagePath}" /></td>
							<td><c:out value="${prod.quantity}" /></td>

						</tr>
					</c:forEach>
					<tr>
						<td>Product ID:</td>
						<td><input id="productId" type="text" name="productId"
							placeholder="Product Id" required></td>
						<td><input type="submit" value="Delete Product"></input></td>
					</tr>
				</table>
			</div>
		</form>
		<div id="horizontalBorderFooter"></div>

		<!--footer starts here-->
		
	</div>
</body>
</html>