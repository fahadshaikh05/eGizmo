<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="Newmain.css" type="text/css" charset="utf-8"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>egizmo.com</title>
</head>
<body>
<%
		String name = (String) session.getAttribute("userName");
		if (name == null)
			name = "";
%>
<div id="header">
<div id="logo"><img src="image/logo1.jpg"></div>

<ul id ="menu">
<li><font color="#D80808" size="3">Hi</font><b><font color="blue" size="5"> <%=name%></font></b></li>
<li><a href="AdminHomePage.jsp">Home</a></li>
<li><a href="LogoutServlet">Logout</a></li>
</ul>
<form action="searchProduct.jsp">
<input id="itemSearch" type="text" placeholder="search" align="middle" data-nav-tabindex="21" tabindex="1">
<input id="searchButton" type="submit" value="Search"> </form>
</div>
<!-- horizontal border starts here -->
<div id ="Horizontal-border"></div>
</body>
<script src="js-image-slider.js"></script>
</html>