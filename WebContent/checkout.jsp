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
			<li><a href="HomePage.jsp">Home</a></li>
			<li><a href="#sell">Sell</a></li>
			<li><a href="#track">Track-Order</a></li>
			<li><a href="#signin">Sign In</a></li>
			<li><a href="#register.jsp">Register</a></li>
			<li><a href="">Shopping Cart</a></li>
			<li><a href="LogoutServlet">Logout</a></li>
		</ul>
	</div>
	<div id="horizBorder"></div>
	
	<sql:setDataSource var="myDS" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/eGizmo" user="root" password="root" />
			
			

		<sql:query var="smartphones" dataSource="${myDS}">
        	SELECT p.sellerId,s.buyerId,s.productId,p.name,p.cost,p.shippingCost,p.imagePath,p.quantity 
        	FROM product p join shoppingcart  s where p.productId=? and s.buyerId=<%=(Integer)session.getAttribute("buyerId")%>;
        <sql:param value="${param.productId}" />
    	</sql:query>
	
	<div id="register">
	
	
	
		<table align='center' id= "phones">
		<c:forEach var="prod" items="${smartphones.rows}">
			<form action="placeorder.jsp?sellerId=<c:out value="${prod.sellerId}"/>" method='post'>
				<tr align='center'>
					<td colspan='2'><h3>Product Details</h3></td>
				</tr>
				<tr>
				<td align="center"><img src=<c:out value="image/${prod.imagePath}"/> /></td>
				</tr>
				<tr>
				<td>Product Id :</td>
				<td><input type='text' name='productId' value="${prod.productId}" readonly="readonly"></td>
				</tr>
				<tr>
					<td>Product Name :</td>
					<td><input type='text' name='name' value="${prod.name}" readonly="readonly"></td>
					<td><font color='red'></font>
					<td>
				</tr>
				<tr>
					<td>Cost :</td>
					<td><input type='text' name='cost' value="${prod.cost}" readonly="readonly"></td>
					<td><font color='red'></font>
					<td>
				</tr>
				<tr>
					<td>Shipping Cost :</td>
					<td><input type='text' name='shippingCost' value="${prod.shippingCost}" readonly="readonly"></td>
					<td><font color='red'></font>
					<td>
				</tr>
				<tr>
					<td>Total Cost :</td>
					
					<td><input type='text' name='totalcost' value="${prod.cost+prod.quantity}" readonly="readonly"></td>
					<td><font color='red'></font>
					<td>
				</tr>
				<tr align='center'>
					<td colspan='2'><h3>Shipping Details</h3></td>
				</tr>
				<tr>
					<td>Name :</td>
					<td><input type='text' name='receivername' required="required"></td>
					<td><font color='red'></font>
					<td>
				</tr>
				<tr>
					<td>Email ID :</td>
					<td><input type='email' name='email' required="required"></td>
					<td><font color='red'></font>
					<td>
				</tr>
				<tr>
					<td>Phone Number:</td>
					<td><input title="Please enter 10 Digit PHONE Number" required pattern="(?=.*\d).{10,10}"  type="text" name="phonenumber"></td>
					<td><font color='red'></font>
				</tr>
				<tr>
					<td>Address:</td>
					<td><input  type="text" name="address" required="required" required placeholder="Enter your Address"></td>
					<td><font color='red'></font>
				</tr>
				<tr>
					<td>City:</td>
					<td><input title="City name in small alphabets Ex: albany" type="text" name="city" required="required" placeholder="Enter your City in small alphabets" required pattern="(?=.*[a-z]).{1,20}"></td>
					<td><font color='red'></font>
				</tr>
				<tr>
					<td>Pincode:</td>
					<td><input  title="Please enter 5 Digit PIN Code of your Area Ex:12345" id="pincode" placeholder="Enter your PIN Code" required pattern="(?=.*\d).{5,5}" type="text" name="pincode"></td>
					<td><font color='red'></font>
				</tr>
				<tr>
					<td>State:</td>
					<td><input  title="Please enter the State as Ex: ny or new york" id="state" type="text" placeholder="Enter your State" required pattern="(?=.*[a-z]).{1,20}" name="state"></td>
					<td><font color='red'></font>
				</tr>
				<tr align='center'>
					<td colspan='2'><h3>Payment Details</h3></td>
				</tr>
				<tr>
					<td>Card Number:</td>
					<td><input title="Please enter 8 digit card number in numeral value" type="text" name="cardnumber" required="required" placeholder="Enter 8  Digit Card Number" required pattern="(?=.*\d).{8,8}"></td>
					<td><font color='red'></font>
				</tr>
				<tr>
					<td>CVC:</td>
					<td><input title="Please enter 3 digit CVC in numeral value" type="text" name="cvc" required="required" placeholder="012" required pattern="(?=.*\d).{3,3}"></td>
					<td><font color='red'></font>
				</tr>
				<tr>
					<td>Accout Number:</td>
					<td><input title="Please enter 10 digit account number in numeral value"  type="text" name="accno" placeholder="0123456789" required pattern="(?=.*\d).{10,10}" ></td>
					<td><font color='red'></font>
				</tr>
				<tr>
					<td colspan='2' align="center"><input id="createAccount" type="submit"
						name="createaccount" value="Place Order"></td>
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