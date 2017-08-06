<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Review Order</title>
<style>
.panel-heading,td,th,input{font-size: 1.5em;}
.thumbnail{height:100px;}
</style>
<%@include file="header.jsp" %>
<div class="container">

<div id="prodList">
<table class="table"><tr><th colspan="3">
<div class="list-group-item list-group-item-info">
<center><h3><b>Review Order</b></h3></center></div></th></tr>


<c:forEach items="${cartItems}" var="cartItem">
<tr><td><div class="col-sm-4">
<div class="thumbnail">
<img src='<c:url value="/resources/images/${cartItem.prod_id}"/>.jpg' alt="${cartItem.prod_name}" style="height:100%;"/>
</div></div><div class="col-sm-8">
	<h4>${cartItem.prod_name}</h4>
	<h5>Quantity : ${cartItem.quantity}
    </h5></div>
	</td>
	<td><h4><i class="fa fa-inr"></i><b>${cartItem.price*cartItem.quantity}</b></h4>
  </td></tr>
<br/>
</c:forEach>
<tr><th>Total Payable Amount</th><td ><h3><i class="fa fa-inr"><b>${totalAmount}</b></i></h3></td></tr>
<tr><td colspan="2">
<div class="row">
<div class="col-sm-offset-2 col-sm-3">
<a href="showCart" class="btn btn-danger btn-block myBoldFont">Edit order</a>
</div><div class="col-sm-2"><span>&nbsp;</span></div>
<div class="col-sm-3">
<a href="shipping?cartId=${cartId}" class="btn btn-danger btn-block myBoldFont" id="next">Next</a>
</div>
</div></td></tr></table>
</div>
</div>
<%@include file="/WEB-INF/views/Footer.jsp"%>
</body>
</html>