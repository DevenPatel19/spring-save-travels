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
<title>Save Travels</title>
</head>
<body>
	<div class="container mt-5 mb-3">
	<h1 class="text-primary">Save Travels</h1>
	<p><a href="/expenses/new">Create new form</a></p>
	<table class="mt-3 table table-bordered" style="width:30rem;">
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
	<div class="container mb-3">	
		<h3 class="text-primary">Add an expense:</h3>
	</div>
	
</body>
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</html>