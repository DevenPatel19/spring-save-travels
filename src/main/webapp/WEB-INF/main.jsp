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
<title>Save Travels</title>
</head>
<body>
	<div class="container mt-5 ">
	<div class="d-flex justify-content-center">
	<h1 class="text-primary">Save Travels</h1>
	</div>
	
	<table class="mt-3 table table-bordered m-auto" style="width:45rem;">
		<thead>
			<tr>
				<th> Expense </th>
				<th> Vendor </th>
				<th> Amount </th>
				<th> Actions </th>
			<tr>
		</thead>
		<tbody>
			<c:forEach var="eachExpense" items="${expenseList}">
				<tr>
					<td> 
						<a href="/expenses/${eachExpense.id}/edit">
							<c:out value="${eachExpense.name}"/>
						</a>
					</td>
					<td> <c:out value="${eachExpense.vendor}"/></td>
					<td> $<c:out value="${eachExpense.amount}"/></td>
					<td> <a href="/expenses/${eachExpense.id}/edit">edit</a> </td>
					<td> 
						<form action="/expenses/${eachExpense.id}" method="POST">
							<input type="hidden" name="_method" value="DELETE" />
							<button class="btn btn-danger "type="submit">Delete</button>
						</form>
					</td>
				</tr>
				
			</c:forEach>
		
		
		</tbody>
	</table>
	</div>
	<div  style="width:35rem;" class="continer mt-5 m-auto">
	<div class="d-flex justify-content-center">
	<h1 class="text-success">Create a new Expense</h1>
	</div>
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
		<div class="d-flex justify-content-end">
		<button class="btn btn-success mt-3 d-flex justify-content-end" type="submit">Submit</button>
		</div>
	</form:form>
	
	</div>
</body>
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</html>