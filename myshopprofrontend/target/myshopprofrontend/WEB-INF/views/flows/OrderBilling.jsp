<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<%@include file="../header.jsp" %>
<div class="container">
<div id="deliveryDetails" class="table-responsive">
<table class="table"><tr><th colspan="2">
<div class="list-group-item list-group-item-info">
<center><h3><b>Billing Details</b></h3></center></div></th></tr>
				<form:form modelAttribute="orderDetails" action="${flowExecutionUrl}&_eventId_event2">
				<tr><th class="text-center" colspan="2">Billing Address</th></tr>
				<tr><th>House Locality</th><td>
				<form:input path="billing.house_locality" class="form-control"/></td>
				</tr>
				<tr><th>City</th><td>
				<form:input path="billing.city" class="form-control"/></td>
				</tr>
				<tr><th>State</th><td>
				<form:input path="billing.state" class="form-control"/></td>
				</tr>
				<tr><th>Pincode</th><td>
				<form:input path="billing.pincode" class="form-control"/></td>
				</tr>
				<tr><th class="text-center" colspan="2">Payment</th></tr>
				<tr><th>Total Payable Amount</th><td>
				<i class="fa fa-inr"></i>${totalAmount}
				</td></tr>
				<tr><th>Payment Mode</th><td>
				<label class="radio-inline"><form:radiobutton path="billing.pay_mode" value="Credit Card"/>Credit Card</label>
				<label class="radio-inline"><form:radiobutton path="billing.pay_mode" value="Internet Banking"/>Internet Banking</label>
				<label class="radio-inline"><form:radiobutton path="billing.pay_mode" value="Cash On Delivery"/>Cash On Delivery</label></td></tr>				
				<tr><td colspan="2">
<div class="row">
<div class="col-sm-offset-2 col-sm-3">
<a href="${flowExecutionUrl}&_eventId_back" class="btn btn-danger btn-block tt" id="goBack">Go Back</a>
</div>
<div class="col-sm-offset-2 col-sm-3">
<input type="submit" value="Next" class="btn btn-danger btn-block"/>

</div>
</div></td></tr>	</form:form>			
</table></div></div>
<%@include file="/WEB-INF/views/Footer.jsp"%>
</body>
</html>