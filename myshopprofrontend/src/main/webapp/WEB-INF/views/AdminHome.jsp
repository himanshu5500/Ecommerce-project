<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<h2>
	<ul><li><a href="home">Home</a></li>
        <li><a href="Category">Category</a></li>
        <li><a href="Product">Product</a></li>
        <li><a href="Supplier">Supplier</a></li> 
        <li><a href="Test">About Us</a></li> 
		</ul><a href="<c:url value="/perform_logout"/>">Logout</a>
		</h2>
</body>
</html>