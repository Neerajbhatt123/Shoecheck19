<%@page import="category.Category"%>
<%@page import="category.CategoryHandler"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<c:import url="Shared.jsp"></c:import>




<%
	CategoryHandler ch = new CategoryHandler();

	request.setAttribute("catList", ch.fetchAllCategories());
%>
</head>
<body>

	<br>
	<br>

	<h1>Current Categories</h1>
	<br>
	<a href="AddCategory.jsp" class="btn-btn-Link">Add Category</a>

	<c:choose>
		<c:when test="${empty catList }">
			<h1 class="alert alert-danger">NO Categories found in db</h1>
		</c:when>

		<c:otherwise>

			<hr>

			<table class="table table-striped">
				<thead>
					<tr>
						<th>#</th>
						<th>Name</th>
						<th>Description</th>
						<th>Opreations</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${catList}" var="cat">
						<tr>
							<td>${cat.getId()}</td>
							<td>${cat.getName()}</td>
							<td>${cat.getDescription()}</td>

							<td><a href="EditCategory.jsp?id=${cat.getId()}"
								class="btn btn-primary">Edit</a> <a
								href="DeleteCategoryFromDB.java?id=${cat.getId()}"
								class="btn btn-danger">Delete</a>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:otherwise>
	</c:choose>
</body>
</html>