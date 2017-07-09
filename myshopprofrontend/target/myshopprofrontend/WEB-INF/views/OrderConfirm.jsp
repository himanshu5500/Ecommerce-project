<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.thumbnail{height:100px;}
</style>
<%@include file="header.jsp" %>
<div class="container">
<table class="table"><tr><th colspan="3">
<div class="list-group-item list-group-item-info">
<center><h3><b>Order Confirm</b></h3></center></div></th></tr>
<c:forEach items="${cartItems}" var="cartItem">
<tr><td>
<div class="thumbnail">
<img src='<c:url value="/resources/images/${cartItem.prod_id}"/>.jpg' alt="${cartItem.prod_name}" style="height:100%;"/>
</div></td><td>
	<h2>${cartItem.prod_name}</h2>
	<h3>Quantity : ${cartItem.quantity}
    </h3>
	</td>
	<td><h2><span class="glyphicon glyphicon-usd"></span><b>${cartItem.price*cartItem.quantity}</b></h2>
  </td></tr>
    </div></div></div><br/>
        </c:forEach><tr><td colspan="3">
<div class="row">
<div class="col-sm-offset-2 col-sm-3">
<a href="showCart" class="btn btn-danger btn-block">Edit order</a>
</div>
<div class="col-sm-offset-2 col-sm-3">
<a href="placeOrder" class="btn btn-danger btn-block">Place Order</a>
</div>
</div></td></tr></table></div>

<%@include file="/WEB-INF/views/Footer.jsp"%>
</body>
</html>