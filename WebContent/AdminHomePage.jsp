<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>egizmo.com</title>
<link rel="stylesheet" href="Newmain.css" type="text/css" charset="utf-8" />
</head>
<body>
<%
		int userId = (Integer) session.getAttribute("adminId");
		
		/* String name = (String) session.getAttribute("userName");
		if (name == null)
			name = ""; */
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
<div id="Adminwhole">
<!-- categories starts here -->
<div id=categories >
<h2>Categories</h2>
<ul>
	<li><a href="Phone.jsp">SmartPhones</a>
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
<img src="image/Admin22.jpg">

</div>

<!-- categories ends here -->
<!-- admin container starts here -->
<div id="adminHome">
<h2>Administrator Account</h2>

<table id="adminhomeTable">

<tr><td>Seller</td><td>Buyer</td></tr>
<tr><td><a href="adminViewSeller.jsp">View/Delete Seller's</a> </td><td><a href="adminViewBuyers.jsp">View/ Delete Buyer's</a></td></tr>
<tr><td><a href="adminDisplayProduct.jsp">View/Edit/Delete Products</a> </td><td><a href="adminViewOrders.jsp">View/Edit/Delete Order</a></td></tr>
<tr><td><a href="adminContactSeller.jsp">Contact Seller</a> </td><td><a href="adminContactBuyer.jsp">Contact Seller</a></td></tr>
</table>
<!-- <tr>
<td> <h2>My Account</h2>  </td>
<td><h2>My Account</h2> </td>
</tr>
<tr>
<td>  <a href="#">View Product List</a> </td>
</tr>
<tr>
<td> <a href="#">Add Product</a>  </td>
</tr>
<tr>
<td> <a href="#">&nbspView Sellers</a>  </td>
</tr>
<tr>
<td> <a href="#">&nbspview Buyers</a>  </td>
</tr>
<tr>
<td> <a href="#">&nbspNotifications</a> </td>
</tr>
<tr>
<td> <a href="#">&nbsp&nbsp&nbspOrders</a> </td>
</tr>-->


</div>

<!-- admin container ends here -->
</div>
</body>
<%
	}
%>
</html>