<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<sql:setDataSource var="myDS" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/eGizmo" user="root" password="" />
	
	
	<sql:update dataSource="${myDS}" var="contactBuyer">
            INSERT INTO contactsellers (userName,description,sellerId) VALUES (?,?,123);
            <sql:param value="${param.userName}" />
            <sql:param value="${param.description}" />
        </sql:update>
	
	
	<c:if test="${contactBuyer>=1}">		
				<c:redirect url="AdminHomePage.jsp" >
                <c:param name="susMsg" value="your response saved." />
            </c:redirect>
				
		</c:if>
</body>
</html>