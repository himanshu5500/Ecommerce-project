<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@include file="header.jsp" %>
<script type="text/javascript" src="<c:url value="/resources/js/inputform.js"/>"></script>
<input type="hidden" value="${flag}" id="sh"/>
<form:form action="updateHomeProduct" modelAttribute="homeProduct" class="form-horizontal">
  <div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header t">
						    Choose Product
					    </div>
						<div class="modal-body" style="padding:40px 50px;">
						<div class="form-group">
						<label class="control-label col-sm-5 tt" for="supName">Select Product</label>
<div class="col-sm-7">
<form:select path="product.pro_id" class="form-control" id="supName">
<form:option value="0" label="----------- Select Product -----------"/>
<form:options items="${prolist}"/>
</form:select>
</div></div>
<form:input type="hidden" path="srNo" value="${homeProduct.srNo} "/>
<form:input type="hidden" path="barNumber" value="${homeProduct.barNumber} "/>
<div class="col-sm-6">
<input type="submit" value="save" class="btn btn-success btn-block tt"/></div>
<div class="col-sm-6">
<button class="btn btn-danger btn-block tt" data-dismiss="modal">Cancel</button></div><br/>
						</div></div></div></div>
  </form:form>
  <div class="panel-body table-responsive">
<table class="table table-hover ttt">
<tr><th colspan="3"><div class="list-group-item list-group-item-info">
<center><h3><b>Trending Products</b></h3></center></div></th></tr>
<tr><th>Slide Number</th><th>Product Name</th><th>Operation</th></tr>
<c:forEach items="${homeProducts}" var="homeProduct">
<c:if test="${homeProduct.barNumber<200}">
<tr>
<td>${homeProduct.barNumber}</td><td>${homeProduct.product.pro_name}</td>
<td>
<a href="<c:url value="updateHomeProducts?id=${homeProduct.srNo}"/>" id="update" class="btn btn-success tt">Edit</a>
</td></tr>
</c:if>
</c:forEach>
<tr><th colspan="3"><div class="list-group-item list-group-item-info">
<center><h3><b>New Launched Products</b></h3></center></div></th></tr>
<tr><th>Slide Number</th><th>Product Name</th><th>Operation</th></tr>
<c:forEach items="${homeProducts}" var="homeProduct">
<c:if test="${homeProduct.barNumber>200}">
<tr>
<td>${homeProduct.barNumber}</td><td>${homeProduct.product.pro_name}</td>
<td>
<a href="<c:url value="updateHomeProducts?id=${homeProduct.srNo}"/>" id="update" class="btn btn-success tt">Edit</a>
</td></tr>
</c:if>
</c:forEach>
</table>

</div>
<%@include file="/WEB-INF/views/Footer.jsp"%>

</body>
</html>