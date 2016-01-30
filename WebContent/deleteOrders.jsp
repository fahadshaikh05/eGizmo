<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Deleted Order</title>
<link rel="stylesheet" href="Newmain.css" type="text/css" />
</head>
<body>
<%

String loggedIn = (String) session.getAttribute("loggedIn");
if(loggedIn == null) loggedIn = "";

if(!loggedIn.equals("true"))	{

String redirectURL = "http://localhost:8080/egizmo/BuyerLogin.jsp";
response.sendRedirect(redirectURL);
	
}
else{
	
	%>


	<div id="headerRegister">
		<div id="logo">
			<img src="image/logoN.jpg">
		</div>
		<ul id="menu">
			<li><a href="DemoSeller.jsp">Seller Home</a></li>
			<li><a href="LogoutServlet">Logout</a></li>
			<li><a href="#">View Account</a></li>

		</ul>
	</div>
	<div id="horizBorder"></div>
	<div id="register">

		<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/eGizmo" user="root" password="root" />

        <sql:update dataSource="${dbsource}" var="count">
            DELETE FROM orders
            WHERE orderId='${param.orderId}'
        </sql:update>
        <c:if test="${count>=1}">
            <c:redirect url="DemoSeller.jsp" >
                <c:param name="susMsg" value="Congratulations ! Data deleted
            successfully." />
            </c:redirect>    
        </c:if>
   
		<div id="horizontalBorderFooter"></div>
		<!--footer starts here-->
		<div id="footer">
			<div id="footerlogo">
				<img src="image/logoN.jpg">
			</div>
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
					<li><a href="#">Privacy Policy</a></li>
					<li><a href="#">Refund Policy</a></li>
					<li><a href="#">Billing System</a></li>
					<li><a href="#">Ticket System</a></li>
				</ul>
			</div>
			<div id="AboutUs">

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
	
	
	<%} %>
</body>
</html>