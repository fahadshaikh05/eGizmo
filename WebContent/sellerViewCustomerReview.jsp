<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Reviews</title>
<link rel="stylesheet" href="Newmain.css" type="text/css"
	charset="utf-8" />
<link rel="stylesheet" href="styles.css">
</head>
<body>
	<%
		int sellerId = (Integer) session.getAttribute("sellerId");
 
		String name = (String) session.getAttribute("userName");
		if (name == null)
			name = ""; 

		String loggedIn = (String) session.getAttribute("loggedIn");
		if (loggedIn == null)
			loggedIn = "";

		if (!loggedIn.equals("true")) {

			String redirectURL = "http://localhost:8080/egizmo/sellerLogin.jsp";
			response.sendRedirect(redirectURL);

		} else {
	%>
	<div id='cssmenu' align="center">
		<ul id="menu">
			<%-- <li><font color="#D80818" size="3">Hi</font><b><font color="blue" size="5"> <%=name%></font></b></li> --%>
			<li><a href="DemoSeller.jsp">Seller Home</a></li>
			<li><a href="viewSellerAccount.jsp">View Account</a></li>
			<li><a href="LogoutServlet">Logout</a></li>
		</ul>

	</div>
	<!-- header ends here -->
	<!-- horizontal border starts here -->
	<div id="Horizontal-border"></div>
	<!-- categories starts here -->


		<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/eGizmo" user="root" password="root" />

		<sql:query dataSource="${dbsource}" var="result">
            SELECT r.productId,r.review,r.ranking,p.name,p.imagePath FROM  review  r join  product p on r.productId=p.productId where sellerId=<%=(Integer)session.getAttribute("sellerId")%>;
        </sql:query>
		<center>
			<table id="customers" >
				<caption>Customer Review's</caption>
				<tr>
					<th>Product ID</th>
					<th>Name</th>
					<th>Image
					</th>
					<th>Review</th>
					<th>Ranking</th>
				</tr>
				<c:forEach var="row" items="${result.rows}">
					<tr>
						<td><c:out value="${row.productId}" /></td>
						<td><c:out value="${row.name}" /></td>
						<td><img src=<c:out value="image/${row.imagePath}"/> /></td>
						<td><c:out value="${row.review}" /></td>
						<td><c:out value="${row.ranking}" /></td>
					</tr>
				</c:forEach>
			</table>
		</center>
	</div>

</body>
<%
	
			}
	%>
</html>