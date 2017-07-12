<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@include file="header.jsp" %>
<div class="container">
<br/>
<script type="text/javascript" src="<c:url value="/resources/js/inputform.js"/>"></script>
	<input type="hidden" value="${flag}" id="sh"/>
	<div class="panel-group">
		<div class="panel panel-primary">
			<div class="panel-heading "><button type="button" class="btn btn-danger btn-sm tt pull-right" id="myBtn">Add New Category</button>
			<span class="tttt">Category Details</span>
				
			</div>
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header t">
					    	<c:if test="${!flag}">Add Category</c:if>
						    <c:if test="${flag}">Update Category</c:if>
					    </div>
						<div class="modal-body" style="padding:40px 50px;">
							<c:if test="${flag}"><form action="../updateCategory" method="post" class="form-horizontal"></c:if>
							<c:if test="${!flag}"><form action="addCategory" method="post" class="form-horizontal"></c:if>
							<div class="form-group">
								<label class="control-label col-sm-5 tt" for="homeCat">Home Category</label>
								<div class="col-sm-7">
								<select name="home_cat" id="homeCat" class="form-control">
								<c:if test="${!flag}"><option value="none" label="-------- Select Home Category --------"/></c:if>
								<c:if test="${flag}"><option value="${category.home_cat}">${category.home_cat}</option></c:if>
								<option value="Mobiles">Mobiles</option>
								<option value="Laptops">Laptops</option>
								<option value="Computer Accessories">Computer Accessories</option>
								<option value="Televisions">Televisions</option>
								</select>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-5 tt" for="catName">Category Name</label>
								<div class="col-sm-7">
								<c:if test="${flag}"><input type="text" name="name" value="${category.cat_name}" id="catName" class="form-control"/></c:if>
								<c:if test="${!flag}"><input type="text" name="name" id="catName" class="form-control"/></c:if>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-5 tt" for="catDesc">Category Description</label>
								<div class="col-sm-7">
								<c:if test="${flag}"><textarea name="desc" id="catDesc" class="form-control" rows="5" placeholder="Add Description">${category.cat_desc}</textarea></c:if>
								<c:if test="${!flag}"><textarea name="desc" id="catDesc" class="form-control" rows="5" placeholder="Add Description"></textarea></c:if>
								</div>
							</div>
							<c:if test="${flag}"><input type="hidden" name="catId" value="${category.cat_id} "/></c:if>
							<div class="col-sm-6">
							<input type="submit" value="save" class="btn btn-success btn-block tt"/></div>
							<div class="col-sm-6">
							<c:if test="${!flag}"><button class="btn btn-danger btn-block tt" data-dismiss="modal">Cancel</button></c:if>
							<c:if test="${flag}"><a href="../Category" class="btn btn-danger btn-block tt">Cancel</a></c:if></div><br/>
							</form>
						</div>
					</div>
			    </div>
			</div>
		
			<div class="panel-body table-responsive">
				<table class="table table-hover ttt">
					<tr><th>CatId</th><th>Category Name</th><th>Category Description</th><th>Operation</th></tr>
					<c:forEach items="${catDetails}" var="category">
						<tr>
							<td>${category.cat_id}</td><td>${category.cat_name}</td><td>${category.cat_desc}</td>
							<td>
								<a href="<c:url value="updateCategory/${category.cat_id}"/>" id="update" class="btn btn-success tt">Update</a>
								<a href="<c:url value="deleteCategory?catId=${category.cat_id}"/>" class="btn btn-danger tt">Delete</a>
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
