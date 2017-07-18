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
<c:forEach items="${cartItems}" var="orderItem">
<br/><a href="Details?id=${orderItem.cart_item_id}">
<div style="box-shadow:0 0 10px grey;" class="table-responsive">
<div class="thumbnail col-sm-4">
<img src='<c:url value="/resources/images/${orderItem.prod_id}"/>.jpg' alt="${orderItem.prod_name}" style="height:100%;"/>
</div><div class="col-sm-8">
<table class="table">
<tr><td colspan="2">
	<h3>${orderItem.prod_name}</h3>
	</td>
	</tr>
  <tr><td colspan="2"><h4><b>Order Id : ${order_id}</b></h4></td></tr>
  <tr><td colspan="2"><h4><b>Quantity : ${orderItem.quantity}</b></h4></td></tr>
<tr><td><b>Status : </b>Processing</td><td><b>Amount : <i class="fa fa-inr"></i>${orderItem.price*orderItem.quantity}</b>
  </td></tr></table></div></div></a>
</c:forEach>
</div><br/>
<%@include file="/WEB-INF/views/Footer.jsp"%>
</body>
</html>