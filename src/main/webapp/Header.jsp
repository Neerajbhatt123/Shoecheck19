<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav style="width: 100%; padding: 20px; height: 90px"
	class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top">
	<!-- Brand -->
	
	<c:if test="${not empty sessionScope.currentUser}">
	<a class="navbar-brand" href="#">Welcome
			${sessionScope.currentUser.getName()}</a>
	</c:if>
	<a class="navbar-brand" href="AddCategory.jsp"><img id="logo"
		style="width: 40px; height: 30px !important;" src="hum.jpg"></a>
	<%-- 
	<c:if test="${not empty sessionScope.currentUser} ">
		<a class="navbar-brand" href="#">Welcome ${sessionScope.currentUser.getEmail()}</a>
		<a class="navbar-brand" href="Logout">Logout</a>
	</c:if>
 --%>
	<div class="collapse navbar-collapse" id="myNavbar">

		<!-- Links -->
		<ul class="navbar-nav" style="padding-left: 12px">


			<!-- Dropdown -->
			<li class="nav-item dropdown"><c:if
					test="${sessionScope.currentUser.getRole() == 'ADMIN'}">
					<a class="nav-link dropdown-toggle" href="#" id="navbardrop"
						data-toggle="dropdown"> Category </a>
				</c:if>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="ViewCategory.jsp">View
						Categories</a> <a class="dropdown-item" href="AddCategory.jsp">Add
						Category</a>
				</div></li>

			<!-- Dropdown -->
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbardrop"
				data-toggle="dropdown"> Product </a>
				<div class="dropdown-menu">
					<c:if test="${sessionScope.currentUser.getRole() == 'ADMIN'}">
						<a class="dropdown-item" href="AddProduct.jsp">Add Product</a>
					</c:if>
					<a class="dropdown-item" href="ViewProduct.jsp">View Product</a>
				</div></li>

			<!-- Dropdown -->
			<li class="nav-item dropdown"><c:if
					test="${sessionScope.currentUser.getRole() == 'ADMIN'}">
					<a class="nav-link dropdown-toggle" href="#" id="navbardrop"
						data-toggle="dropdown"> Image </a>
				</c:if>
				<div class="dropdown-menu">


					<a class="dropdown-item" href="AddImageToBank.jsp">Add Image</a> <a
						class="dropdown-item" href="ViewImageBank.jsp">View Image</a>

				</div></li>

			<!-- Dropdo%> -->
			<li class="nav-item dropdown"><c:if
					test="${sessionScope.currentUser.getRole() == 'ADMIN'}">
					<a class="nav-link dropdown-toggle" href="#" id="navbardrop"
						data-toggle="dropdown"> User</a>
				</c:if>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="AddUser.jsp">Add User</a> <a
						class="dropdown-item" href="ViewUser.jsp">View User</a>
				</div></li>
			<li class="nav-item"><a class="nav-link" href="AboutUs.jsp">About
					Us</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Contact Us</a>
			</li>



			<li class="nav-item"><c:if
					test="${sessionScope.currentUser.getRole() == 'user'}">
					<a class="nav-link" href="ViewCart.jsp">View Cart</a>
				</c:if></li>
			<li class="nav-item"><c:if
					test="${empty sessionScope.currentUser}">
					<a class="nav-link" href="Login.jsp"><i
						class="fas fa-unlock-alt"></i> Login</a>
			</c:if>
			</li>
			
	<li class="nav-item">
	<c:if test="${not empty sessionScope.currentUser}">
	
		<a class="nav-link" href="Logout"><i
				class="fas fa-sign-out-alt"></i> Logout</a>
	</c:if>
	</li>

		</ul>
	</div>
</nav>
