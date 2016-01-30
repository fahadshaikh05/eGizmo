<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Seller Links</title>
<link rel="stylesheet" href="Newmain.css" type="text/css" charset="utf-8" />
</head>
<body >
<% String userName = (String)request.getAttribute("userName");
   String msg = (String)session.getAttribute("msg");

   if(userName!=null && msg!=null){
%>
<h3>Hello <%=userName%> login successful.</h3>
<% }%>
<div id="catagories"> 
<a href="addProduct.jsp" target="center">Add Products</a><br><hr>
<a href="viewProduct.jsp" target="center" >List/Edit Products</a><br><hr>
<a href="#" target="center" >Delete Products</a><br><hr>
<a href="#" target="center" >View Orders</a><br><hr>
<a href="#" target="center" >Contact Buyers</a><br><hr>
<a href="#" target="center" >Update Shipping Details</a><br><hr>
<a href="#" target="center" >View Account</a><br><hr>
</div>
</body>
</html>