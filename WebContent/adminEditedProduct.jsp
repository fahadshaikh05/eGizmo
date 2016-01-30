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

	<sql:update dataSource="${dbsource}" var="count">
      UPDATE product SET 
       name=?,cost=?,shippingCost=?,category=?,quantity=?,description=?
       WHERE productId= ${param.productId}
        <sql:param value="${param.name}" />
		<sql:param value="${param.cost}" />
		<sql:param value="${param.shippingCost}" />
		<sql:param value="${param.category}" />
		<sql:param value="${param.quantity}" />
		<sql:param value="${param.description}" />
	</sql:update>
	<c:if test="${count>=1}">
		<font size="5" color='green'> Congratulations ! Data updated
			successfully.</font>

		<c:redirect url="AdminHomePage.jsp">
			<c:param name="susMsg"
				value="Congratulations ! Data Updated successfully." />
		</c:redirect>

	</c:if>


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
<%
	}
%>
</html>