<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>eGizmo</title>
 <link rel="stylesheet" href="Newmain.css" type="text/css" charset="utf-8"/>
</head>
<body>

<div id="headerRegister">
<div id="logo"><img src="image/logoN.jpg"></div>
<ul id ="menu">
<li><a href="#Home">Home</a></li>
<li><a href="#sell">Sell</a></li>
<li><a href="#track">Track-Order</a></li>
<li><a href="#signin">Sign In</a></li>
<li><a href="#register.jsp">Register</a></li>
<li><a href="#cart">Cart</a></li>
</ul>
</div>
<div id ="horizBorder"></div>
<div id = "register">
<form action="login.jsp" method="post">
<fieldset id="form">
<legend><font color="orange"><strong>SignUp</strong></font></legend>
 <table>
 <tr><td>First Name:</td><td><input id="fName" type="text" name="first_name" placeholder="First Name"></td></tr>
  <tr><td>Last Name:</td><td><input id="lName" type="text" name="last_name" placeholder="Last Name"></td></tr>
   <tr><td>Email:</td><td><input id="email" type="text" name="email" placeholder="email"></td></tr>
   <tr><td>Username:</td><td><input id="userName" type="text" name="username"></td></tr>
   <tr><td>Password:</td><td><input id="password" type="password" name="password"></td></tr>
   <tr><td>Confirm password:</td><td><input id="confirmPassword" type="password" name="confirmpassword"></td></tr>
    <tr><td>Address:</td><td><input id="address" type="text" name="address"></td></tr>
     <tr><td>City:</td><td><input id="city" type="text" name="city"></td></tr>
      <tr><td>State:</td><td><input id="state" type="text" name="state"></td></tr>
       <tr><td>Pincode:</td><td><input id="pincode" type="text" name="pincode"></td></tr>
        <tr><td>Phone Number:</td><td><input id="phoneNumber" type="text" name="phno" placeholder="555-555-5555"></td></tr>
        <tr><td><input id="createAccount" type="submit" name="createaccount" value="Create Account"></td><td><input id="reset" type="reset" name="reset" value="Reset"></td></tr>
     </table>
     <br> <br>
     If you are registered user, please <a href="login.jsp">login</a>
</fieldset>
</form>
<div id ="horizontalBorderFooter"></div>

<!--footer starts here-->
<div id ="footer">
<div id ="footerlogo"><img src="image/logoN.jpg"></div>
<div id="services">
<h3>Services</h3>
<ul>
<li><a href="#">Online Help</a></li>
<li><a href="#">Contact Us</a></li>
<li><a href="#">Order Status</a></li>
<li><a href="#">FAQ's</a></li>
</ul>
</div>
<div id="Policies">
<h3>Policies</h3>
<ul="Policies" >
<li><a href="#">Terms of Use</a></li>
<li><a href="#">Privecy Policy</a></li>
<li><a href="#">Refund Policy</a></li>
<li><a href="#">Billing System</a></li>
<li><a href="#">Ticket System</a></li>
</ul>
</div>
<div id="AboutUs" >

<h3>AboutUs</h3>
<ul="AboutUs" >
<li><a href="#">Company Information</a></li>
<li><a href="#">Careers</a></li>
<li><a href="#">Store Location</a></li>
<li><a href="#">Copyright</a></li>
</ul>
</div>
</div>

</div>
</body>
</html>