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
</head>
<body>
<%
		int adminId = (Integer) session.getAttribute("adminId");
	%>
	
<%@include file="AdminHeader.jsp"%>
	<div id="horizBorder"></div>
	<div id="register">
		<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/eGizmo" user="root" password="root" />

		<sql:query dataSource="${dbsource}" var="result">
            select o.orderId,o.productId,o.name,o.totalcost,o.receivername,o.email,o.phonenumber,
  			o.address,o.city,o.pincode,o.state,o.sellerId,
  			o.buyerId from orders o where o.orderId=?;
  			<sql:param value="${param.orderId}" />
        </sql:query>
		<center>
			<form action="adminUpdatedOrder.jsp" method="post">
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
						<th>Seller ID</th>
						<th>Buyer ID</th>
						<th>Update</th>
						
					</tr>
					<c:forEach var="row" items="${result.rows}">
						<tr>
							<td><input id="orderId" type="hidden" name="orderId" value="${row.orderId}" ></td>
							<td><c:out value="${row.productId}" /></td>
							<td><input id="name" type="text" name="name" value="${row.name}" ></td>
							<td><input id="totalcost" type="text" name="totalcost" value="${row.totalcost}" ></td>
							<td><input id="receivername" type="text" name="receivername" value="${row.receivername}" ></td>
							<td><input id="email" type="text" name="email" value="${row.email}" ></td>
							<td><input id="phonenumber" type="text" name="phonenumber" value="${row.phonenumber}" ></td>
							<td><input id="address" type="text" name="address" value="${row.address}" ></td>
							<td><input id="city" type="text" name="city" value="${row.city}" ></td>
							<td><input id="pincode" type="text" name="pincode" value="${row.pincode}" ></td>
							<td><input id="state" type="text" name="state" value="${row.state}" ></td>
							<td><c:out value="${row.sellerId}" /></td>
							<td><c:out value="${row.buyerId}" /></td>
							<td><input id="Update Order" type="submit"
						name="Update Order" value="Update Order"></td>
						</tr>
					</c:forEach>
				</table>
			</form>
		</center>
		
	</div>
</body>
</html>