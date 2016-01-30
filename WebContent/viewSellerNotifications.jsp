<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
</div>
 --%>
 
 <div id='cssmenu'>
<center>
<ul>
   <li><a href="BuyerHomePage.jsp">Home</a></li>
   <li><a href="viewShoppingCart.jsp">Shopping Cart</a></li>
   <li><a href="viewWishList.jsp">Wish List</a></li>
   <li><a href="TrackOrderBuyer.jsp">Track-Order</a></li>
   <li><a href="BuyerOrderHistory.jsp">Order-History</a></li>
   <li><a href="viewSellerNotifications.jsp">Notification</a></li>
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

<div id ="phones">
<sql:setDataSource var="myDS" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/eGizmo" user="root" password="root" />
	
	
	<sql:query var="smartphones" dataSource="${myDS}">
            select c.sellerId,s.userName,c.description from contactbuyers c join seller s on c.sellerId=s.sellerId where c.username='<%=session.getAttribute("userName")%>';
        </sql:query>
        
        
	<table id="customers">
					<caption><font color="orange" size="5">Notifications</font></caption>
					<tr >
						<th>Sell ID</th>
						<th>Seller Name</th>
						<th>Message</th>
						
					</tr>
					
					<c:forEach var="prod" items="${smartphones.rows}">
						<tr>
							<td><c:out value="${prod.sellerId}"/></td>
							<td><c:out value="${prod.userName}" /></td>
							<td><c:out value="${prod.description}" /></td>
													
					</tr>
					</c:forEach>
				</table>
	
	
	
</div>
<br><br>
<center><form action="contactSeller.jsp" ><input type="submit" value="Contact Seller"></font></center>
</body>
<%

			}
%>

</html>