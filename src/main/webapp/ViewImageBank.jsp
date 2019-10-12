<%@page import="imagebank.ImageBankHandler"%>
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
	ImageBankHandler ibh = new ImageBankHandler();

	request.setAttribute("imageList", ibh.fetchAllImagesInBank());
%>

<style type="text/css">
/* .card {
	width: 33% !important;
	margin: 20px !important;
	display: inline-flex;
}

img {
	width: 100% !important;
	margin: 0;
	transition: transform .4s;
	
}
img:hover{
-ms-transform: scale(1.08);
	transform: scale(2.25); 
}

.card-body {
	padding: 0;
} */
*{
	margin: 0px;
}
body{
background: #e5e5e5
}
.card {
	width: 350px !important; margin : 20px ;
	height:420px !important;
	margin-left:60px;
	display: inline-flex;
	background-color: #000;
	
}
img{
transition: transform .4s;
	width: 300px ;
	height: 270px ;

}


img:hover{
-ms-transform: scale(1.08);
	transform: scale(1.1); 
}
.card-body {
	padding: 0;
	margin: 0;
}
</style>

</head>
<body>

	<c:import url="Header.jsp" />

	<br>
<div style="text-align: center;">
	<h1 >Current Images</h1>

	<br>
	
	<a  href="AddImageToBank.jsp" class="btn btn-link">Add Image To Bank</a>
</div>
<br>

	<c:choose>

		<c:when test="${empty imageList}">

			<h1 class="alert alert-danger">No Images in Bank</h1>

		</c:when>

		<c:otherwise>


			<c:forEach items="${imageList}" var="image">

				<div class="card">
					<!-- <div class="card-header">Header</div> -->
					<div class="card-body" style="padding: 25px;">

						<img src="${image.getUrl()}">

					</div>
					<br>
					<div class="card-footer" style="text-align: center;">

						<a href="DeleteImageFromBank?id=${image.getId()}"
							class="btn btn-danger">Delete</a>

					</div>
				</div>

			</c:forEach>


		</c:otherwise>

	</c:choose>



</body>
</html>