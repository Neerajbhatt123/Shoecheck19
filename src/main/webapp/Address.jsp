<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <c:import url="Shared.jsp"></c:import>
<style type="text/css">

.shadow-lg p-3 mb-5 bg-dark rounded{

}
.shadow-lg{
box-shadow: 20px 25px #888888 !important;
}

</style>

</head>
<body>

	<div class="shadow-lg p-3 mb-5 bg-dark rounded" style="margin-top: 100px;margin-left: 50px;margin-right: 50px;/*border: 5px solid black;*/padding: 15px;background: #efefef">
	<form action="AddAddressToDB">
	<div class="form-row">
    <div class="form-group col-md-6">
      <label for="addressEmail4">Email</label>
      <input type="email" class="form-control" name="addressEmail4" placeholder="Email">
    </div>
    <div class="form-group col-md-6">
      <label for="addressPassword4">Password</label>
      <input type="password" class="form-control" name="addressPassword4" placeholder="Password">
    </div>
  </div>
  <div class="form-group">
    <label for="addressAddress">Address</label>
    <input type="text" class="form-control" name="addressAddress" placeholder="1234 Main St">
  </div>
  <div class="form-group">
    <label for="addressAddress2">Address 2</label>
    <input type="text" class="form-control" name="addressAddress2" placeholder="Apartment, studio, or floor">
  </div>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="addressCity">City</label>
      <input type="text" class="form-control" name="addressCity">
    </div>
    <div class="form-group col-md-4">
      <label for="addressState">State</label>
      <select name="addressState" class="form-control">
        <option selected>Choose...</option>
        <option>Delhi</option>
        <option>Lucknow</option>
        <option>Mumbai</option>
      </select>
    </div>
    <div class="form-group col-md-2">
      <label for="addressZip">Zip</label>
      <input type="text" class="form-control" name="addressZip">
    </div>
  </div>
  <div class="form-row">
    <div class="form-group col-md-4">
      <label for="addressPhone">Phone</label>
      <input type="text" class="form-control" name="addressPhone" maxlength="10">
    </div>
    </div>
  <button type="submit" class="btn btn-primary">Payment </button>
</form>

</div>
</body>
</html>