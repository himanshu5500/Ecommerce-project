<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Billing Details</title>
<style>
.panel-heading,td,th,input{font-size: 1.5em;}
.thumbnail{height:100px;}
</style>
<c:url value="/../header" var="head"/>
<jsp:include page="${head}"/>
<div class="container">
<table class="table"><tr><th colspan="2">
<div class="list-group-item list-group-item-info">
<center><h2><b>Billing Details</b></h2></center></div></th></tr>
				<form:form modelAttribute="orderDetails" action="${flowExecutionUrl}&_eventId_event2">
				<tr><th class="text-center" colspan="2"><h3><b>Billing Address</b></h3></th></tr>
				<tr><th>House Locality</th><td>
				<form:input path="billing.house_locality" class="form-control" required="required"/></td>
				</tr>
				<tr><th>City</th><td>
				<form:input path="billing.city" class="form-control" required="required" pattern="[A-Za-z]+[ ]*[A-Za-z]*" title="Enter a valid name"/></td>
				</tr>
				<tr><th>State</th><td>
				<form:input path="billing.state" class="form-control" required="required" pattern="[A-Za-z]+[ ]*[A-Za-z]*" title="Enter a valid name"/></td>
				</tr>
				<tr><th>Pincode</th><td>
				<form:input path="billing.pincode" class="form-control" pattern="[0-9]{6}" title="Pincode must be six digit long" maxlength="6"/></td>
				</tr>
				<tr><th class="text-center" colspan="2"><h3><b>Payment</b></h3></th></tr>
				<tr><th>Payment Mode</th><td>&nbsp;
				<label class="radio-inline"><form:radiobutton path="billing.pay_mode" value="Credit Card" required="true"/>Credit Card</label>
				<label class="radio-inline"><form:radiobutton path="billing.pay_mode" value="Internet Banking"/>Internet Banking</label>
				<label class="radio-inline"><form:radiobutton path="billing.pay_mode" value="Cash On Delivery"/>Cash On Delivery</label></td></tr>				
				<tr><td colspan="2">
<div class="row">
<div class="col-sm-offset-2 col-sm-3">
<a href="${flowExecutionUrl}&_eventId_back" class="btn btn-danger btn-block myBoldFont" id="goBack">Go Back</a>
</div><div class="col-sm-2"><span>&nbsp;</span></div>
<div class="col-sm-3">
<input type="submit" value="Place Order" class="btn btn-danger btn-block myBoldFont"/>

</div>
</div></td></tr></form:form>			
</table></div>
<%@include file="/WEB-INF/views/Footer.jsp"%>
</body>
</html>