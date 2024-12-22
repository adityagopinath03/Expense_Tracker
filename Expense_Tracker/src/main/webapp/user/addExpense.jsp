<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${loginUser.fullname}:ExpenseTracker-AddExpense</title>
<%@include file="../component/all_css.jsp"%>
</head>
<body class="bg-light">
	<c:if test="${empty loginUser }">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
	<%@include file="../component/navbar.jsp"%>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header text-center">
						<p class="fs-3">Add Expense</p>
						<c:if test="${not empty msg}">
							<p class="text-center fs-4">${msg}</p>
							<c:remove var="msg" />
						</c:if>
					</div>
					<div class="card-body">
						<form action="../saveExpense" method="post">
							<div class="mb-3">
								<label for="category">Category</label> <input type="text"
									id="category" name="category" class="form-control">
							</div>
							<div class="mb-3">
								<label for="date">Date</label> <input type="date" id="date"
									name="date" class="form-control">
							</div>
							<div class="mb-3">
								<label for="time">Time</label> <input type="time" id="time"
									name="time" class="form-control">
							</div>
							<div class="mb-3">
								<label for="description">Description</label> <input type="text"
									id="description" name="description" class="form-control">
							</div>
							<div class="mb-3">
								<label for="price">Price</label> <input type="text" id="price"
									name="price" class="form-control">
							</div>
							<button class="btn btn-success col-md-12">Add</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>