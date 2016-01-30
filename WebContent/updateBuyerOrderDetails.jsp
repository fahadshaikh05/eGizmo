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

String name = (String) session.getAttribute("userName");
if(name == null) name = "";

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
	
	<sql:setDataSource var="myDS" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/eGizmo" user="root" password="root" />
			
			

		<sql:query var="smartphones" dataSource="${myDS}">
        	select o.orderId,o.receivername,o.email,o.phoneNumber,o.address,o.pincode,o.city,o.state from orders o  join  product p on o.productId = p.productId and  buyerId=<%=(Integer)session.getAttribute("buyerId")%>;
        
    	</sql:query>	
	<div id="register">
	
		<table align='center' id= "phones">
		<c:forEach var="prod" items="${smartphones.rows}">
			<form action="updatedBuyerOrder.jsp?orderId=<c:out value="${prod.orderId}"/>" method='post'>
				<tr align='center'>
					<td colspan='2'><h3>Update Shipping Details</h3></td>
				</tr>
				
				<tr align='center'>
					<td colspan='2'><h3>Shipping Details</h3></td>
				</tr>
				<tr>
					<td>Name :</td>
					<td><input type='text' name='receivername' value="${prod.receivername}" required="required"></td>
					<td><font color='red'></font>
					<td>
				</tr>
				<tr>
					<td>Email ID :</td>
					<td><input type='text' name='email'  value="${prod.email}" required="required"></td>
					<td><font color='red'></font>
					<td>
				</tr>
				<tr>
					<td>Phone Number:</td>
					<td><input  type="text" name="phonenumber" value="${prod.phoneNumber}" required="required"></td>
					<td><font color='red'></font>
				</tr>
				<tr>
					<td>Address:</td>
					<td><input  type="text" name="address"  value="${prod.address}" required="required"></td>
					<td><font color='red'></font>
				</tr>
				<tr>
					<td>City:</td>
					<td><input  type="text" name="city"  value="${prod.city}" required="required"></td>
					<td><font color='red'></font>
				</tr>
				<tr>
					<td>Pincode:</td>
					<td><input  type="text" name="pincode"  value="${prod.pincode}" required="required"></td>
					<td><font color='red'></font>
				</tr>
				<tr>
					<td>State:</td>
					<td><input  type="text" name="state" value="${prod.state}" required="required"></td>
					<td><font color='red'></font>
				</tr>
				<tr>
					<td colspan='2' align="center"><input id="UpdatedOrder" type="submit"
						name="createaccount" value="Update Order"></td>
				</tr>
			</form>
			</c:forEach>  
		</table>
	</div>
	<%
	}
	%>
</body>
</html>