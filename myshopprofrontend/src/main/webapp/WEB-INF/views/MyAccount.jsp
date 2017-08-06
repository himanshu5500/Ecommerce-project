<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Account</title>
<style>.panel-heading,td,th{font-size: 2em;}
input,textarea{
border:0;background: white; width:400px
}
#nameField,#emailField,#addressField,#mobileField{font-size: 1em;}
</style>
<%@include file="header.jsp" %>
<script type="text/javascript" src="<c:url value="/resources/js/myaccount.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/inputform.js"/>"></script>
<div style="width:80%; margin:auto;margin-top:1.5em;">
<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header headStyle">
					    Change Password
					    </div>
						<div class="modal-body" style="padding:40px 50px;">
							<form action="changePass" method="post" class="form-horizontal">
							<div class="form-group">
								<label class="control-label col-sm-5 myBoldFont" for="currentPass">Current Password</label>
								<div class="col-sm-7">
								<input type="text" name="currentPass" id="currentPass" class="form-control" required pattern="[A-za-z0-9]{8,}" title="Atleast have 8 characters, special characters are not allowed"/>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-5 myBoldFont" for="newPass">New Password</label>
								<div class="col-sm-7">
								<input type="text" name="newPass" id="newPass" class="form-control" required pattern="[A-za-z0-9]{8,}" title="Atleast have 8 characters, special characters are not allowed"/>
								</div>
							</div>
							<div class="col-sm-6">
							<input type="submit" value="Change" class="btn btn-success btn-block myBoldFont"/></div>
							<div class="col-sm-6">
							<button class="btn btn-danger btn-block myBoldFont" data-dismiss="modal">Cancel</button>
							</div><br/>
							</form>
						</div>
					</div>
			    </div>
			</div>
<div class="panel-group">
		<div class="panel panel-primary">
			<div class="panel-heading text-center">
			<span>Account Details</span>
			</div>
	<div class="panel-body table-responsive">
				<table class="table"><form id="userTable" action="updateUser" method="post">
				<tr><th>Name</th><td>
				<input type="text" name="full_name" id="nameField" value="${user.full_name}" disabled required maxlength="25" pattern="[A-Za-z]+[ ]*[A-Za-z]*" title="Enter a valid name"/></td>
				<td><span class="glyphicon glyphicon-edit" id="nameBtn"></span><button type="submit" id="nameSave" class="btn btn-primary">Save</button></td></tr>
				<tr><th>Email ID</th><td>
				<input type="email" name="email" id="emailField" value="${user.email}" disabled required title="Enter a valid email address"/></td>
				<td><span class="glyphicon glyphicon-edit" id="emailBtn"></span><button type="submit" id="emailSave" class="btn btn-primary">Save</button></td></tr>
				<tr><th>Mobile Number</th><td>
				<input type="text" name="mobile" id="mobileField" value="${user.mobile}" disabled required pattern="[0-9]{10}" title="Enter a 10 digit mobile number" maxlength="10"/></td>
				<td><span class="glyphicon glyphicon-edit" id="mobileBtn"></span><button type="submit" id="mobileSave" class="btn btn-primary">Save</button></td></tr>
				<tr><th>Address</th><td>
				<textarea name="address" rows="3" id="addressField" disabled required maxlength="255">${user.address}</textarea></td>
				<td><span class="glyphicon glyphicon-edit" id="addressBtn"></span><button type="submit" id="addressSave" class="btn btn-primary">Save</button></td></tr>
				</form>
				<tr><th>Username</th><td colspan="2">${user.username}</td></tr>
				<tr><th>Password</th>
					<td colspan="2">
					<button type="button" class="btn btn-success btn-sm myBoldFont" id="myBtn">Change password</button> 
					<b>${info}</b>
					</td>
					</tr>
					<c:if test='<%=(String)session.getAttribute("user")!=null && ((String)session.getAttribute("user")).equals("user")%>'>
					<tr><th>Account</th>
					<td colspan="2">
					<a href="deactivateAccount" class="btn btn-danger btn-sm myBoldFont" id="myBtn">Deactivate Account</a> 
					</td>
					</tr></c:if>
				</table>
			</div>
</div></div></div>
<%@include file="/WEB-INF/views/Footer.jsp"%>
</body>
</html>