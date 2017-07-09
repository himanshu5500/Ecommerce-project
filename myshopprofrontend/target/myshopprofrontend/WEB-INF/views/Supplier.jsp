<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@include file="header.jsp" %>
<div class="container">
<script type="text/javascript" src="<c:url value="/resources/js/inputform.js"/>"></script>
	<input type="hidden" value="${flag}" id="sh"/>
	<div class="panel-group">
		<div class="panel panel-primary">
			<div class="panel-heading">
			<button type="button" class="btn btn-danger btn-sm tt pull-right" id="myBtn">Add New Supplier</button>
			<span class="tttt">Supplier Details</span>
			</div>
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header t">
					    	<c:if test="${!flag}">Add Supplier</c:if>
						    <c:if test="${flag}">Update Supplier</c:if>
					    </div>
						<div class="modal-body" style="padding:40px 50px;">
							<c:if test="${flag}"><form action="../updateSupplier" method="post" class="form-horizontal"></c:if>
							<c:if test="${!flag}"><form action="addSupplier" method="post" class="form-horizontal"></c:if>
							<div class="form-group">
								<label class="control-label col-sm-5 tt" for="supName">Supplier Name</label>
								<div class="col-sm-7">
								<c:if test="${flag}"><input type="text" name="name" value="${supplier.sup_name}" id="supName" class="form-control"/></c:if>
								<c:if test="${!flag}"><input type="text" name="name" id="supName" class="form-control"/></c:if>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-5 tt" for="supAddress">Supplier Address</label>
								<div class="col-sm-7">
								<c:if test="${flag}"><textarea name="address" id="supAddress" class="form-control" rows="5" placeholder="Add Address">${supplier.sup_address}</textarea></c:if>
								<c:if test="${!flag}"><textarea name="address" id="supAddress" class="form-control" rows="5" placeholder="Add Address"></textarea></c:if>	
								</div>
							</div>
							<c:if test="${flag}"><input type="hidden" name="supId" value="${supplier.sup_id} "/></c:if>
							<div class="col-sm-6">
							<input type="submit" value="save" class="btn btn-success btn-block tt"/></div>
							<div class="col-sm-6">
							<c:if test="${!flag}"><button class="btn btn-danger btn-block tt" data-dismiss="modal">Cancel</button></c:if>
							<c:if test="${flag}"><a href="../Supplier" class="btn btn-danger btn-block tt">Cancel</a></c:if></div><br/>
							</form>
						</div>
					</div>
			    </div>
			</div>
		
			<div class="panel-body">
				<table class="table table-hover">
					<tr><th>SupId</th><th>Supplier Name</th><th>Supplier Address</th><th>Operation</th></tr>
					<c:forEach items="${supDetails}" var="supplier">
						<tr>
							<td>${supplier.sup_id}</td><td>${supplier.sup_name}</td><td>${supplier.sup_address}</td>
							<td>
								<a href="<c:url value="updateSupplier/${supplier.sup_id}"/>" id="update" class="btn btn-success tt">Update</a>
								<a href="<c:url value="deleteSupplier?supId=${supplier.sup_id}"/>" class="btn btn-danger tt">Delete</a>
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
