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
		
<div id="header">
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
	
	
	<sql:update dataSource="${myDS}" var="wishlist">
            INSERT INTO shoppingCart (productId,buyerId) VALUES (?,<%=(Integer)session.getAttribute("buyerId")%>);
            <sql:param value="${param.productId}" />
            
        </sql:update>
	
	
	<c:if test="${wishlist>=1}">		
				<c:redirect url="BuyerHomePage.jsp" >
                <c:param name="susMsg" value="added to shopping cart
            successfully." />
            </c:redirect>
				
		</c:if>
	
	<%
	
	}
	%>
	
	
	
		
</body>
</html>