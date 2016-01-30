<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>
<!--  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">-->
<title>egizmo-Smartphone</title>
<link rel="stylesheet" href="Newmain.css" type="text/css" charset="utf-8">
<link rel="stylesheet" href="styles.css">
</head>
<body>

<%
		/* int buyerId = (Integer)session.getAttribute("buyerId");
		System.out.println(buyerId); */
		
		String name = (String) session.getAttribute("userName");
		if(name == null) name = "";
	 
		String loggedIn = (String) session.getAttribute("loggedIn");
		if(loggedIn == null) loggedIn = "";
	 
		if(!loggedIn.equals("true"))	{
			
			String redirectURL = "http://localhost:8080/egizmo/BuyerLogin.jsp";
	    	response.sendRedirect(redirectURL);
				
			}
			else{
				
				%>
<%-- <div id="header">
<div id="logo"><img src="image/logoN.jpg"></div>

<ul id ="menu">
<li>Hi <font color="blue"><%= name %></font></li>
<li><a href="BuyerHomePage.jsp">Home</a></li>
<li><a href="">Shopping Cart</a></li>
<li><a href="viewWishList.jsp">Wish List</a></li>
<li><a href="">Track-Order</a></li>
<li><a href="">Order-History</a></li>
<li><a href="">My Account</a></li>
<li><a href="LogoutServlet">Logout</a></li>
</ul>

<input id="itemSearch" type="text" placeholder="search" align="middle" data-nav-tabindex="21" tabindex="1">
<input id="searchButton" type="submit" value="Search">
</div> --%>



<div id='cssmenu'>
<center>
<ul>
   <li><a href="BuyerHomePage.jsp">Home</a></li>
   <li><a href="viewShoppingCart.jsp">Shopping Cart</a></li>
   <li><a href="viewWishList.jsp">Wish List</a></li>
   <li><a href="TrackOrderBuyer.jsp">Track-Order</a></li>
   <li><a href="BuyerOrderHistory.jsp">Order-History</a></li>
   <li><a href="viewSellerNotifications.jsp">Messages</a></li>
   <li><a href="viewBuyerAccount.jsp">My Account</a></li>
   <li><a href="LogoutServlet">Logout</a></li>
   <li><form action="searchProduct.jsp" method="post"><input   name="itemSearch" type="text" placeholder="search"></li>
<li><input  type="submit" value="Search" >
</form></li>
</ul>

</div>


<!-- header ends here -->
<!-- horizontal border starts here -->
<div id ="Horizontal-border"></div>
<!-- categories starts here -->
<h2>Categories</h2>
<ul>
	<li><a href="smartphones.jsp">SmartPhones</a>
	</li>
	<li><a href="Computers.jsp">Computers</a>
	</li>
	<li><a href="gamingGadgets.jsp">Gaming Gadgets</a>
	 </li>
	 <li><a href="homeappliances.jsp">Home Appliance</a>
	 </li>
	 
</ul>

</div>

<div id ="phones">
<sql:setDataSource var="myDS" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/eGizmo" user="root" password="root" />

		<sql:query var="wishlist" dataSource="${myDS}">
        select p.productId,p.name,p.cost,p.imagePath from wishlist w   join  product p on w.productId=p.productId where buyerId=<%=(Integer)session.getAttribute("buyerId")%>; 
    </sql:query>
<table id= "phones"   cellpadding="5" >
				<c:forEach var="prod" items="${wishlist.rows}">
					<tr>
						<td><img src=<c:out value="image/${prod.imagePath}"/> /></td>
						<td> <c:out value="${prod.name}" /> <br>
						$ <input type="text" value=<c:out value="${prod.cost}"/> readonly="readonly"><br>
						<a href="fullProductDescription.jsp?productId=<c:out value="${prod.productId}"/>">View Complete Details</a>
						</td>	
						<td>
						<form action="addToCartRemoveFromWishlist.jsp?productId=<c:out value="${prod.productId}"/>" method="post"><input type="submit" value="Add To Cart">
						
						
						
						
						</form>
						<form action="removeFromWishList.jsp?productId=<c:out value="${prod.productId}"/>" method="post"><input type="submit" value="Remove from WishList"></form>
						</td>				
					</tr>
				</c:forEach>   
</table>
</div>
<%

			}
%>


</body>
</html>