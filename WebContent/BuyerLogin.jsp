<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>egizmo</title>
<link rel="stylesheet" href="Newmain.css" type="text/css" charset="utf-8" />
</head>
<body>
<div id="logo"><img src="image/logo1.jpg"></div>
<div id="loginForm">
<ul>
<li>Sign In</li>
<li><a href="HomePage.jsp">Home</a></li>
</ul>

</div>
<div id="loginNew">
<form id="signInForm" name="BuyerLoginServlet" method="post" action="BuyerLoginServlet">
<table id="signin" >
<tr>
<td>
<h4>Email or user ID</h4>
<input id="userName" type="text" name="userName" placeholder="Username" required="required"/>
<h4>Password</h4>
<input id="password" type="password" name="password" placeholder="Password" required="required"/><br>

</td>
<td><form id="registerlink"><h4> New Members register here</h4><br> </form></td>
</tr>
<tr>
<td><input id="LoginSubmit" type="submit" value="Sign In"/></td>
<td><form action="signup.jsp"><input id="RegisterSubmit" type="submit" value="Register"/></form></td>
</tr>
</table>
</form>
</div> 

<%@include file="Footer.jsp"%>
 
</body>
</html>