<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css"/>
<title>Insert title here</title>
</head>
<body>
	<div  style="width:35rem;" class="continer mt-5 m-auto">
	<h1 class="text-success">Create a new Expense</h1>
	<form:form  class="mb-5" action="/expenses/new" method="POST" modelAttribute="newExpense">
		<div >
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
			<form:input type="text" path="amount" class="form-control"/>
			<form:errors path="amount"/>
		</div>
		<div>
			<form:label path="description">Description:</form:label>
			<form:textarea path="description" class="form-control"></form:textarea>
			<form:errors path="description"/>
		</div>
		<button class="btn btn-success mt-3" type="submit">Submit</button>
	</form:form>
	<a href="/expenses">Go Home</a>
	</div>
</body>
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</html>