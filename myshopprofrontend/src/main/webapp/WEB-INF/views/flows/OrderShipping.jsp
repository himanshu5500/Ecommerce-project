<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shipping Details</title>
<style>
.panel-heading,td,th,input{font-size: 1.5em;}
.thumbnail{height:100px;}
</style>
<c:url value="/../header" var="head"/>

<jsp:include page="${head}"/>
<div class="container">
<div id="deliveryDetails" class="table-responsive">
<table class="table"><tr><th colspan="2">
<div class="list-group-item list-group-item-info">
<center><h2><b>Delivery Details</b></h2></center></div></th></tr>
				<form:form action="${flowExecutionUrl}&_eventId_event1" modelAttribute="orderDetails">
				<tr><th>Deliver To</th><td>
				<form:input path="shipping.name" class="form-control" required="required" pattern="[A-Za-z]+[ ]*[A-Za-z]*" title="Enter a valid name"/></td>
				</tr>
				<tr><th>Mobile Number</th><td>
				<form:input path="shipping.mobile" class="form-control" required="required" pattern="[0-9]{10}" title="Enter a 10 digit mobile number" maxlength="10"/></td>
				</tr>
				<tr><th class="text-center" colspan="2"><h3><b>Shipping Address</b></h3></th></tr>
				<tr><th>House Locality</th><td>
				<form:input path="shipping.house_locality" class="form-control" required="required"/></td>
				</tr>
				<tr><th>City</th><td>
				<form:input path="shipping.city" class="form-control" required="required" pattern="[A-Za-z]+[ ]*[A-Za-z]*" title="Enter a valid name"/></td>
				</tr>
				<tr><th>State</th><td>
				<form:input path="shipping.state" class="form-control" required="required" pattern="[A-Za-z]+[ ]*[A-Za-z]*" title="Enter a valid name"/></td>
				</tr>
				<tr><th>Pincode</th><td>
				<form:input path="shipping.pincode" class="form-control" pattern="[0-9]{6}" title="Pincode must be six digit long" maxlength="6"/></td>
				</tr>
				<form:input type="hidden" path="username" value='<%=session.getAttribute("username")%>' class="form-control"/></td>
				<tr><td colspan="2">
<div class="row">
<div class="col-sm-offset-2 col-sm-3">
<a href="${flowExecutionUrl}&_eventId_back" class="btn btn-danger btn-block myBoldFont" id="goBack">Go Back</a>
</div><div class="col-sm-2"><span>&nbsp;</span></div>
<div class="col-sm-3">
<input type="submit" value="Next" class="btn btn-danger btn-block myBoldFont"/>
</div>
</div></td></tr>	</form:form>			
</table></div></div>
<%@include file="/WEB-INF/views/Footer.jsp"%>
</body>
</html>