<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css"/>
<title>Show Expense</title>
</head>
<body>
	<div class="container">
		<div>
		<h1 class="text-primary">Expense Details</h1>
		<a href="/expenses">Go back</a>
		</div>
		<h3> Expense Name: <c:out value="${oneExpense.name}"/></h3>
		<h3> Expense Description: <c:out value="${oneExpense.description}"/></h3>
		<h3> Vendor: <c:out value="${oneExpense.vendor}"/></h3>
		<h3> Amount spent: $<c:out value="${oneExpense.amount}"/></h3>
	</div>

</body>
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</html>