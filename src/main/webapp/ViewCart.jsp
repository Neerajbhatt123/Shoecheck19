<%@page import="product.ProductHandler"%>
<%@page import="product.Product"%>
<%@page import="cart.Cart"%>
<%@page import="user.User"%>
<%@page import="cart.CartHandler"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style type="text/css">
</style>

<c:import url="Shared.jsp" />
<%
	CartHandler ch = new CartHandler();
	//request.setAttribute("CList", ch.fetchAllCarts());

	User u = (User) request.getSession().getAttribute("currentUser");

	if (u == null) {
		request.setAttribute("CList", ch.fetchAllCarts());
	} else {
		request.setAttribute("CList", ch.fetchAllCartItemsForUser(u.getId()));
	}

	float grandTotal = 0.0f;
	ProductHandler ph = new ProductHandler();
%>
<style type="text/css">

img{
transition: transform .4s;

}


img:hover{
-ms-transform: scale(1.08);
	transform: scale(1.06); 
}
</style>
</head>
<body>

	<c:import url="Header.jsp" />


	<div
		style="text-align: center;border: 5px solid black; border: none; background: #e5e5e5;">
		<h1>My Cart</h1>
		<a href="ViewProduct.jsp" style="color: black;">More Items</a> <br>
	</div>
	<c:choose>
		<c:when test="${empty CList}">
			<h1 class="alert alert-danger">
				Cart is empty !!! Shop more To add<br> <br> Happy
				Shopping...............
			</h1>
		</c:when>

		<c:otherwise>

			<!-- 			<div style="border: 5px solid black;background: grey;">
			<h2 style="text-align: center;">Items</h2>
</div>
		 -->

			<c:forEach items="${CList}" var="cart">
				<!--  -->
				<%
					Cart x = (Cart) (pageContext.getAttribute("cart"));
								Product p = ph.fetchProduct((short) (x.getProductId()));
								//pageContext.setAttribute("pro",p);
				%>

				<div
					style="border: 5px solid black; background: #e5e5e5;">
					<div class="card"
						style="max-width: 40%; margin-left: 420px; margin-top: 20px;padding: 5px">
						<div class="card-body">
							<img style="width: 100%; margin: auto; height: 250px;"
								src="<%=p.getImageUrl()%>"> <br> <br>
							<div style="text-align: center;">
								<h3><%=p.getName()%></h3>

								<h3 class="badge badge-pill badge-danger"><%=p.getCategory().getName()%></h3>
								<br>

								<h6 style="font-weight: bold;">
									Price:<i id="R"></i>Rs.  <%=p.getPrice()%>/-</h6>

								<h8 style="font-weight: bold;"> Quantity =
								${cart.getQuantity()}</h8>
								<br>

								<h8 style="font-weight: bold;"> Price = <%=p.getPrice()%> <br>
								</h8>
								<h3>
									Subtotal = Rs.
									<%=p.getPrice() * x.getQuantity()%>

									<%
										grandTotal += p.getPrice() * x.getQuantity();
									%>/-
								</h3>
							</div>

							<div></div>
							<!-- <a href="" class="btn  btn-outline-primary">edit</a> -->
							<a href="DeleteCart?id=${cart.getId()}" class="btn btn-danger"
								style="width: 100%;">Delete</a>
						</div>

						<p>${pro.getDescription()}</p>


					</div>
				</div>


				<%-- 							<td>${cart.getQuantity()}</td>

							<td><%=p.getPrice() * x.getQuantity()%></td>
							<%
								grandTotal += p.getPrice() * x.getQuantity();
							%>

							<td>
								<!-- <a href="" class="btn  btn-outline-primary">edit</a> --> <a
								href="DeleteCart?id=${cart.getId()}"
								class="btn btn-outline-danger">delete</a>
							</td> --%>

			</c:forEach>
			<br>
			<div
				style="text-align: center; border: 5px solid black; background-color: #e5e5e5;">

				<h1 style="text-align: bold";>
					Grand Total:
					<%=grandTotal%></h1>

				<a href="Address.jsp"
					class="btn btn-success" style="border: 1px solid black">Confirm
					Order</a> <br>
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>