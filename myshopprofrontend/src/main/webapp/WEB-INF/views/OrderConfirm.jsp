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
<script>
$(document).ready(function(){
	$("#deliveryDetails").hide();
	$("#next").click(function(){
		$("#prodList").hide(500);
		$("#deliveryDetails").show(500);		
	});
	$("#goBack").click(function(){
		$("#deliveryDetails").hide(500);
		$("#prodList").show(500);		
	});
});
</script>
<div class="container">

<div id="prodList">
<table class="table"><tr><th colspan="3">
<div class="list-group-item list-group-item-info">
<center><h3><b>Review Order</b></h3></center></div></th></tr>


<c:forEach items="${cartItems}" var="cartItem">
<tr><td>
<div class="thumbnail">
<img src='<c:url value="/resources/images/${cartItem.prod_id}"/>.jpg' alt="${cartItem.prod_name}" style="height:100%;"/>
</div></td><td>
	<h4>${cartItem.prod_name}</h4>
	<h5>Quantity : ${cartItem.quantity}
    </h5>
	</td>
	<td><h4><span class="glyphicon glyphicon-usd"></span><b>${cartItem.price*cartItem.quantity}</b></h4>
  </td></tr>
<br/>
</c:forEach><tr><td colspan="3">
<div class="row">
<div class="col-sm-offset-2 col-sm-3">
<a href="showCart" class="btn btn-danger btn-block">Edit order</a>
</div>
<div class="col-sm-offset-2 col-sm-3">
<button class="btn btn-danger btn-block tt" id="next">Next</button>
</div>
</div></td></tr></table>
</div>


<div id="deliveryDetails">
<table class="table"><tr><th colspan="3">
<div class="list-group-item list-group-item-info">
<center><h3><b>Delivery and Payment Details</b></h3></center></div></th></tr>
	<tr><th>Name</th><td>${full_name}</td></tr>
				<tr><th>Mobile Number</th><td>${email}</td></tr>
				<tr><th>Address</th><td>${address}</td></tr>
				<tr><th>Total Payable Amount</th><td></td></tr>
				<tr><th>Payment Mode</th><td></td></tr>
				
				<tr><td colspan="3">
<div class="row">
<div class="col-sm-offset-2 col-sm-3">
<button class="btn btn-danger btn-block tt" id="goBack">Go Back</button>
</div>
<div class="col-sm-offset-2 col-sm-3">
<a href="placeOrder" class="btn btn-danger btn-block">Place Order</a>
</div>
</div></td></tr>				
</table></div></div>
<%@include file="/WEB-INF/views/Footer.jsp"%>
</body>
</html>