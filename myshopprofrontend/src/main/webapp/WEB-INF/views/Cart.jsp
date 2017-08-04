<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cart</title>
<style>
.container{margin-top: 4em;}
.thumbnail{height:170px;}
</style>
<%@include file="header.jsp" %>
<div class="container">
<table class="table">
<div class="list-group-item list-group-item-info row"><h3><b>MY CART</b></h3></div>
<c:if test="${cartSize==0}">
<center><h3><b>Cart is Empty</b></h3></center>
</c:if>
<c:forEach items="${cartItems}" var="cartItem">
<tr><td rowspan="2">
<div class="thumbnail">
<img src='<c:url value="/resources/images/${cartItem.prod_id}"/>.jpg' alt="${cartItem.prod_name}" style="height:100%;"/>
</div></td><td>
	<h2>${cartItem.prod_name}</h2>
	<h2><i class="fa fa-inr"></i><b>${cartItem.price}</b></h2> 
    </td></tr>
    <tr><td>
    <div class="row">
    <div class="col-sm-4">
    Quantity : 
     <div class="btn-group"><a href="updateCart?id=${cartItem.cart_item_id}&action=decrease" class="btn btn-warning">
    <span class="glyphicon glyphicon-minus"></span></a><span class="btn">${cartItem.quantity}</span>
    <a href="updateCart?id=${cartItem.cart_item_id}&action=increase" class="btn btn-warning">
    <span class="glyphicon glyphicon-plus"></span></a>
    </div>
    </div>
    <div class="col-sm-1"><span>&nbsp;</span></div>
  
    <div class="col-sm-4"><a href="deleteCartItem?id=${cartItem.cart_item_id}" class="btn btn-danger btn-block">Remove</a>
        </div></div>
    </td></tr>
</c:forEach><tr><td colspan="3">
<div class="row" style="padding:2em;">
<c:if test="${cartSize==0}">
<a href="index" class="btn btn-success btn-block myBoldFont">Continue Shopping....</a>
</c:if>
<c:if test="${cartSize!=0}"><div class="col-sm-offset-2 col-sm-3">
<a href="index" class="btn btn-success btn-block myBoldFont">Continue Shopping....</a>
</div><div class="col-sm-2"><span>&nbsp;</span></div>
<div class="col-sm-3">
<a href="checkOut" class="btn btn-success btn-block myBoldFont">Check Out</a>
</div></c:if>
</div></td></tr></table></div>
<%@include file="/WEB-INF/views/Footer.jsp"%>
</body>
</html>