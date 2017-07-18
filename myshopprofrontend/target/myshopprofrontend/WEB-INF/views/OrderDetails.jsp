<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
td,th,input{font-size: 1.2em;}
.thumbnail{height:250px;}
</style>
<%@include file="header.jsp" %>

<div class="container">
<br/>
<div class="list-group-item list-group-item-info">
<center><h3><b>My Orders</b></h3></center></div>
<div style="box-shadow:0 0 10px grey;" class="table-responsive">
<div class="thumbnail col-sm-4">
<img src='<c:url value="/resources/images/${product.prod_id}"/>.jpg' alt="${product.prod_name}" style="height:100%;"/>
</div><div class="col-sm-8">
<table class="table">
<tr><td colspan="2">
	<h3>${product.prod_name}</h3>
	</td>
	</tr>
  <tr><td colspan="2"><h4><b>Order Id : ${order_id}</b></h4></td></tr>
  <tr><td><h4><b>Quantity : ${product.quantity}</b></h4></td>
  <td><b>Status : </b>Processing</td></tr>
<tr><th colspan="2">Shipping Address</th></tr>
<tr><td>${order.shipping.name}<br/>
	${order.shipping.house_locality}<br/>
	${order.shipping.city}<br/>
	${order.shipping.state} - ${order.shipping.pincode}<br/>
	Mobile : ${order.shipping.mobile}</td></tr>
	<tr><th colspan="2">Billing Address</th></tr>
<tr><td>${order.billing.house_locality}<br/>
	${order.billing.city}<br/>
	${order.billing.state} - ${order.billing.pincode}
	</td></tr>
<tr><th colspan="2">Payment Information</th></tr>
<tr><td><b>Payment Mode</b>${order.billing.pay_mode}</td><td><b>Amount : <i class="fa fa-inr"></i>${product.price*product.quantity}</b>
  </td></tr></table></div></div></a>
</div><br/>
<%@include file="/WEB-INF/views/Footer.jsp"%>
</body>
</html>