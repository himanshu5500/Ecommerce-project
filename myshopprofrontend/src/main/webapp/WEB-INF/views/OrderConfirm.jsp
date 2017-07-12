<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.panel-heading,td,th,input{font-size: 1.5em;}
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
	<td><h4><i class="fa fa-inr"></i><b>${cartItem.price*cartItem.quantity}</b></h4>
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


<div id="deliveryDetails" class="table-responsive">
<table class="table"><tr><th colspan="2">
<div class="list-group-item list-group-item-info">
<center><h3><b>Delivery and Payment Details</b></h3></center></div></th></tr>
				<form action="placeOrder" method="post">
				<tr><th>Deliver To</th><td>
				<input type="text" name="name" class="form-control" value="${user.full_name}"/></td>
				</tr>
				<tr><th>Mobile Number</th><td>
				<input type="text" name="mobile" class="form-control" value="${user.mobile}"/></td>
				</tr>
				<tr><th>Shipping Address</th><td>
				<textarea name="address" rows="3" class="form-control">${user.address}</textarea></td>
				</tr>
				<tr><th>Total Payable Amount</th><td>
				<i class="fa fa-inr"></i>${totalAmount}
				</td></tr>
				<tr><th>Payment Mode</th><td><label class="radio-inline"><input type="radio" name="payMode" value="Credit Card"/>Credit Card</label>
<label class="radio-inline"><input type="radio" name="payMode" value="Internet Banking"/>Internet Banking</label>
<label class="radio-inline"><input type="radio" name="payMode" value="Cash On Delivery"/>Cash On Delivery</label></td></tr>				
				<tr><td colspan="2">
<div class="row">
<div class="col-sm-offset-2 col-sm-3">
<span class="btn btn-danger btn-block tt" id="goBack">Go Back</span>
</div>
<div class="col-sm-offset-2 col-sm-3">
<input type="submit" value="Place Order" class="btn btn-danger btn-block"/>
</form>
</div>
</div></td></tr>				
</table></div></div>
<%@include file="/WEB-INF/views/Footer.jsp"%>
</body>
</html>