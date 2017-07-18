<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order Placed</title>
<c:url value="/../header" var="head"/>
<jsp:include page="${head}"/>
<div class="container">
<br/><center>
<div class="col-sm-offset-3 col-sm-6" style="box-shadow:0 0 10px grey;padding:16px;margin-bottom:25px;">
<img src="<c:url value="/resources/images/ordersuccess.png"/>" height=200 width=200/>
<h1><b>Order Placed Successfully</b></h1><br/>
<i><h2>Thank You For Choosing us</h2></i> <br/>
<div class="col-sm-5">
<a href="index" class="btn btn-success btn-block">Continue Shopping....</a>
</div>
<div class="col-sm-offset-2 col-sm-5">
<a href="myOrders" class="btn btn-success btn-block">View Orders</a>
</div>
</div>
</center>
</div>
<%@include file="/WEB-INF/views/Footer.jsp"%>
</body>
</html>