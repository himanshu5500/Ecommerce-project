<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@include file="header.jsp"%>
<div class="container">
	<script type="text/javascript" src="<c:url value="/resources/js/inputform.js"/>"></script>
	<input type="hidden" value="${flag}" id="sh"/>
	<div class="panel-group">
		<div class="panel panel-primary">
			<div class="panel-heading "><button type="button" class="btn btn-danger btn-sm tt pull-right" id="myBtn">Add New Product</button>
			<span class="tttt">Product Details</span>
				
			</div>
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header t">
						    <c:if test="${flag}">Update Product</c:if>
					    	<c:if test="${!flag}">Add Product</c:if>
					    </div>
						<div class="modal-body" style="padding:40px 50px;">
<form:form action="addProduct" modelAttribute="product" class="form-horizontal" enctype="multipart/form-data">
<div class="form-group">
<label class="control-label col-sm-5 tt" for="catName">Category</label>
<div class="col-sm-7">
<form:select path="cat_id" id="catName" class="form-control">
<form:option value="0" label="----------- Select Category -----------"/>
<form:options items="${catlist}"/>
</form:select></div></div>
<div class="form-group">
<label class="control-label col-sm-5 tt" for="proName">Product Name</label>
<div class="col-sm-7">
<form:input path="pro_name" class="form-control" id="proName"/>
</div></div>
<div class="form-group">
<label class="control-label col-sm-5 tt" for="proDesc">Product description</label>
<div class="col-sm-7">
<form:textarea path="pro_desc" class="form-control" id="proDesc" rows="5"/>
</div></div>
<div class="form-group">
<label class="control-label col-sm-5 tt" for="proImage">Upload image</label>
<div class="col-sm-7">
<form:input type="file" path="pro_image" class="form-control" id="proImage"/>
</div></div>
<div class="form-group">
<label class="control-label col-sm-5 tt" for="proPrice">Product Price</label>
<div class="col-sm-7">
<form:input path="pro_price" class="form-control" id="proPrice"/>
</div></div>
<div class="form-group">
<label class="control-label col-sm-5 tt" for="proQuantity">Product Quantity</label>
<div class="col-sm-7">
<form:input path="pro_quantity" class="form-control" id="proQuantity"/>
</div></div>
<div class="form-group"><label class="control-label col-sm-5 tt" for="supName">Supplier</label>
<div class="col-sm-7">
<form:select path="sup_id" class="form-control" id="supName">
<form:option value="0" label="----------- Select Supplier -----------"/>
<form:options items="${suplist}"/>
</form:select>
</div></div>
<c:if test="${flag}"><form:input type="hidden" path="pro_id" value="${product.pro_id} "/></c:if>
<div class="col-sm-6">
<input type="submit" value="save" class="btn btn-success btn-block tt"/></div>
<div class="col-sm-6">
<a href="Product" class="btn btn-danger btn-block tt">Cancel</a></div><br/>
</form:form>
</div>
</div>
</div>
</div>		
<div class="panel-body table-responsive">
<table class="table table-hover ttt">
<tr><th>Product Id</th><th>Product Name</th><th>Product Description</th><th>Price</th><th>Product Quantity</th><th>Category</th><th>Supplier</th><th colspan="2">Operation</th></tr>
<c:forEach items="${proDetails}" var="product">
<tr>
<td>${product.pro_id}</td><td>${product.pro_name}</td><td>${product.pro_desc}</td><td>${product.pro_price}</td><td>${product.pro_quantity}</td><td>${product.cat_id}</td><td>${product.sup_id}</td>
<td>
<a href="<c:url value="updateProduct?proId=${product.pro_id}"/>" id="update" class="btn btn-success tt">Update</a>
</td><td>
<a href="<c:url value="deleteProduct?proId=${product.pro_id}"/>" class="btn btn-danger tt">Delete</a>
</td>
</tr>
</c:forEach>
</table>
</div>
</div>
</div>
</div>
</body>
</html>