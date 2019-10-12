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


<%
	ProductHandler ph = new ProductHandler();

	request.setAttribute("productList", ph.fetchAllProducts());
%>

<style type="text/css">
* {
	margin: 0px;
}

.card {
	width: 390px !important;
	margin: 20px !important;
	height: 650px !important;
	display: inline-flex;
	background-color: #000;
}

img {
	transition: transform .4s;
	width: 300px;
	height: 270px;
}

img:hover {
	-ms-transform: scale(1.08);
	transform: scale(1.08);
}

.card-body {
	padding: 0;
	margin: 0;
}

</style>

</head>
<body>

	<c:import url="Header.jsp" />

	<div
		style="border: 5px solid black; border: none; background: #e5e5e5; padding-bottom: 5px; text-align: center; margin: 0px;">
		<h1>Shoes To Shop</h1>
		<a style="color: black;" href="AddProduct.jsp">Add Product</a>

	</div>
	<div
		style="border: 5px solid black none; background: #e5e5e5;. border-top: none; margin: 0px; color: white">
	<c:choose>
			<c:when test="${empty productList}">
				<h1 class="alert alert-danger">No Products in DB</h1>
			</c:when>
			<c:otherwise>
				<c:forEach items="${productList}" var="product">

					<div class="card">
						<!-- <div class="card-header">Header</div> -->
						<div class="card-body">
							<img alt="imageurl" class="imageProduct"
								style="width: 100%; margin: auto; padding: 5px;"
								src="${product.getImageUrl()}">

							<div style="text-align: center;">
								<h1>${product.getName()}</h1>
								<br>

								<h3 class="badge badge-success">${product.getCategory().getName()}</h3>
								<br>

								<h6>Price: Rs.${product.getPrice()}/-</h6>

								<br>

								<p>${product.getDescription()}</p>

								<h6>
									In Stock: <span class="badge badge-warning"
										style="padding: 5px;">${product.getStockqty()}</span>
								</h6>
							</div>
						</div>

						<div class="card-footer" style="padding: 5px; margin-left: 5px">
							<c:if test="${sessionScope.currentUser.getRole()=='ADMIN'}">
								<a style="width: 48%"
									href="EditProductFromDB.jsp?id=${product.getId()}"
									class="btn btn-primary"><i class="fas fa-edit"></i>Edit</a>
									&nbsp;
								<a style="width: 48%"
									href="DeleteProductFromDB?id=${product.getId()}"
									class="btn btn-danger"><i class="fas fa-trash"></i>Delete</a>

							</c:if>

							<c:if test="${sessionScope.currentUser.getRole()=='user'}">
								<form action="AddToCart" method="post">
									<div class="container">
										<div class="row">
											<div class="col-lg-4 ">
												<input type="number" class="form-control" placeholder="qty"
													name="quantity"></input>
											</div>
											<div class="col-lg-8">
												<button class="btn btn-warning" style="width: 100%;">Add
													Cart</button>
											</div>
										</div>
										<input type="hidden"
											value="${sessionScope.currentUser.getId()}" name="userId">
										<input type="hidden" value="${product.getId()}"
											name="productId">
									</div>
								</form>
							</c:if>

						</div>
					</div>

				</c:forEach>

			</c:otherwise>

		</c:choose>
	</div>
	<br>
</body>
</html>