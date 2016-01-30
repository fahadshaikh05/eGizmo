<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Orders Notification</title>
<link rel="stylesheet" href="Newmain.css" type="text/css"
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
	
		<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/eGizmo" user="root" password="root" />

		<sql:query dataSource="${dbsource}" var="result">
            select orderId,productId,name,totalcost,receivername,email,phonenumber,
  			address,city,pincode,state from orders where sellerId=<%=sellerId%>;
        </sql:query>
		<center>
			<!-- <form action="updateOrdersSeller.jsp?" method="post"> -->
				<table id="customers">
					<caption>Orders List</caption>
					<tr>
						<th>Order ID</th>
						<th>Product ID</th>
						<th>Product Name</th>
						<th>Total Cost</th>
						<th>Receiver Name</th>
						<th>Email Address</th>
						<th>Phone Number</th>
						<th>Address</th>
						<th>City</th>
						<th>Pin Code</th>
						<th>State</th>
					</tr>
					<c:forEach var="row" items="${result.rows}">
						<tr>
							<td><c:out value="${row.orderId}"/></td>
							<td><c:out value="${row.productId}" /></td>
							<td><c:out value="${row.name}" /></td>
							<td><c:out value="${row.totalcost}" /></td>
							<td><c:out value="${row.receivername}" /></td>
							<td><c:out value="${row.email}" /></td>
							<td><c:out value="${row.phonenumber}" /></td>
							<td><c:out value="${row.address}" /></td>
							<td><c:out value="${row.city}" /></td>
							<td><c:out value="${row.pincode}" /></td>
							<td><c:out value="${row.state}" /></td> 
						</tr>
					</c:forEach>
				</table>
				<%
	}
%>
			<!-- </form> -->
		</center>
		<div id="horizontalBorderFooter"></div>

		<!--footer starts here-->
		
	</div>
</body>
</html>