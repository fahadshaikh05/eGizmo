<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Delete Seller</title>
</head>
<body>
<%
		int userId = (Integer) session.getAttribute("adminId");
	%>
<%@include file="AdminHeader.jsp"%>
<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/eGizmo" user="root" password="root" />

        <sql:update dataSource="${dbsource}" var="count">
            UPDATE seller SET isActive='NO'
            WHERE sellerId='${param.sellerId}'
        </sql:update>
        <c:if test="${count>=1}">
            <c:redirect url="AdminHomePage.jsp" >
                <c:param name="susMsg" value="Congratulations ! User deleted
            successfully." />
            </c:redirect>    
        </c:if>

</body>
</html>