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
<title>Edit Expense</title>
</head>
<body class="container mt-5">
	<h1 class="text-success">Edit Expense</h1>
	<form:form style="width:35rem;" class="mb-5" action="/expenses/${expense.id}/edit" method="PUT" modelAttribute="expense">
<!-- 		<input type="hidden" name="_method" value="put" />  -->
		<div>
			<form:label path="name">Expense Name</form:label>
			<form:input type="text" path="name" class="form-control"/>
			<form:errors path="name"/>
		</div>
			<form:label path="vendor">Vendor: </form:label>
			<form:input type="text" path="vendor" class="form-control"/><div>
			<form:errors path="vendor"/>
		</div>
		<div>
			<form:label path="amount">Amount:</form:label>
			<form:input type="number" path="amount" class="form-control"/>
		</div>
			<form:errors path="amount"/>
		<div>
			<form:label path="description">Description:</form:label>
			<form:textarea path="description" class="form-control"></form:textarea>
			<form:errors path="description"/>
		</div>
		<div class="d-flex justify-content-end">
		<button class="btn btn-warning mt-3 d-flex justify-content-end" type="submit">Submit</button>
		</div>
	</form:form>
	<a href="/">Go Home</a>
</body>
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</html>