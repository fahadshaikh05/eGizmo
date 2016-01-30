<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>egizmo.com</title>
<link rel="stylesheet" href="Newmain.css" type="text/css" charset="utf-8" />
<link rel="stylesheet" href="js-image-slider.css" type="text/css" charset="utf-8" />
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="styles.css">
</head>
<body>
<%
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
			
	
<%--  <div id="header">
<div id="logo"><img src="image/logoN.jpg"></div>

<ul id ="menu">
<li>Hi <font color="blue"><%= name %></font></li>
<li><a href="BuyerHomePage.jsp">Home</a></li>
<li><a href="viewShoppingCart.jsp">Shopping Cart</a></li>
<li><a href="viewWishList.jsp">Wish List</a></li>
<li><a href="TrackOrderBuyer.jsp">Track-Order</a></li>
<li><a href="BuyerOrderHistory.jsp">Order-History</a></li>
<li><a href="viewSellerAccount.jsp">My Account</a></li>
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

<!-- horizontal border starts here -->
<div id ="Horizontal-border"></div>
<!-- horizontal border ends here -->

<div>

<center>Hi...<font color="green" size="5"><%=name %></font></center>
</div>
<!-- slider starts here -->
        <div id="slider"">                
           <img src="image/iPhone-6N.png" alt="" />
            <img src="image/ipad.jpg" alt="" />
            <img src="image/white-playstation-4.jpg" alt="" />
            <img src="image/macbookair.png" alt="" />
        </div>
 
<!-- slider ends here -->

<!-- categories starts here -->
<div id=categories>
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

<!-- categories ends here -->

<div id="vertical-line"></div>

<!-- home-section starts here -->

	<div id="homesection">
		<div id="1row1col" style="float: left">
			<h3>
				<a href="smartphones.jsp">SmartPhones</a>
			</h3>
			<a href="smartphones.jsp"><img src="image/Appleiph.jpg"></a>
		</div>
		<div id="dividerline"></div>
		<div id="1row2col" style="float: left">
			<h3>
				<a href="#">Computers</a>
			</h3>
			<img src="image/mac.jpg">
		</div>
		<div id="dividerline"></div>
		<div id="2row1col" style="float: left">
			<h3>
				<a href="#">Gaming Gadgets</a>
			</h3>
			<img src="image/xbox1.jpg">
		</div>
		<div id="dividerline" style="float: left"></div>
		<div id="2row2col">
			<h3>
				<a href="#">Home Appliances</a>
			</h3>
			<img src="image/tv1.jpg">
		</div>

	</div>
	<!-- home-section ends here -->

<div id ="horizontalBorderFooter"></div>

<!--footer starts here-->

<!--footer ends here-->


</body>
<script src="js-image-slider.js"></script>
<%


}
		%>

</html>