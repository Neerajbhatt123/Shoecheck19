<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<c:import url="Shared.jsp" />

</head>
<body>

<c:import url="Header.jsp" />

<h1 style="text-align: center;">Add Image To Bank</h1>
<hr>
<form method="post" action="UploadFile" enctype="multipart/form-data">
	
	<input style="width: 700px;margin-left: 300px;" type="file" name="myFile" class="form-control">
	
	<br>
	
	<input style="margin-left: 600px;" type="submit" value="ADD" class="btn btn-success"> 
	
</form>

</body>
</html>