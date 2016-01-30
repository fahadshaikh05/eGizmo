<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register Buyer</title>
<link rel="stylesheet" href="Newmain.css" type="text/css"/>
</head>
<body>

<%
	/* int buyerId = (Integer)session.getAttribute("buyerId");
	System.out.println(buyerId); */
	
	String loggedIn = (String) session.getAttribute("loggedIn");
	if(loggedIn == null) loggedIn = "";
 
	if(!loggedIn.equals("true"))	{
		
		String redirectURL = "http://localhost:8080/egizmo/BuyerLogin.jsp";
    	response.sendRedirect(redirectURL);
			
		}
		else{
			
			%>

	<div id="headerRegister">
		<div id="logo">
			<img src="image/logoN.jpg">
		</div>
		<ul id="menu">
			<li><a href="BuyerHomePage.jsp">Home</a></li>
			<li><a href="LogoutServlet">Logout</a></li>
		</ul>
	</div>
	<div id="horizBorder"></div>
	<div id="register">
		
		<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/eGizmo" user="root" password="root" />

		<sql:query dataSource="${dbsource}" var="result">
            SELECT * from buyer where buyerId=<%=(Integer)session.getAttribute("buyerId")%>;
		</sql:query>
		
			
		<table align='center'>
			<form action='updatedBuyerAccount.jsp' method='post'>
			<c:forEach var="row" items="${result.rows}">
				<tr align='center'>
					<td colspan='2'><h3>My Account</h3></td>
				<tr>
					<td>FirstName :</td>
					<td><input type="hidden" value="${param.buyerId}" name="buyerId"/><input type='text' name='firstName' value="${row.firstName}" ></td>
				</tr>
				<tr>
					<td>MiddleName :</td>
					<td><input type='text' name='middleName' value="${row.lastName}" ></td>
				</tr>
				<tr>
					<td>LastName :</td>
					<td><input type='text' name='lastName' value="${row.middleName}" ></td>
				</tr>
				<tr>
					<td>Email id:</td>
					<td><input id="emailAddress" type="text" name="emailAddress" value="${row.emailAddress}" ></td>
					
				</tr>

				<tr>
					<td>Address:</td>
					<td><input id="address" type="text" name="streetAddress" value="${row.streetAddress}" ></td>
					
				</tr>
				<tr>
					<td>City:</td>
					<td><input id="city" type="text" name="city" value="${row.city}" ></td>
					
				</tr>
				<tr>
					<td>State:</td>
					<td><input id="state" type="text" name="state" value="${row.state}" ></td>
					
				</tr>
				<tr>
					<td>Pincode:</td>
					<td><input id="pincode" type="text" name="pincode" value="${row.pincode}" ></td>
				</tr>
				<tr>
					<td>Phone Number:</td>
					<td><input id="phoneNumber" type="text" name="phoneNumber"
						placeholder="555-555-5555" value="${row.phoneNumber}" ></td>
				</tr>
				<tr >
					<td><input id="Update Account" type="submit"
						name="UpdateAccount" value="UpdateAccount"></td>
				</tr>
				</c:forEach>
			</form>
		<%
		}
		%>	
		</table>
		</body>
</html>