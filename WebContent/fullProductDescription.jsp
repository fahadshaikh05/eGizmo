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
		String name = (String) session.getAttribute("userName");
		if(name == null) name = "";
	
		/* int buyerId = (Integer)session.getAttribute("buyerId");
		System.out.println(buyerId); */
		
		%>
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
<div id=categories>
<h2>Categories</h2>
<ul>
	<li><a href="smartphones.jsp">SmartPhones</a>
		    <ul>
		    <li><a href="#">iPhone</a></li>
		    <li><a href="#">Samsung</a></li>
		    </ul>
	</li>
	<li><a href="Computers.jsp">Computers</a>
		    <ul>
		    <li><a href="#">Apple</a></li>
		    <li><a href="#">Dell</a></li>
		    <li><a href="#">Lenovo</a></li>
		    <li><a href="#">Sony</a></li>
		    </ul>
	</li>
	<li><a href="gamingGadgets.jsp">Gaming Gadgets</a>
		    <ul>
		    <li><a href="#">XBox</a></li>
		    <li><a href="#">Playstation</a></li>
		    </ul>
	 </li>
	 
	 <li><a href="#">Home Appliance</a>
		    <ul>
		    <li><a href="#">XBox</a></li>
		    <li><a href="#">Playstation</a></li>
		    </ul>
	 </li>
	 
</ul>
</div>

<div id ="phones">
<sql:setDataSource var="myDS" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/eGizmo" user="root" password="root" />
			
			

		<sql:query var="smartphones" dataSource="${myDS}">
        	SELECT p.productId,p.name,p.cost,p.shippingCost,p.imagePath,p.quantity,p.description,r.review,r.ranking,s.companyName FROM   product p join review  r on p.productId=r.productId and p.productId=? join seller s on p.sellerId=s.sellerId;
        <sql:param value="${param.productId}" />
    	</sql:query>
	    
    	
    
		<table id= "phones"   cellpadding="5">
       
           <c:forEach var="prod" items="${smartphones.rows}">
					<tr>
						<td><img src=<c:out value="image/${prod.imagePath}"/> /></td>
						<td>Product ID:
						<c:out value="${prod.productId}" /> <br>Product Name: 
						<c:out value="${prod.name}" /> <br>Price:
						<c:out value="${prod.cost}" /> <br>Shipping Charges:
						<c:out value="${prod.shippingCost}" /><br>Quantity:
						<c:out value="${prod.quantity}" /><br>Description:
						<c:out value="${prod.description}" /><br>Review:
						<c:out value="${prod.review}" /><br>Ranking:
						<c:out value="${prod.ranking}" />/5<br>Seller: 
						<c:out value="${prod.companyName}" />
						<br>
						</td>
						<td><form action="wishList.jsp?productId=<c:out value="${prod.productId}"/>" method="post"><input type="submit" value="Add To WishList"></form>
						<form action="addToCart.jsp?productId=<c:out value="${prod.productId}"/>" method="post"><input type="submit" value="Add To Cart"></form></td>
					</tr>
				</c:forEach>       
</table>
</div>



</body>
</html>