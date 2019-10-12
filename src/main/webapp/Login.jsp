<%@page import="product.ProductHandler"%>
<%@page import="category.CategoryHandler"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<c:import url="Shared.jsp" />

<style type="text/css">

#main {
	margin: 70px;
	width: 800px;
	height: 350px;
	border: 2px solid black;
	background-color: black;
	text-align: center;
	color: white;
	margin-left: 250px;
	padding-left: 50px;
	padding-right: 50px;
	padding-top: 20px;
	box-shadow: 20px 25px #888888;
	
}

.form-control {
	transition: transform .4s;
	height: 45px;
}

.form-control:hover {
	transform: scale(1.06);
}
</style>
</head>
<body style="background-color: #e5e8e5">
	<c:import url="Header.jsp" />
	<c:if test="${not empty invalid}">
		<h1 class="alert alert-danger">INVALID CEREDENTAILs</h1>
	</c:if>
	<div id="main">
		<form action="CheckLoginFormDB" method="post">


			<h4>Enter user Email</h4>
			<br> <input type="text" name="userEmail" class="form-control" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" placeholder="Enter Email"> <br>

			<h4>Enter password</h4>
			<br> <input type="password" name="userPassword" class="form-control" placeholder="Enter Password"> <br />
			<button style="height: 40px; width: 120px; text-align: center;"
				class="btn btn-danger">
				<i class="fas fa-unlock-alt">  LOGIN</i>
			</button>

		</form>
	</div>
</body>
</html>