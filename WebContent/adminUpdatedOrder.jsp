<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>
<!--  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">-->
<title>egizmo-Smartphone</title>
<link rel="stylesheet" href="Newmain.css" type="text/css" charset="utf-8">
</head>
<body>
<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/eGizmo" user="root" password="root" />

		<sql:update dataSource="${dbsource}" var="count">
            UPDATE orders SET name = ?,totalcost = ?,receivername = ?,email = ?,phonenumber=?,address=?,
            city=?, pincode=?, state=?
            WHERE orderId=?
            
            <sql:param value="${param.name}" />
			<sql:param value="${param.totalcost}" />
			<sql:param value="${param.receivername}" />
			<sql:param value="${param.email}" />
			<sql:param value="${param.phonenumber}" />
			<sql:param value="${param.address}" />
			<sql:param value="${param.city}" />
			<sql:param value="${param.pincode}" />
			<sql:param value="${param.state}" />
			<sql:param value="${param.orderId}" />
		</sql:update>
		<c:if test="${count>=1}">
			<font size="5" color='green'> Congratulations ! Data updated
				successfully.</font>
				
				<c:redirect url="AdminHomePage.jsp" >
                <c:param name="susMsg" value="Congratulations ! Data inserted
            successfully." />
            </c:redirect>
		</c:if>
		
</body>
</html>