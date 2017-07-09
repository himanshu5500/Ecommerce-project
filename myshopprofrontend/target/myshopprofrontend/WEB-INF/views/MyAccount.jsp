<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>.panel-heading,td,th{font-size: 2em;}</style>
<%@include file="header.jsp" %>
<script type="text/javascript" src="<c:url value="/resources/js/inputform.js"/>"></script>
<div style="width:80%; margin:auto;margin-top:1.5em;">
<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header t">
					    Change Password
					    </div>
						<div class="modal-body" style="padding:40px 50px;">
							<form action="changePass" method="post" class="form-horizontal">
							<div class="form-group">
								<label class="control-label col-sm-5 tt" for="currentPass">Current Password</label>
								<div class="col-sm-7">
								<input type="text" name="currentPass" id="currentPass" class="form-control"/>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-5 tt" for="newPass">New Password</label>
								<div class="col-sm-7">
								<input type="text" name="newPass" id="newPass" class="form-control"/>
								</div>
							</div>
							<div class="col-sm-6">
							<input type="submit" value="Change" class="btn btn-success btn-block tt"/></div>
							<div class="col-sm-6">
							<button class="btn btn-danger btn-block tt" data-dismiss="modal">Cancel</button>
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
	<div class="panel-body">
				<table class="table table-hover">
				<tr><th>Name</th><td>${user.full_name}</td></tr>
				<tr><th>Email ID</th><td>${user.email}</td></tr>
				<tr><th>Address</th><td>${user.address}</td></tr>
				<tr><th>Username</th><td>${user.username}</td></tr>
				<tr><th>Password</th>
					<td>
					<button type="button" class="btn btn-success btn-sm tt" id="myBtn">Change password</button> 
					<b>${info}</b>
					</td>
					</tr>
				</table>
			</div>
</div></div></div>

<%@include file="/WEB-INF/views/Footer.jsp"%>
</body>
</html>