<%@ page import="com.db.HibernateUtil"%>
<%@ page import="org.hibernate.SessionFactory"%>
<%@ page import="com.dao.ExpenseDao"%>
<%@ page import="com.entity.User"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.Expense"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${loginUser.fullname}:Expense Tracker - Edit Expense</title>
<%@include file="../component/all_css.jsp"%>
</head>
<body class="bg-light">
	<c:if test="${empty loginUser }">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
	<%
	int id = Integer.parseInt(request.getParameter("id"));

	ExpenseDao dao = new ExpenseDao(HibernateUtil.getSessionFactory());
	Expense ex = dao.getExpenseById(id);
	%>

	<%@include file="../component/navbar.jsp"%>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header text-center">
						<p class="fs-3">Edit Expense</p>
						<c:if test="${not empty msg}">
							<p class="text-center fs-4">${msg}</p>
							<c:remove var="msg" />
						</c:if>
					</div>
					<div class="card-body">
						<form action="../updateExpense" method="post">
							<div class="mb-3">
								<label for="category">Category</label> <input type="text"
									id="category" name="category" class="form-control"
									value="<%=ex.getCategory()%>">
							</div>
							<div class="mb-3">
								<label for="date">Date</label> <input type="date" id="date"
									name="date" class="form-control" value="<%=ex.getDate()%>">
							</div>
							<div class="mb-3">
								<label for="time">Time</label> <input type="time" id="time"
									name="time" class="form-control" value="<%=ex.getTime()%>">
							</div>
							<div class="mb-3">
								<label for="description">Description</label> <input type="text"
									id="description" name="description" class="form-control"
									value="<%=ex.getDescription()%>">
							</div>
							<div class="mb-3">
								<label for="price">Price</label> <input type="text" id="price"
									name="price" class="form-control" value="<%=ex.getPrice()%>">
							</div>
							<input type="hidden" name="id" value="<%=ex.getId()%>">
							<button class="btn btn-success col-md-12">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>