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
<div id ="Horizontal-border"></div>
<!-- categories starts here -->

<div id ="phones">
<sql:setDataSource var="myDS" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/eGizmo" user="root" password="root" />
	
	
	<sql:query var="smartphones" dataSource="${myDS}">
                 select userName,description,buyerId from contactsellers where sellerId='<%=session.getAttribute("sellerId")%>';
        </sql:query>
        
        
	<table id="customers">
					<caption><font color="orange" size="5">Notifications</font></caption>
					<tr >
						<th>Buyer ID</th>
						<th>Buyer Name</th>
						<th>Message</th>
						
					</tr>
					
					<c:forEach var="prod" items="${smartphones.rows}">
						<tr>
							<td><c:out value="${prod.buyerId}"/></td>
							<td><c:out value="${prod.userName}" /></td>
							<td><c:out value="${prod.description}" /></td>
													
					</tr>
					</c:forEach>
				</table>
	
	
	
</div>
<br><br>
<center><form action="contactBuyer.jsp" ><input type="submit" value="Contact Buyer"></font></center>
</body>
<%

			}
%>

</html>